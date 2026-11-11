#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
mbslave 9.3.0.2120 (x64) 注册码生成器（Python 参考实现）

逆向依据（VA，imagebase 0x140000000；详见 analysis/registration_logic.md）：
  - 校验器        0x140058570 (ecx=0x1c59d0d, rdx=wstring* key) -> al=1 通过
  - 版本/旧码判定 0x140057030 (rcx=wstring* key) -> eax: 0=非法 4=v4 旧码
                                                        5=版本 5-8 旧码(拒绝) 6=通过
  - 启动加载      0x140058290：eax==6 -> byte[0x140257490]=1（licensed）
  - 对话框 OK     0x1400576F0：eax==6 -> 写
                  HKCU\\Software\\Witte Software\\mbslave\\Register 值 "Key" (REG_SZ)

算法（与 t1 报告逐要素一致）：
  keystream = "29728013" 左移一位循环 -> "97280132"
  plaintext = b"mbslave" + name(UTF-8) + b"\\n" + b"# WIT" + 两位十进制版本号
  cipher[i] = plaintext[i] ^ ord(keystream[i % 8])
  key       = cipher.hex().upper() + "%02X" % xor_all(plaintext)

关键约束（t1 静态分析结论）：
  1) 注册码必须是大写十六进制：hexval(0x140051c40) 只认 '0'-'9' 与 'A'-'F'，
     小写字母一律按 0 处理（静默错值），因此小写码必然校验失败。
  2) 版本号闸门（9.x 新增，0x1400573F8..0x140057414）：WIT 后两位数字
     v == 0 / v < 14 / v >= 23 / 非纯数字 / 不足 2 位  -> 返回 6（通过）
     14 <= v <= 22                                      -> 返回 5（拒绝）
     因此本生成器只接受 23..99（落在任务要求的 20..99 内，且避开拒绝带）。
  3) 校验器要求去掉 \\n/\\r 后长度 >= 30（0x1400586AA），调用方另要求 >= 31
     （0x1400572AF）。name 长度 >= 12 时 key 长度 >= 54，满足。
  4) name 中不允许出现大写 "WIT"：App 的版本闸门取的是解密串里**第一个**
     "WIT" 后的两位，若名字里自带 "WIT" + 14..22 会把好码误判为旧码。

本文件只依赖标准库。Python >= 3.8。
"""

from __future__ import annotations

import json
import sys

# ---------------------------------------------------------------------------
# 常量（全部来自 t1 的静态证据，地址为 VA）
# ---------------------------------------------------------------------------
XOR_KEY_DECIMAL = 29728013          # mov ecx,0x1c59d0d @0x1400572FF（十进制 29728013，勿写成 29758013）
XOR_KEY_TEXT = str(XOR_KEY_DECIMAL)  # "29728013"（0x1400586D3 用 L"%d" 格式化）
KEYSTREAM = XOR_KEY_TEXT[1:] + XOR_KEY_TEXT[0]  # "97280132"（取 [(i+1)%8]）

PREFIX = b"mbslave"                 # 前缀比对 0x140058C50，串 @0x1401D6248
MARKER = b"# WIT"                   # 0x140057329/0x140057358 子串检查
PLAINTEXT_SEP = b"\n"

NAME_MIN_LEN = 12                   # 任务约束；App 实际只要 key >= 31 字符
WIT_MIN = 23                        # 版本闸门：14..22 拒绝
WIT_MAX = 99
WIT_REJECT_LO = 14
WIT_REJECT_HI = 22

_HEXVAL = {c: i for i, c in enumerate("0123456789")}
_HEXVAL.update({c: 10 + i for i, c in enumerate("ABCDEF")})  # 仅大写，见 hexval


# ---------------------------------------------------------------------------
# 参数校验
# ---------------------------------------------------------------------------
def validate_name(name: str) -> str:
    """校验注册名：可打印 ASCII（0x20..0x7E）、长度 >= 12、不含大写 "WIT"。

    说明：App 的 payload 走 MultiByteToWideChar(CP_UTF8)，中文名其实合法；
    本生成器按任务要求限制为可打印 ASCII，并在 README 记录该差异。
    """
    if not isinstance(name, str):
        raise TypeError("name must be str, got %r" % (type(name).__name__,))
    if len(name) < NAME_MIN_LEN:
        raise ValueError(
            "name must be at least %d printable ASCII characters (got %d)"
            % (NAME_MIN_LEN, len(name))
        )
    for ch in name:
        o = ord(ch)
        if o < 0x20 or o > 0x7E:
            raise ValueError(
                "name must contain only printable ASCII (0x20-0x7E); "
                "bad character %r (U+%04X) at index %d"
                % (ch, o, name.index(ch))
            )
    if "WIT" in name:
        raise ValueError(
            "name must not contain the uppercase substring 'WIT': the app's "
            "version gate reads the first 'WIT' in the decrypted string, so a "
            "name like 'XXWIT15' would make an otherwise valid key look like a "
            "version 5-8 key (retcode 5)."
        )
    return name


def validate_wit_num(wit_num: int) -> int:
    """校验 WIT 版本号。

    t1 结论（0x1400573F8..0x140057414）：
      - 14..22 -> 返回 5（拒绝，提示 "This license key is for version 5 - 8."）
      - 其它（0..13、>=23）与版本号解析失败 -> 返回 6（通过）
    任务要求落在 20..99（"19 < XX < 100"）；20..22 恰好落在拒绝带，
    因此本生成器实际接受 23..99，并在 README 写明与任务文字的差异。
    """
    if isinstance(wit_num, bool) or not isinstance(wit_num, int):
        raise TypeError("wit_num must be int, got %r" % (type(wit_num).__name__,))
    if wit_num < WIT_MIN or wit_num > WIT_MAX:
        if WIT_REJECT_LO <= wit_num <= WIT_REJECT_HI:
            raise ValueError(
                "wit_num %d is rejected by mbslave 9.3: the version gate maps "
                "%d..%d to retcode 5 ('This license key is for version 5 - 8.')"
                % (wit_num, WIT_REJECT_LO, WIT_REJECT_HI)
            )
        raise ValueError(
            "wit_num must be in %d..%d (got %d); values 14..22 are rejected by "
            "the app's version gate and values 0..13 are not 9.x markers"
            % (WIT_MIN, WIT_MAX, wit_num)
        )
    return wit_num


# ---------------------------------------------------------------------------
# 核心算法
# ---------------------------------------------------------------------------
def _build(name: str, wit_num: int) -> tuple[bytes, bytes, int, str]:
    """不做参数校验的核心实现：返回 (plaintext, cipher, checksum, key)。

    单独暴露出来供 selfcheck 做“已知答案测试”（t1 的样例里含 6 字符名字与
    中文名字，不能通过 make_key 的公开校验）。
    """
    ver = b"%02d" % wit_num
    plaintext = PREFIX + name.encode("utf-8") + PLAINTEXT_SEP + MARKER + ver
    cipher = bytes(b ^ ord(KEYSTREAM[i % 8]) for i, b in enumerate(plaintext))
    checksum = 0
    for b in plaintext:
        checksum ^= b
    key = cipher.hex().upper() + "%02X" % checksum
    return plaintext, cipher, checksum, key


def make_key(name: str, wit_num: int = 99) -> str:
    """生成注册码。

    Args:
        name: 注册名（可打印 ASCII，长度 >= 12，不含大写 "WIT"）。
        wit_num: WIT 版本号，23..99（默认 99；14..22 会被 App 拒绝）。

    Returns:
        大写十六进制注册码，末尾 2 位为全明文字节 XOR 校验。
    """
    validate_name(name)
    validate_wit_num(wit_num)
    return _build(name, wit_num)[3]


def make_key_details(name: str, wit_num: int = 99) -> dict:
    """生成注册码并返回全部中间量，便于人工核对。"""
    validate_name(name)
    validate_wit_num(wit_num)
    plaintext, cipher, checksum, key = _build(name, wit_num)
    return {
        "name": name,
        "wit_num": wit_num,
        "plaintext": plaintext.decode("utf-8"),
        "plaintext_escaped": plaintext.decode("utf-8").replace("\n", "\\n"),
        "plaintext_hex": plaintext.hex().upper(),
        "keystream": KEYSTREAM,
        "cipher_hex": cipher.hex().upper(),
        "checksum": "%02X" % checksum,
        "key": key,
        "key_len": len(key),
    }


# ---------------------------------------------------------------------------
# App 端校验模型（0x140058570 + 0x140057030）
# ---------------------------------------------------------------------------
def hexval(ch: str) -> int:
    """hexval 0x140051C40：只认 '0'-'9' 与 'A'-'F'，其余（含小写）返回 0。"""
    return _HEXVAL.get(ch, 0)


def _wtoi(s: str) -> int:
    """近似 _wtoi/wcstol：跳过前导空白，取可选符号 + 十进制前缀。"""
    i, n, neg = 0, 0, False
    while i < len(s) and s[i] in " \t":
        i += 1
    if i < len(s) and s[i] in "+-":
        neg = s[i] == "-"
        i += 1
    while i < len(s) and s[i].isdigit():
        n = n * 10 + int(s[i])
        i += 1
    return -n if neg else n


def verify_key(key: str) -> dict:
    """复刻 App 的注册码校验，返回判定结果。

    返回 dict:
        retcode: 0=非法 5=版本 5-8 旧码(拒绝) 6=通过
        ok: retcode == 6
        reason: 人类可读的判定说明
        plaintext: 解码后的明文字符串（失败时为 None）
        name: 从明文里取出的注册名（明文 = mbslave + name + "\\n" + "# WITxx"）
    """
    out = {
        "retcode": 0,
        "ok": False,
        "reason": "",
        "plaintext": None,
        "name": None,
    }
    if not isinstance(key, str):
        out["reason"] = "key is not a string"
        return out

    k = key.replace("\n", "").replace("\r", "")  # 0x140057A60 去 \n \r
    if len(k) > 0x258:                           # > 600 -> 0（0x140057030 开头）
        out["reason"] = "key longer than 600 chars"
        return out
    if k.startswith("TEMPORARY"):
        # 临时码分支（0x140057030 开头）与正式码无关，本模型不复刻
        out["reason"] = "temporary-key branch (TEMPORARY...) is not modelled"
        return out
    if len(k) < 31:                              # 调用方 0x1400572AF
        out["reason"] = "key shorter than 31 chars"
        return out
    if len(k) < 30:                              # 校验器 0x1400586AA（冗余）
        out["reason"] = "key shorter than 30 chars"
        return out

    # 主循环 0x140058724..0x1400589D8：N = (L-2)/2，整除
    n = (len(k) - 2) // 2
    if n <= 0:
        out["reason"] = "no payload bytes"
        return out
    pt = bytearray()
    for j in range(n):
        b = hexval(k[2 * j]) << 4 | hexval(k[2 * j + 1])
        pt.append((b ^ ord(KEYSTREAM[j % 8])) & 0xFF)

    # 校验字节 0x140058B5A..0x140058B98
    chk = hexval(k[-2]) << 4 | hexval(k[-1])
    x = 0
    for b in pt:
        x ^= b
    if x != chk:
        out["reason"] = "checksum mismatch (expected %02X, computed %02X)" % (chk, x)
        return out
    out["plaintext_bytes_hex"] = bytes(pt).hex().upper()

    # MultiByteToWideChar(CP_UTF8) @0x140058A15
    try:
        wide = bytes(pt).decode("utf-8")
    except UnicodeDecodeError:
        out["reason"] = "payload is not valid UTF-8"
        return out
    out["plaintext"] = wide

    # 前缀 0x140058C50
    if wide[:7] != "mbslave":
        out["reason"] = "missing 'mbslave' prefix"
        return out

    rest = wide[7:]
    # \nWIT / \n# WIT 子串检查 0x140057329/0x140057358
    if "\nWIT" not in rest and "\n# WIT" not in rest:
        out["retcode"] = 5
        out["reason"] = "no '\\nWIT' / '\\n# WIT' marker -> version 5-8 key"
        return out

    # 版本闸门 0x1400573F8..0x140057414
    p = rest.find("WIT")
    ver = rest[p + 3:p + 5]
    if len(ver) != 2:
        out["retcode"] = 6
        out["reason"] = "version substring shorter than 2 chars -> passes"
    else:
        v = _wtoi(ver)
        if v == 0 or v < WIT_REJECT_LO or v >= WIT_MIN:
            out["retcode"] = 6
            out["reason"] = "WIT version %r -> passes (v==0 / v<14 / v>=23)" % ver
        else:
            out["retcode"] = 5
            out["reason"] = (
                "WIT version %r is in the rejected 14..22 band "
                "('This license key is for version 5 - 8.')" % ver
            )
            return out

    out["ok"] = True
    # 明文尾部 = name + "\n" + "# WITxx"
    out["name"] = rest.split("\n", 1)[0]
    return out


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------
def _usage() -> str:
    return (
        "usage: python3 keygen.py [NAME] [WIT_NUM]\n"
        "       python3 keygen.py --json [NAME] [WIT_NUM]\n"
        "\n"
        "  NAME     注册名（可打印 ASCII，长度 >= 12，不含 'WIT'；默认 TESTSLAVE-2026）\n"
        "  WIT_NUM  WIT 版本号 23..99（默认 99；14..22 被 App 拒绝）\n"
    )


def main(argv: list[str]) -> int:
    args = list(argv[1:])
    as_json = False
    if "--json" in args:
        as_json = True
        args.remove("--json")
    if "-h" in args or "--help" in args:
        print(_usage(), end="")
        return 0
    if len(args) > 2:
        print(_usage(), end="", file=sys.stderr)
        return 2
    name = args[0] if len(args) >= 1 else "TESTSLAVE-2026"
    wit_num = 99
    if len(args) >= 2:
        try:
            wit_num = int(args[1], 10)
        except ValueError:
            print("ERROR: WIT_NUM must be a decimal integer", file=sys.stderr)
            return 2
    try:
        detail = make_key_details(name, wit_num)
    except (TypeError, ValueError) as exc:
        print("ERROR: %s" % exc, file=sys.stderr)
        return 2

    chk = verify_key(detail["key"])
    detail["app_verify"] = chk
    if as_json:
        print(json.dumps(detail, ensure_ascii=False, indent=2))
        return 0 if chk["ok"] else 3

    print("name      : %s" % detail["name"])
    print("wit_num   : %d" % detail["wit_num"])
    print("keystream : %s" % detail["keystream"])
    print("plaintext : %s" % detail["plaintext_escaped"])
    print("plaintext_hex : %s" % detail["plaintext_hex"])
    print("checksum  : %s" % detail["checksum"])
    print("key       : %s" % detail["key"])
    print("key_len   : %d" % detail["key_len"])
    print("app verify: retcode=%d (%s)" % (chk["retcode"], chk["reason"]))
    return 0 if chk["ok"] else 3


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
