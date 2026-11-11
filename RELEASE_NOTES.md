# v1.0.0 — Modbus Slave 9.3.0.2120 (x64) 注册机

首个正式版本。算法由静态反汇编完整还原，并在真机 Windows 10 x64 上验证通过。

## 下载

| 文件 | 说明 |
|---|---|
| `ModbusSlave-Keygen-v1.0.0.zip` | 一键包（HTA + VBS + 现成授权 + 使用说明） |
| `ModbusSlave-Keygen.hta` | 图形界面注册机，双击运行，零依赖 |
| `keygen.vbs` | 命令行生成器 |
| `license-TESTSLAVE-2026.reg` | 实测生效的授权文件 |

## 快速使用

1. 双击 `ModbusSlave-Keygen.hta`
2. 填注册名（4–40 字符，不能含 `WIT`），WIT 编号保持 `99`
3. **生成注册码** → **写入本机并生效**
4. 关闭并重新打开 Modbus Slave

命令行：`cscript //nologo keygen.vbs "MY-NAME-2026" 99`

## 验证结论

- About 显示 `This product is licensed to: <注册名>` ✅
- 冷启动 3/3 次稳定读到授权 ✅
- `F5` Connect 无未注册/过期弹窗，`LISTEN 0.0.0.0:502` ✅
- 570 s 连续会话、19 次采样，无 10 分钟断连 ✅
- 未发现 "注册后数据不刷新" 反盗版暗桩 ✅

## 算法要点

```
keystream = "97280132"        # 0x01C59D0D = 29728013，十进制串左移一位循环
plaintext = "mbslave" + name + "\n" + "# WIT99"
cipher[i] = plaintext[i] XOR keystream[i % 8]
key       = 大写十六进制(cipher) + 末 2 位校验字节
```

三个必须踩对的细节：

1. 注册码必须是**大写十六进制**（解析器把 `a-f` 静默当 `0`）
2. WIT 编号只能 **23–99**（14–22 被判为 "version 5 - 8" 旧码）
3. 注册名不能含 `WIT`（会被当成版本号解析）

## 回滚

```bat
reg delete "HKCU\Software\Witte Software\mbslave\Register" /f
```

## 校验和

```
ModbusSlave-Keygen-v1.0.0.zip  sha256 88aa03e23dcddb8d…
ModbusSlave-Keygen.hta         sha256 3b0a4ed296cb5f9a…
```
