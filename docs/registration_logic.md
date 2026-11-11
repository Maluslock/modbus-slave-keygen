# mbslave 9.3.0.2120 (x64) 注册校验与试用判定 — 静态分析报告

> **勘误（2026-11-11 实测修正）**：常量 `0x01C59D0D` 的十进制是 **29728013**，本文早期版本误写为 29758013（第 2、5 位颠倒），导致据此生成的码全部被程序判 0 拒绝。文中已统一修正为 29728013 / 密钥串 `97280132`；实机验证记录见 [verify.md](verify.md)。

- 目标：`/home/user/破解/mbslave.exe`（PE32+ x86-64，2631136 字节，FileVersion 9.3.0.2120，PDB `C:\Users\Brian Witte\Documents\vc\slavetrunk\x64\release\mbslave.pdb`）
- 基址 **0x140000000**；下文地址除特别说明均为 **VA**。RVA→文件偏移：`.text` RVA 0x1000 ↔ raw 0x400。
- 工具：objdump + capstone 5.0.9 + pefile（装于 `/home/user/破解/.pylibs`，脚本 `an.py` / `scan2.py` / `xref.py`），全库 9090 个函数 / 450884 条指令的交叉引用索引（`insns.pkl`）。
- 说明：本机为 Linux，无法执行 PE，**运行时验证需在 一台 Windows 10 x64 测试机 落地**。全部结论来自指令级静态证据 + 与公开 8.x/9.5 算法的逐条比对。

---

## 0. 一句话结论

注册算法与公开算法**完全一致**（密钥常量 0x01C59D0D → 十进制 "29728013" → 左移一位 "97280132" 循环 XOR，大写十六进制编码，末尾 2 位为全字节 XOR 校验），只有一处**版本号白名单**是 9.x 新增：`WIT` 后两位数字落在 **14..22** 时判为"version 5 - 8 旧码"而拒绝，其余一律接受。因此生成 `mbslave<name>\n# WIT23` 的码即为合法注册码。**未发现** Modbus Poll 式"数据不刷新"反盗版全局标志；未注册时只有"30 天到期提示 + 端口参数走降级值 100 + 10 分钟断连"三处降级，注册后（`byte[0x140257490]=1`）全部解除。

---

## 1. 结论表（算法要素 → 是否与公开算法一致 → 证据地址）

| 算法要素 | 公开算法（8.x/9.5） | 本样本实测 | 一致？ | 证据地址 |
|---|---|---|---|---|
| XOR 密钥常量 | 0x01C59D0D（十进制 29728013） | `mov ecx,0x1c59d0d`（全文件仅此 1 处出现） | ✅ | imm @ **0x140057300**（指令 0x1400572FF），文件偏移 0x56700 |
| 密钥串 | 常量十进制串左移 1 位 → `97280132` 循环 | `"%d"` 格式化 29728013 → "29728013"，取 `[(i+1)%8]` | ✅ | 0x1400586D3 格式化；0x14005876E–0x140058793 取 `[(i+1)%8]` |
| 明文格式 | `"mbslave" + 注册名 + "\n" + "# WITxx"` | 前缀 7 字节 `mbslave`，其余为 `名 + "\n" + "# WIT" + 两位` | ✅ | 前缀比对 0x140058C50；`mbslave` @0x1401D6248 |
| 编码 | 逐字节 XOR 后转 2 位十六进制拼接 | 每 2 个 hex 字符还原 1 字节，XOR 后写回 | ✅ | 0x140058742–0x1400587CB（hexval 0x140051C40，合成 0x140051CF0） |
| 大小写 | 公开样本为大写 | hexval **只认 '0'-'9' 与 'A'-'F'**，小写字母返回 0（静默错值） | ⚠️ 必须大写 | 0x140051C40：`lea eax,[rcx-0x41]; cmp al,5` 只处理 A–F |
| 末尾校验字节 | 全部明文字节 XOR，转 2 位十六进制 | 同样：累加串全部 wchar 低字节 XOR，与末 2 位 hex 比较 | ✅ | 0x140058B5A–0x140058B98（`xor r8b,[rbx+rcx*2]` / `cmp r8b,al`） |
| 明文长度下限 | ≥31 字符的 key | key 去 `\n\r` 后 ≥30 wchar（0x1400586AA），调用方另要求 ≥31（0x1400572AF） | ✅ | 0x1400586AA / 0x1400572AF |
| 换行/回车处理 | —（公开算法未提） | 解析前剔除全部 `\n`(0x0A) 与 `\r`(0x0D)，粘贴多行仍有效 | ➕ 新增细节 | 0x140057A60 ×2 调用 |
| 前缀检查 | 前 7 字节 == "mbslave" | 同上（第 8 个 wchar 比的是截断串自带的 NUL） | ✅ | 0x140058C50（r9=0x1401D6248，rdx 循环到 8） |
| `\nWIT` / `\n# WIT` 子串 | 二者其一存在 | 二者都不存在 → 返回 5（旧码拒绝） | ✅（但用于版本判定） | 0x140057329 / 0x140057358，串 @0x1401D6328 / 0x1401D6338 |
| **WITxx 版本号规则** | 无此规则 | **14 ≤ v ≤ 22 → 拒（"version 5 - 8"）；v==0 / v<14 / v≥23 / 非纯数字 / 不足 2 位 → 通过** | ➕ 9.x 新增 | 0x1400573F8–0x140057414，见 §3 |
| 注册态全局标志 | — | `byte 0x140257490`（licensed）、`dword 0x140257494`（days left） | ➕ | 见 §5、§6 |
| "数据不刷新"反盗版 | Modbus Poll 有此机制 | **未发现**；只有 100 值降级 + 10 分钟断连 | ❌ 无 | 见 §6 |

---

## 2. 常量 0x01C59D0D 的定位与注册路径确认

文件里 0x01C59D0D 只出现 **1 次**，就是下面这条指令的立即数（小端 `0d 9d c5 01`）：

```
1400572e7  mov      rcx, qword ptr [r14]
1400572ea  sub      rcx, 0x18
1400572ee  call     0x140002e60            ; 取一份 key 字符串副本（引用计数 +1）
1400572f3  add      rax, 0x18
1400572f7  mov      qword ptr [rbp - 0x21], rax   ; 副本（wstring*）
1400572fb  lea      rdx, [rbp - 0x21]             ; arg2 = 注册码字符串
1400572ff  mov      ecx, 0x1c59d0d             ; arg1 = 密钥常量  ← 常量在此
140057304  call     0x140058570                 ; 校验函数
140057309  test     al, al
14005730b  je       0x1400574a2                 ; 校验失败 → 走 v4 旧码检测
```

- 常量 VA：**0x140057300**（4 字节立即数，位于指令 `mov ecx,0x1c59d0d` @ 0x1400572FF 内）；文件偏移 0x56700。
- 所在函数：**0x140057030–0x140057598**（.pdata 记录），即注册码判定函数（arg: `rcx=wstring* key`, `dl=allow_reset`）。
- 唯一调用者：**0x140058570**（校验器，0x140058570–0x140058F69）；0x140058570 全文件仅被 0x140057304 调用，即常量只服务注册校验。
- 该函数的两个调用点都在注册路径上：
  - **0x140057771** ← 注册对话框 OK 处理函数 **0x1400576F0–0x140057A0A**（同一函数内 xref `L"Error in registration key"` @0x1401D5F80，见 0x1400577D4）；
  - **0x1400583E4 / 0x140058508** ← 启动加载函数 **0x140058290–0x140058564**（从注册表读 Key 并置 licensed 标志）。
- 结论：该常量确实在注册校验主路径，不是别的用途（无第二处引用，也不是 .rdata 常量池拷贝）。

---

## 3. 判定函数 0x140057030：返回码语义（关键！）

调用点两处都按 `eax==6` 认定"注册成功"，据此可确定返回码含义：

| eax | 含义 | 依据 |
|---|---|---|
| 0 | 非法码 | 0x1400577D4 弹 `Error in registration key`（style 0x30） |
| 4 | 版本 4 旧码 | 0x140070838(`"...version 4 and not valid for version 5 and newer."`) |
| 5 | **版本 5–8 旧码，拒绝** | 0x140070838(`"This license key is for version 5 - 8. ..."`) |
| 6 | **通过** | 对话框：`mov byte[0x140257490],1` + 写注册表（0x140057790）；启动：`mov byte[0x140257490],1`（0x1400583EE / 0x140058512） |

版本判定代码（0x1400573F8 起，操作对象是校验器写回的全局 `0x140257498`，即 key 解密后去掉前 7 字符 `mbslave` 的剩余串）：

```
1400573f8  cmp      dword ptr [rbx - 0x10], 2   ; 版本子串长度 != 2
1400573fc  jne      0x14005745b                 ;   -> eax=6 通过
1400573fe  mov      rcx, rbx
140057401  call     0x14017445c                 ; _wtoi(两位)
140057406  test     eax, eax
140057408  je       0x14005745b                 ; v==0        -> 6 通过
14005740a  cmp      eax, 0xe                    ; v < 14
14005740d  jl       0x14005745b                 ;   -> 6 通过
14005740f  cmp      eax, 0x17                   ; v >= 23
140057412  jge      0x14005745b                 ;   -> 6 通过
140057414  ...                                  ; 14..22 落到这里
140057448  mov      eax, 5                      ; -> 5 拒绝
```

- 14..22 恰好覆盖 "version 5 - 8" 的旧码区间，v≥23 视为 9.x 合法码；`v==0`、`v<14`、非纯数字、子串不足 2 位都是"意外放行"（厂商漏判，可放心利用，但**推荐用 23**，语义正确）。
- 另外：`\nWIT` 与 `\n# WIT` 都不存在时直接跳到 0x140057414 → 返回 **5**（不是 0）。
- 前置条件（0x140057030 开头）：
  - key 长度 ≥ 0x258(600) → 0（防超长）；
  - 前 10 wchar 等于 `L"TEMPORARY"`（@0x1401D6258）→ 走临时码分支：`days_left >= 10` 时接受(6)并把 `L"This license is temporary for evaluation only.\r\n"` 写入 license 文本；否则弹 `L"Your 20 days temporary key has expired."`、**删除注册表 Key** 并返回 0；
  - 否则 key 长度 < 31 → 0。

---

## 4. 校验器 0x140058570 的精确算法

签名：`bool __fastcall check(wchar_t key_int /*ecx=0x1c59d0d*/, std::wstring* key /*rdx*/)`，`al=1` 通过。

1. **长度**：`cmp dword[rax-0x10],0x1e` @0x1400586AA → 去 `\n\r` 后长度必须 ≥ 30。
2. **去换行**：0x140057A60 依次剔除 `'\n'`、`'\r'`（0x1400586C0 / 0x1400586D0 附近两次调用）。
3. **密钥串**：`L"%d"`(@0x1401C85F8) 把 ecx(29728013) 格式化成宽串 → `L"29728013"`（长 8），存 [rsp+0x58]（0x1400586D3）。
4. **主循环**（0x140058724–0x1400589D8），设 `L = 去换行后长度`，`N = (L-2)/2`（每轮重算，0x1400589BD–0x1400589D1），`j = 0..N-1`：
   - `byte = (hexval(key[2j]) << 4) | hexval(key[2j+1])`（hexval 0x140051C40；合并 0x140051CF0 = `shl cl,4; and dl,0xf; or cl,dl`）；
   - `byte ^= decimal_key[(j+1) % 8]` 的低字节（0x140058790: `rcx=[rsp+0x58]`, `eax=j+1`, `idiv r8d(8)`, `movzx edi, word[rcx+rdx*2]`；XOR 在 0x1400587B6/0x1400587C4）→ 即 `"97280132"[j % 8]`；
   - 明文字符写入 1 字符 wstring 并 `+=` 到累加串 [rsp+0x40]（0x1400587E0–0x14005894C 是内联的 wstring append）；
   - 同时把该字节写进 UTF-8 缓冲 [rbp-0x50]（memset 0x12C @0x140058696；`mov byte ptr [r10],al` @0x140058984，`inc r10`）。
5. **UTF-8 → 宽串**：0x1400589EE 补 `\0` 后 `MultiByteToWideChar(CP_UTF8=0xFDE9, 0, buf, -1, dst=[rbp+0xE0], 0x12C)` @0x140058A15；失败 → MessageBox `L"Error in registration calculation"`(@0x1401D6200) → 返回 0。
   （所以负载是 **UTF-8 字节**，中文注册名合法。）
6. **校验字节**：`0x140044480(key, out, 2)` 取**最后 2 个 wchar**（0x140058A9D；该 helper 语义=取尾部 n 字符，`n>=len` 时取整串），hexval 合并 → 期望值 (0x140058B37–0x140058B55)。
7. **比较**：`xr = XOR(累加串每个 wchar 的低字节)`（0x140058B6D–0x140058B8E），`cmp r8b, al` @0x140058B95，不等 → 0x140058C69 → 失败。
8. **前缀**：把累加串截成前 7 字符（0x140058C09–0x140058C33），与 `L"mbslave"`(@0x1401D6248) 逐 wchar 比到第 8 个（即自带 NUL），不等 → 失败（0x140058C50）。
9. **落盘**：成功时把累加串去掉前 7 字符的剩余串写入全局 `std::wstring 0x140257498`（`mov [rip+0x1fe667],rax` @0x140058E2A），返回 al=1。该全局随后被 0x140057030 做 `\nWIT` 判定、被 About/注册对话框显示为 "This product is licensed to: …"。

等价伪代码：

```
L = len(key.replace('\n','').replace('\r',''))
assert L >= 30
for j in range((L-2)//2):
    pt[j] = (hexval(key[2j])<<4 | hexval(key[2j+1])) ^ ord("97280132"[j%8])
assert xor_all(pt) == hexval(key[L-2])<<4 | hexval(key[L-1])
w = utf8(pt).decode()
assert w[:7] == "mbslave"
license_text = w[7:]          # 写入 0x140257498
```

---

## 5. 注册状态的存储与加载（可直接写注册表绕过对话框）

### 5.1 存储位置（settings 类：HKCU，键路径按最后一个 `\` 拆成"子键 + 值名"）

| 用途 | 注册表位置 | 值名 | 类型 | 证据 |
|---|---|---|---|---|
| 注册码 | `HKEY_CURRENT_USER\Software\Witte Software\mbslave\Register` | `Key` | **REG_SZ**（写入 `cbData = len*2+2`） | 串 @0x1401D61A0；拆分 wcsrchr('\\') @0x14005E487/0x14005D98C；RegSetValueExW type=1 @0x14005F6AB |
| 注册码（备选机位） | `HKEY_LOCAL_MACHINE\Software\Witte Software\mbslave\Register` | `Key` | REG_SZ | 第二次尝试 hive=0xFFFFFFFF80000002 @0x14005849C |
| 试用锚点 | `HKEY_CURRENT_USER\Software\Nogle\bbb1` | `Year` `Month` `Day` `Reset` `Expired` | **REG_DWORD**（type=4） | 串 @0x1401D63A0 / 0x1401D63D8 / 0x1401D63E8 / 0x1401D63F0 / 0x1401D6400 / 0x1401D6410；RegSetValueExW type=4 @0x14005F545；RegQueryValueExW type 4 @0x14005F11F |

> 拆分证据链（0x14005E2B0 内）：`0x14005E487` wcsrchr(name,'\\') 取最后一个反斜杠下标 → `0x14005E586–0x14005E5AC` 用 `0x140010850` 取出反斜杠起的尾部并回写 obj+0x10 → `0x14005E5D1` 起把开头多余的反斜杠剥掉（obj+0x10 最终 = `Key`）→ 此前 `0x14005E4BB` 已把 head 存入 obj+0x18。head 还会做环境变量展开（`0x14005E500` 处 wcschr('%') + 0x140138E9C）。
> 注：`Software\Nogle\bbb1` 与厂商名 "Witte Software" 不同源，属历史/与 Modbus Poll 共用的遗留路径，但 9.3.0.2120 确实只用它。

### 5.2 启动加载（0x140058290，由启动流程 0x140041880 在 0x140041A1E 调用一次）

```
1400583c4  mov byte[0x140257490], 0        ; 先清 licensed
1400583cb  xor ecx,ecx
1400583cd  call 0x140057d00               ; 刷新 days_left（只读，dl=0）
1400583d2  ... 读 HKCU\...\Register "Key"
1400583e4  call 0x140057030               ; dl=0
1400583e9  cmp eax,6 / jne -> 读 HKLM 再试一次（同样 cmp eax,6）
1400583ee  mov byte[0x140257490], 1        ; 命中即"已注册"
```

→ **不必走注册对话框**：直接把合法 REG_SZ 写进 `HKCU\Software\Witte Software\mbslave\Register\Key`，重启程序即生效（注册对话框只是"校验+写注册表+刷新显示"三步，见 0x1400576F0）。

### 5.3 对话框路径（0x1400576F0）便于人工落地

`0x140073C38(this,1)` → `0x140057B40(&this->0x218)` 取输入 → `0x140057030(key, dl=1)` → switch：0/4/5 弹框；6 则 `mov byte[0x140257490],1`（0x140057790）→ `jmp 0x1400577F4` 用 0x14005E2B0 写注册表 → 刷新 `This product is licensed to:` 文本。
（eax=0 时之后还有 `cmp byte[0x140257490],0; je …`，即未注册时不刷新显示。）

---

## 6. 30 天试用判定与"到期降级"

### 6.1 计算函数 0x140057D00（`dl=1` 表示"重置锚点"，仅临时码分支用）

```
now = time(NULL)                                    ; 0x14016E140
若 HKCU\Software\Nogle\bbb1\Year 不存在：
    Year  = localtime(now).tm_year+1900             ; 0x1400580xx
    Month = tm_mon+1 ; Day = tm_mday ; 写回
    return 30
否则：
    读 Year/Month/Day/Expired
    合法性：year >= 1970(0x7B2) ; (month-1) <= 11 ; (day-1) <= 30  否则 0x80004005
    t0 = mktime({year,month,day,0,0,0,-1})           ; 0x140177564
    days = (now - t0) / 86400                        ; 魔数乘 0x1845C8A0CE512957 + sar 13
    if (days > 30) || (Expired != 0):
        写 Expired = 1 ; return 0                    ; edi=0 → g_days_left=0
    else:
        return 30 - days                             ; days<0（时钟回拨）经 cmovns 归 0 → 又得 30 天
最后：g_days_left = eax  （dword 0x140257494，0x14005814C）
```

### 6.2 三处到期行为（全部以 `licensed==0` 为前提）

| 函数 | 行为 | 证据 |
|---|---|---|
| 0x1400581B0 | 启动提醒：`days_left==0` → 弹 `"Your 30 days trial period has expired."`；否则弹 `"You now have %i days left in your evaluation."`；`licensed!=0` 时直接跳过 | 0x1400581F8 / 0x140058208；调用点 0x1400410F7 |
| 0x140058F80 | `if (days_left != 0) return 0; if (licensed) return 0; MessageBox("Your 30 days trial period has expired."); return 1;` | 0x140058F84 / 0x140058F8D / 0x140058FA4 |
| 0x140057610 + 0x140044650 | `0x140057610`：`if (licensed) return 1;`，否则 `days_left > 24` 时返回 `(系统年份 < 2024)`。**未注册 → 返回 0** → 0x140044650 走 `counter > base+600` 检查，超时弹 `"The 10 minutes trial period has expired. The port is disconnected.\nYou have to restart…"` 并断连（0x1400446F2–0x14004473E）；**已注册 → 返回 1**，`counter>1` 时直接 tail-call 跳过限制（0x1400446DC–0x1400446EB） | 0x1400446CD–0x14004473E；串 @0x1401D1970 |

### 6.3 降级值 100（**不是** "数据不刷新"）

`0x140041320` / `0x1400414B0` 在 `0x140058F80()==1`（到期且未注册）时**直接返回 0x64(100)**，否则返回真实配置值（`[rbx+0x1E8]` / `-[rbx+0x1B0]`；`[rbx+0x1BC]!=0` 时返回 0xFF）。二者被端口参数路径 0x1400410C0 调用（0x14004112B/0x140041132），仅影响该处超时/节拍取值与随后格式化提示（格式串 `Setting port parameters %d failed…` @0x1401D1AF0）。

**反盗版标志核查结论**：全库交叉引用显示 `byte 0x140257490` 只有 4 个读者（0x140057623、0x1400577E7、0x1400581DA/0x1400581EF、0x140058F8D）+ 3 个写者（0x140057790、0x1400583EE、0x140058512，后两者等价于启动加载 + 0x1400583C4 清零）；`dword 0x140257494` 只有 0x1400570B7、0x140057658、0x1400581F8、0x140058F84 四处比较 + 0x14005814C 一处写入。**没有任何"注册后仍置位"的第二标志、没有把数据刷新/寄存器读写锁死的全局开关**；Modbus Poll 那类"数据不刷新"的规避条件在 mbslave 9.3 上不存在（唯一与 `WIT` 数字相关的判定就是 §3 的 14..22 版本闸门）。

---

## 7. 注册码生成器与样例

生成器：`analysis/keygen.py`（含 0x140058570 + 0x140057030 的 Python 复刻与自测）。

```
plaintext = b"mbslave" + name(UTF-8) + b"\n" + b"# WIT" + b"23"
ct[i]     = plaintext[i] ^ ord("97280132"[i % 8])
key       = ct.hex().upper() + "%02X" % xor_all(plaintext)
```

自测结果（`python3 analysis/keygen.py`，输出亦存 `analysis/sample_keys.txt`）：

| 注册名 | retcode | 注册码 |
|---|---|---|
| TESTSLAVE | 6（通过） | `54554154514756667C64666B7C7065773314126F796501017B` |
| liuyue | 6（通过） | `545541545147565E50424B4D553B10126E7E660A0339` |
| Witte User | 6（通过） | `54554154514756655043465D106440574B3D1118677867000A6A` |
| 张三（UTF-8 中文名） | 6（通过） | `54554154514756D78597D680B93B10126E7E660A030C` |
| TESTSLAVE（WIT22 负例） | 5（拒绝） | — |
| 任意改 1 位（负例） | 0（校验失败） | — |

生成任意名字：`python3 analysis/keygen.py "你的名字"`。

---

## 8. 落地与回退方案（给验证任务）

**方案 A（首选，注册码）**
1. 用 `analysis/keygen.py` 为 `TESTSLAVE`（或任意名）生成大写 hex 码；
2. 打开 mbslave → `Register…` 填 `Register name` = 生成时用的名字、`Registration Key` = 注册码 → OK；或直接写注册表：
   `HKCU\Software\Witte Software\mbslave\Register` → `Key`(REG_SZ) = 注册码（64 位视图）；
3. 重启 mbslave，验证：`About`/注册信息处不再显示 `<Unregistered>`（串 @0x1401D1840，0x140041BF0 在 0x140058F70()==0 时用它），而显示 `This product is licensed to: <名字>`（license 文本来自 0x140257498）；30 天提醒与 10 分钟断连都不再出现。

**方案 B（回退，重置试用）**
删除 `HKCU\Software\Nogle\bbb1` 整个子键（或把 `Year/Month/Day` 改成当前日期、`Expired`=0）→ 下次启动 0x140057D00 重新播种并返回 30 天。等价手动值：`Year`=当前年、`Month`=当前月、`Day`=当前日、`Reset`=0、`Expired`=0（全部 REG_DWORD）。

**方案 C（最后手段，补丁）**
`0x140058290` 的 0x1400583EE / 0x140058512 处把 `mov byte[0x140257490],1` 改成无条件执行，或把 0x140057030 的返回 6 强制；也可 patch 0x140058F84 的 `cmp` 让降级永不触发。（仅在前两者失败时使用。）

**风险/注意**
- 注册码必须**大写** hex；混合小写会被 hexval 静默当 0 → 校验失败。
- 不要把 WIT 后两位写成 14..22（会被判旧码）。
- 名字支持 UTF-8（中文名可行）；名字里不要含 `\nWIT` / `\n# WIT`。
- HKLM 那份 Key 也会被读（第二机会），如果测试机 HKLM 里残留旧码可能导致"看起来注册成功但显示旧版本"，排查时先看 HKCU。
- 静态分析未做运行时验证；`一台 Windows 10 x64 测试机` 上需实测：输入码 → 是否出现 `Error in registration key`、重启后是否 licensed。

---

## 9. 证据文件清单（analysis/）

| 文件 | 内容 |
|---|---|
| `registration_logic.md` | 本报告 |
| `keygen.py` | 生成器 + 校验模型（含自测） |
| `sample_keys.txt` | 示例注册码与负例输出 |
| `raw_0x58570_keyverify.asm` | 校验器 0x140058570–0x140058F69 全量反汇编（699 行） |
| `raw_0x576f0_checkkey.asm` | 注册对话框 OK 处理 0x1400576F0–0x140057A0A |
| `raw_f_57030.asm` `raw_f_57d00.asm` `raw_f_581b0.asm` `raw_f_58290.asm` `raw_f_58f80.asm` `raw_f_58fc0.asm` | 判定/试用/提醒/启动加载/到期检查/v4 旧码 |
| `raw_f_410c0.asm` `raw_f_41320.asm` `raw_f_414b0.asm` `raw_f_41bf0.asm` `raw_f_41880.asm` `raw_f_44650.asm` `raw_f_57610.asm` `raw_f_57a60.asm` `raw_f_575a0.asm` | 端口/降级/About/启动/10 分钟限制/时钟检查/去换行 |
| `raw_settings.asm` `raw_regcore.asm` `raw_regload_save.asm` | settings 类与 Reg* 读写（HKCU/HKLM、REG_SZ/REG_DWORD） |
| `xref_globals.txt` | 0x140257490 / 0x140257494 / 0x140257498 全部交叉引用 |
