# mbslave 9.3.0.2120 (x64) 注册码生成器

依据 t1 的静态分析结论实现（证据见 `../analysis/registration_logic.md`）。
本目录只包含生成/自校验工具，不改动 `analysis/`，也不做 Windows 落地（由 t3 执行）。

## 文件

| 文件 | 说明 |
|---|---|
| `keygen.py` | Python 参考实现：`make_key(name, wit_num=99) -> str`；另含 `make_key_details()`（输出明文/密钥串/密文/校验）与 `verify_key()`（复刻 App 端校验） |
| `keygen.vbs` | VBScript 等价实现，Windows 上 `wscript keygen.vbs [NAME] [WIT_NUM]` 直接运行（输出与 Python 版一致） |
| `selfcheck.py` | 自校验：独立实现 App 校验模型 + 200 组随机 name 往返 + 已知答案/负例/参数校验 + keygen.vbs 等价性（静态结构 + 语义模拟） |
| `keys.json` | 5 组候选注册码（不同 name 与 wit_num），字段 `name` / `key` / `plaintext`（另附 `wit_num`、`retcode`、`key_len`） |
| `README.md` | 本文件 |

## 用法

Linux（本机）：

```bash
python3 keygen.py "TESTSLAVE-2026" 99      # 打印明文、密钥串、校验、注册码
python3 keygen.py --json "TESTSLAVE-2026" 99
python3 selfcheck.py                        # 退出码 0 = 全部通过
```

Windows：

```bat
wscript keygen.vbs "TESTSLAVE-2026" 99
cscript //nologo keygen.vbs "TESTSLAVE-2026" 99
```

Python 调用：

```python
from keygen import make_key
key = make_key("TESTSLAVE-2026", 99)
```

## 算法（与 t1 报告逐要素一致）

```
keystream = "29728013" 左移一位循环  ->  "97280132"
plaintext = b"mbslave" + name(UTF-8) + b"\n" + b"# WIT" + 两位十进制版本号
cipher[i] = plaintext[i] ^ ord(keystream[i % 8])
key       = cipher.hex().upper() + "%02X" % xor_all(plaintext)
```

关键点（均来自 t1 的指令级证据）：

- XOR 密钥常量 `0x01C59D0D`（十进制 29728013），`mov ecx,0x1c59d0d` @ `0x1400572FF`，全文件仅此一处。
- 注册码必须**大写**十六进制：`hexval` @ `0x140051C40` 只认 `0-9` / `A-F`，小写字母按 0 处理（静默错值）。
- 末尾 2 位 hex = 全部明文字节 XOR（`0x140058B5A..0x140058B98`）。
- 前缀 `mbslave`（`0x140058C50`），明文必须包含 `\nWIT` 或 `\n# WIT`（`0x140057329` / `0x140057358`），否则返回 5。
- 校验器要求去掉 `\n`/`\r` 后长度 ≥ 30（`0x1400586AA`），调用方另要求 ≥ 31（`0x1400572AF`）。本生成器 name ≥ 12，key 长度 ≥ 54，满足。
- payload 走 `MultiByteToWideChar(CP_UTF8)`（`0x140058A15`），中文名在 App 侧合法；本生成器按任务要求只接受可打印 ASCII。

### 版本闸门（9.x 新增，`0x1400573F8..0x140057414`）

`WIT` 后两位数字 `v`：

| v | 返回码 | 结果 |
|---|---|---|
| `0` / `< 14` / `>= 23` / 非纯数字 / 不足 2 位 | 6 | 通过 |
| **14..22** | 5 | 拒绝（`This license key is for version 5 - 8.`） |

本生成器取 `wit_num = 99`（默认），合法范围 **23..99**。

## 与任务文字的差异（按"以 t1 为准"处理，在此写明）

1. **wit_num 范围**：任务写 `20..99`（"19 < XX < 100"），但 t1 证明 **20..22 落在 14..22 拒绝带**，生成的码会被 App 判为 version 5-8 旧码（返回 5）。因此本生成器接受 **23..99**，对 14..22（含 20..22）抛 `ValueError`。`20..23` 之外的 `0..13` 虽然也能通过 App 的漏判闸门，但不是 9.x 语义，同样不在生成器允许范围内。
2. **注册名限制**：任务要求"可打印 ASCII、长度 ≥ 12"。App 实际支持 UTF-8 中文名（t1 已给样例），但本生成器按任务收紧为可打印 ASCII（`0x20..0x7E`）；中文名可以用 `keygen._build()` 或 t1 的 `analysis/keygen.py` 生成。
3. **名字不能含大写 `WIT`**：App 的版本闸门取解密串里**第一个** `WIT` 后的两位。若名字含 `WIT15` 之类，会让合法码被误判为旧码，因此生成器直接拒绝含 `WIT` 的名字。

## 自校验

`python3 selfcheck.py` 当前结果：

```
RESULT: PASS (2196 assertions, 200/200 random roundtrips)
```

覆盖内容：

- **已知答案测试**：与 t1 的 `analysis/sample_keys.txt` 逐字节一致（`TESTSLAVE`、`Witte User`、`liuyue`、`张三` 四条，WIT23）。
- **200 组随机 name**（长度 12..40、可打印 ASCII、不含 `WIT`、wit 23..99）：生成 → 独立 App 模型校验 → 明文/显示名一致 → 与 `keygen.verify_key()` 交叉一致。
- **全部合法 wit 23..99** 通过；名字长度/符号边界通过；key 中插入 `\r\n` 后仍通过（App 会剔除）。
- **负例**：改一位、整串小写、截断 < 30、WIT 14/15/22、缺少 WIT 标记、错前缀，均被拒绝（返回 0 或 5）。
- **参数校验**：name 太短 / 含 Tab / 含换行 / 非 ASCII / 含 `WIT`、wit 越界 / 字符串 / 浮点 / bool，均抛异常。
- **keygen.vbs 等价性**：ASCII-only、CRLF、`If/End If`/`For/Next`/`Function` 块结构静态检查；按 VBS 语句逐行模拟（`AscW`/`Xor`/`Hex`/`Right`），45 组（5 组候选 + 40 组随机）输出与 Python 版完全一致。

说明：本机是 Linux，**没有执行过 `keygen.vbs`**（无 cscript/wine）。VBS 版是 Python 版的逐行等价翻译（同一常量、同一循环、`Hex()` 大写、同样的参数校验）；`selfcheck.py` 对 VBS 源码做了 ASCII-only / CRLF / 块结构静态检查与逐语句语义模拟（45/45 与 Python 一致）。VBScript 引擎上的真实行为待 t3 在 192.168.101.70 上用 `cscript //nologo keygen.vbs` 实测。

## keys.json 候选

| name | wit_num | key | 明文 |
|---|---|---|---|
| `TESTSLAVE-2026` | 99 | `54554154514756667C64666B7C7065771405020A063B10126E7E66010951` | `mbslaveTESTSLAVE-2026\n# WIT99` |
| `liuyue-2026-11` | 23 | `545541545147565E50424B4D551C01020B011F09013B10126E7E660A033F` | `mbslaveliuyue-2026-11\n# WIT23` |
| `Witte User Co` | 31 | `54554154514756655043465D106440574B1771573A1213657063010965` | `mbslaveWitte User Co\n# WIT31` |
| `HUANAN-ZHIYE-01` | 42 | `545541545147567A6C767C797E1C697A706E77150000391119607B6C04037C` | `mbslaveHUANAN-ZHIYE-01\n# WIT42` |
| `ModbusSlaveTest` | 77 | `545541545147567F5653504D43625F534F52665D4345391119607B6C070678` | `mbslaveModbusSlaveTest\n# WIT77` |

（全部经独立 App 模型与 `keygen.verify_key()` 校验，`retcode == 6`；机器可读版本见 `keys.json`。）

## 落地提示（给 t3）

- 注册码写入 `HKCU\Software\Witte Software\mbslave\Register` 的值 `Key`，类型 **REG_SZ**；或走程序 `Register…` 对话框（对话框要求 Register name 与生成时一致）。
- 启动加载函数 `0x140058290` 在 HKCU 校验通过（`eax==6`）后置 `byte[0x140257490]=1`，即 licensed；HKCU 失败还会尝试 HKLM 同路径。
- 失败排查：注册码必须大写；WIT 不要用 14..22；名字里不要含 `WIT`；先看 HKCU 是否有残留旧码。
- 回退方案（重置 30 天试用）：删除 `HKCU\Software\Nogle\bbb1` 子键，或把 `Year/Month/Day` 改为当前日期、`Expired`=0（均 REG_DWORD）；补丁方案见 t1 报告 §8。
