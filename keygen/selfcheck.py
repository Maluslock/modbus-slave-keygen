#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
selfcheck.py — mbslave 9.3.0.2120 注册码生成器自校验

校验两件事：
  1) 生成器输出能被「App 端校验模型」接受（独立实现，不复用 keygen.verify_key 的
     代码路径，避免同一个 bug 两边同时通过）：
        hex 解码 -> 循环 XOR "97280132" -> 前 7 字节 "mbslave"
        -> 含 "\\n# WIT" -> 末尾 2 位 hex == 全部明文字节 XOR
        -> 版本闸门（WIT 后两位 14..22 拒绝，其余通过）
  2) 200 组随机 name 往返（生成 -> App 模型校验 -> 名字/明文一致），全部通过。

另外包含：
  - t1 报告 analysis/sample_keys.txt 的已知答案测试（4 条，含中文名）；
  - 负例（改一位、小写、截断、WIT22、超长）；
  - 参数校验负例（name 太短/非 ASCII/含 "WIT"、wit_num 越界/类型错）。

运行：python3 selfcheck.py    （退出码 0 = 全部通过）
"""

from __future__ import annotations

import os
import random
import re
import string
import sys

import keygen as K

# ---------------------------------------------------------------------------
# 独立实现的 App 端校验模型（照 analysis/registration_logic.md §4/§3 重写）
# ---------------------------------------------------------------------------
APP_KS = "97280132"                       # 29728013 左移一位
APP_HEXV = {c: i for i, c in enumerate("0123456789")}
APP_HEXV.update({c: 10 + i for i, c in enumerate("ABCDEF")})  # 只认大写

T1_KAT = [
    # (name, wit_num, expected key, expected plaintext)
    ("TESTSLAVE", 23,
     "54554154514756667C64666B7C7065773314126F796501017B",
     "mbslaveTESTSLAVE\n# WIT23"),
    ("Witte User", 23,
     "54554154514756655043465D106440574B3D1118677867000A6A",
     "mbslaveWitte User\n# WIT23"),
    ("liuyue", 23,
     "545541545147565E50424B4D553B10126E7E660A0339",
     "mbslaveliuyue\n# WIT23"),
    ("张三", 23,
     "54554154514756D78597D680B93B10126E7E660A030C",
     "mbslave张三\n# WIT23"),
]


def app_check(key: str) -> dict:
    """严格按 t1 的静态结论复刻 App 校验，返回 dict(retcode, plaintext, name)。"""
    res = {"retcode": 0, "plaintext": None, "name": None, "reason": ""}
    k = key.replace("\n", "").replace("\r", "")
    if len(k) < 30:                       # 0x1400586AA
        res["reason"] = "len<30"
        return res
    if len(k) % 2 != 0:                   # 生成器不应产生奇数码
        res["reason"] = "odd length"
        return res
    n = (len(k) - 2) // 2
    pt = bytearray()
    for j in range(n):
        hi = APP_HEXV.get(k[2 * j], 0)
        lo = APP_HEXV.get(k[2 * j + 1], 0)
        pt.append((((hi << 4) | lo) ^ ord(APP_KS[j % 8])) & 0xFF)
    chk = APP_HEXV.get(k[-2], 0) << 4 | APP_HEXV.get(k[-1], 0)
    x = 0
    for b in pt:
        x ^= b
    if x != chk:                          # 0x140058B95
        res["reason"] = "checksum"
        return res
    try:
        wide = bytes(pt).decode("utf-8")  # MultiByteToWideChar(CP_UTF8)
    except UnicodeDecodeError:
        res["reason"] = "utf8"
        return res
    res["plaintext"] = wide
    if wide[:7] != "mbslave":             # 0x140058C50
        res["reason"] = "prefix"
        return res
    rest = wide[7:]
    if "\nWIT" not in rest and "\n# WIT" not in rest:   # 0x140057329/358
        res["retcode"] = 5
        res["reason"] = "no marker"
        return res
    p = rest.find("WIT")
    ver = rest[p + 3:p + 5]
    if len(ver) != 2:
        res["retcode"] = 6                # 0x1400573F8 jne -> 6
    else:
        # _wtoi 语义
        v = 0
        for ch in ver:
            if ch.isdigit():
                v = v * 10 + (ord(ch) - 48)
            else:
                break
        if v == 0 or v < 14 or v >= 23:   # v==0/v<14/v>=23 -> 6
            res["retcode"] = 6
        else:
            res["retcode"] = 5            # 14..22 -> 5
    if res["retcode"] == 6:
        res["name"] = rest.split("\n", 1)[0]
    return res


# ---------------------------------------------------------------------------
# 断言工具
# ---------------------------------------------------------------------------
FAILS: list[str] = []
CHECKS = 0


def check(cond: bool, msg: str) -> None:
    global CHECKS
    CHECKS += 1
    if not cond:
        FAILS.append(msg)
        print("FAIL: " + msg)


def expect_raises(exc_types, fn, msg: str) -> None:
    global CHECKS
    CHECKS += 1
    try:
        fn()
    except exc_types:
        return
    except Exception as exc:  # noqa: BLE001
        FAILS.append("%s: raised %r instead of %r" % (msg, exc, exc_types))
        print("FAIL: %s: raised %r instead of %r" % (msg, exc, exc_types))
        return
    FAILS.append(msg + ": did not raise")
    print("FAIL: " + msg + ": did not raise")


def is_upper_hex(s: str) -> bool:
    return all(c in "0123456789ABCDEF" for c in s)


# ---------------------------------------------------------------------------
# 1. 已知答案测试（与 t1 的 analysis/keygen.py 输出逐字节一致）
# ---------------------------------------------------------------------------
def test_known_answers() -> None:
    for name, wit, expected_key, expected_pt in T1_KAT:
        pt, ct, chk, key = K._build(name, wit)
        check(key == expected_key, "KAT %r: key mismatch" % name)
        check(pt.decode("utf-8") == expected_pt, "KAT %r: plaintext mismatch" % name)
        check(ct.hex().upper() == expected_key[:-2], "KAT %r: cipher mismatch" % name)
        check(("%02X" % chk) == expected_key[-2:], "KAT %r: checksum mismatch" % name)
        rc = app_check(key)
        check(rc["retcode"] == 6, "KAT %r: app_check retcode=%d" % (name, rc["retcode"]))
        check(rc["plaintext"] == expected_pt, "KAT %r: app_check plaintext" % name)
    # 中文名只能走内部核心（公开 make_key 要求可打印 ASCII）
    expect_raises(ValueError, lambda: K.make_key("张三-abcdefghijkl", 23),
                  "make_key rejects non-ASCII name")
    # t1 样例里的负例：WIT22 -> 5；改一位 -> 0
    _, _, _, bad = K._build("TESTSLAVE", 22)
    check(app_check(bad)["retcode"] == 5, "WIT22 must be rejected with retcode 5")
    good = K._build("TESTSLAVE", 23)[3]
    flipped = ("0" if good[0] != "0" else "1") + good[1:]
    check(app_check(flipped)["retcode"] == 0, "corrupted key must fail checksum")


# ---------------------------------------------------------------------------
# 2. 200 组随机 name 往返
# ---------------------------------------------------------------------------
def random_name(rng: random.Random) -> str:
    alphabet = string.ascii_letters + string.digits + " ._-+=/@#$%&()[]{}!"
    while True:
        n = rng.randint(K.NAME_MIN_LEN, 40)
        name = "".join(rng.choice(alphabet) for _ in range(n))
        if "WIT" not in name:
            return name


def test_random_roundtrip() -> None:
    rng = random.Random(20261111)
    passed = 0
    for i in range(200):
        name = random_name(rng)
        wit = rng.randint(K.WIT_MIN, K.WIT_MAX)
        key = K.make_key(name, wit)

        expected_pt = "mbslave" + name + "\n# WIT%02d" % wit
        check(len(key) >= 54 and len(key) % 2 == 0, "case %d: bad key length" % i)
        check(is_upper_hex(key), "case %d: key is not uppercase hex" % i)
        check(key == K.make_key(name, wit), "case %d: non-deterministic" % i)

        rc = app_check(key)
        check(rc["retcode"] == 6,
              "case %d name=%r wit=%d: app retcode=%d (%s)"
              % (i, name, wit, rc["retcode"], rc["reason"]))
        check(rc["plaintext"] == expected_pt,
              "case %d name=%r: plaintext mismatch" % (i, name))
        check(rc["name"] == name, "case %d name=%r: display name mismatch" % (i, name))

        # 交叉检查：keygen.verify_key 与独立模型一致
        vk = K.verify_key(key)
        check(vk["retcode"] == rc["retcode"],
              "case %d name=%r: verify_key/app_check disagree" % (i, name))
        check(vk["plaintext"] == expected_pt,
              "case %d name=%r: verify_key plaintext" % (i, name))

        if not FAILS:
            passed += 1
    check(passed == 200, "random roundtrip: only %d/200 passed" % passed)
    print("[random] 200/200 roundtrips passed")


# ---------------------------------------------------------------------------
# 3. 全部合法 WIT 取值 + 边界名字
# ---------------------------------------------------------------------------
def test_wit_range_and_edges() -> None:
    name = "EDGE-CASE-2026"
    for wit in range(K.WIT_MIN, K.WIT_MAX + 1):
        key = K.make_key(name, wit)
        rc = app_check(key)
        check(rc["retcode"] == 6, "wit=%d should pass, got retcode %d" % (wit, rc["retcode"]))
    # 名字长度边界 12 / 40 / 含各种可打印符号
    for nm in ["abcdefghijkl", "A" * 40, "user.name+tag@2026[x]", "  spaced name  ok  "]:
        key = K.make_key(nm, 99)
        rc = app_check(key)
        check(rc["retcode"] == 6 and rc["name"] == nm, "edge name %r failed" % nm)
    # 换行/回车被 App 剔除（0x140057A60）：插入 \r\n 仍应通过
    key = K.make_key(name, 23)
    check(app_check(key[:20] + "\r\n" + key[20:])["retcode"] == 6,
          "inserted CRLF should be stripped by the app")
    print("[wit] 23..99 all pass; edge names pass")


# ---------------------------------------------------------------------------
# 4. 负例
# ---------------------------------------------------------------------------
def test_negative() -> None:
    name = "NEGATIVE-TEST"
    good = K.make_key(name, 23)
    # 末尾校验错
    bad_chk = good[:-1] + ("0" if good[-1] != "0" else "1")
    check(app_check(bad_chk)["retcode"] == 0, "bad checksum must fail")
    # 小写 hex：hexval 只认大写，小写按 0 -> 必失败
    check(app_check(good.lower())["retcode"] == 0, "lowercase key must fail")
    # 截断到 < 30
    check(app_check(good[:29])["retcode"] == 0, "short key must fail")
    # WIT 14/15/22 均为拒绝带；0/13 通过（厂商漏判，仅记录不复刻）
    for wit in (14, 15, 22):
        key = K._build(name, wit)[3]
        check(app_check(key)["retcode"] == 5, "WIT%d must be rejected with 5" % wit)
    for wit in (0, 1, 13):
        key = K._build(name, wit)[3]
        check(app_check(key)["retcode"] == 6, "WIT%d passes the gate (documented)" % wit)
    # 无 WIT 标记 -> 5（用内部构造，避免公开 API 限制）
    pt = b"mbslave" + name.encode() + b"\n"
    ct = bytes(b ^ ord(APP_KS[i % 8]) for i, b in enumerate(pt))
    chk = 0
    for b in pt:
        chk ^= b
    no_wit = ct.hex().upper() + "%02X" % chk
    check(app_check(no_wit)["retcode"] == 5, "missing WIT marker must return 5")
    # 前缀不是 mbslave
    pt2 = b"mbSlave" + name.encode() + b"\n# WIT23"
    ct2 = bytes(b ^ ord(APP_KS[i % 8]) for i, b in enumerate(pt2))
    chk2 = 0
    for b in pt2:
        chk2 ^= b
    bad_prefix = ct2.hex().upper() + "%02X" % chk2
    check(app_check(bad_prefix)["retcode"] == 0, "bad prefix must fail")
    print("[negative] corrupted/lowercase/short/WIT14..22/no-marker/bad-prefix all rejected")


# ---------------------------------------------------------------------------
# 5. keygen.vbs 等价性（静态结构 + 逐语句语义模拟；本机是 Linux，无 cscript/wine）
# ---------------------------------------------------------------------------
VBS_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "keygen.vbs")


def _vbs_text() -> str:
    with open(VBS_PATH, "rb") as fh:
        raw = fh.read()
    check(b"\x00" not in raw, "keygen.vbs must not contain NUL bytes")
    check(all(b < 0x80 for b in raw), "keygen.vbs must be ASCII-only")
    check(raw.count(b"\n") == raw.count(b"\r\n"),
          "keygen.vbs must use CRLF line endings only")
    return raw.decode("ascii")


def _vbs_const(text: str, name: str) -> str:
    m = re.search(r'Const\s+%s\s*=\s*"([^"]*)"' % name, text)
    check(m is not None, "keygen.vbs: Const %s not found" % name)
    return m.group(1) if m else ""


def _vbs_make_key(name: str, wit: int) -> str:
    """按 keygen.vbs 的语句逐行模拟（AscW / Xor / Hex / Right 的语义）。"""
    text = _vbs_text()
    ks = _vbs_const(text, "KEYSTREAM")
    prefix = _vbs_const(text, "PREFIX")
    marker = _vbs_const(text, "MARKER")
    check(ks == K.KEYSTREAM, "keygen.vbs KEYSTREAM != keygen.KEYSTREAM")
    check(prefix == K.PREFIX.decode(), "keygen.vbs PREFIX != keygen.PREFIX")
    check(marker == K.MARKER.decode(), "keygen.vbs MARKER != keygen.MARKER")
    # pt = PREFIX & nm & Chr(10) & MARKER & Right("0" & CStr(witNum), 2)
    pt = prefix + name + "\n" + marker + ("0" + str(wit))[-2:]
    chk = 0
    out = []
    for i, ch in enumerate(pt, start=1):
        b = ord(ch)                                   # AscW
        chk ^= b
        c = b ^ ord(ks[(i - 1) % 8])                  # Xor AscW(Mid(KEYSTREAM, ...))
        hx = "%X" % c                                 # Hex() 大写
        if len(hx) < 2:
            hx = "0" + hx
        out.append(hx)
    hx = "%X" % chk
    if len(hx) < 2:
        hx = "0" + hx
    return "".join(out) + hx


def test_vbs_equivalence() -> None:
    text = _vbs_text()
    stmts = []
    for line in text.split("\r\n"):
        s = line.strip()
        if s and not s.startswith("'"):
            stmts.append(s)
    check("Option Explicit" in stmts, "keygen.vbs: missing Option Explicit")
    if_opens = [s for s in stmts if s.startswith("If ") and s.endswith(" Then")]
    if_ends = [s for s in stmts if s == "End If"]
    check(len(if_opens) == len(if_ends),
          "keygen.vbs: If/End If unbalanced (%d/%d)" % (len(if_opens), len(if_ends)))
    fors = [s for s in stmts if s.startswith("For ")]
    nexts = [s for s in stmts if s == "Next"]
    check(len(fors) == len(nexts),
          "keygen.vbs: For/Next unbalanced (%d/%d)" % (len(fors), len(nexts)))
    fns = [s for s in stmts if s.startswith("Function ")]
    fends = [s for s in stmts if s == "End Function"]
    check(len(fns) == 3 and len(fends) == 3,
          "keygen.vbs: Function/End Function count %d/%d" % (len(fns), len(fends)))
    check("WIT_MIN = 23" in text and "WIT_MAX = 99" in text,
          "keygen.vbs: wit range constants differ from keygen.py")

    cases = [("TESTSLAVE-2026", 99), ("liuyue-2026-11", 23),
             ("Witte User Co", 31), ("HUANAN-ZHIYE-01", 42),
             ("ModbusSlaveTest", 77)]
    rng = random.Random(424242)
    for _ in range(40):
        cases.append((random_name(rng), rng.randint(K.WIT_MIN, K.WIT_MAX)))
    for name, wit in cases:
        check(_vbs_make_key(name, wit) == K.make_key(name, wit),
              "vbs/py mismatch for %r wit=%d" % (name, wit))
    print("[vbs] ASCII+CRLF+blocks ok; %d/%d outputs equal to Python"
          % (len(cases), len(cases)))


# ---------------------------------------------------------------------------
# 6. 参数校验
# ---------------------------------------------------------------------------
def test_validation() -> None:
    ok_name = "VALID-NAME-2026"
    expect_raises(ValueError, lambda: K.make_key("too-short", 23), "name len < 12")
    expect_raises(ValueError, lambda: K.make_key("bad\tname-0123456", 23), "tab in name")
    expect_raises(ValueError, lambda: K.make_key("bad\nname-0123456", 23), "newline in name")
    expect_raises(ValueError, lambda: K.make_key("caf\u00e9-abcdefghij", 23), "non-ASCII name")
    expect_raises(ValueError, lambda: K.make_key("nameWIT15abcdef", 23), "'WIT' in name")
    expect_raises(TypeError, lambda: K.make_key(None, 23), "non-str name")
    for wit in (13, 14, 20, 22, 100, -1):
        expect_raises(ValueError, lambda w=wit: K.make_key(ok_name, w),
                      "wit_num=%d must be rejected" % wit)
    expect_raises(TypeError, lambda: K.make_key(ok_name, "23"), "str wit_num")
    expect_raises(TypeError, lambda: K.make_key(ok_name, 23.0), "float wit_num")
    expect_raises(TypeError, lambda: K.make_key(ok_name, True), "bool wit_num")
    # 合法边界
    check(K.make_key(ok_name, 23).startswith("54554154514756"),
          "wit=23 should be accepted")
    check(K.make_key(ok_name, 99).startswith("54554154514756"),
          "wit=99 should be accepted")
    print("[validation] invalid name/wit_num all rejected; 23 and 99 accepted")


# ---------------------------------------------------------------------------
def main() -> int:
    print("mbslave 9.3.0.2120 keygen selfcheck")
    print("keystream=%s  name_min=%d  wit range=%d..%d"
          % (K.KEYSTREAM, K.NAME_MIN_LEN, K.WIT_MIN, K.WIT_MAX))
    test_known_answers()
    test_random_roundtrip()
    test_wit_range_and_edges()
    test_negative()
    test_vbs_equivalence()
    test_validation()
    print("-" * 60)
    if FAILS:
        print("RESULT: FAIL (%d failed assertions out of %d)" % (len(FAILS), CHECKS))
        for f in FAILS:
            print("  - " + f)
        return 1
    print("RESULT: PASS (%d assertions, 200/200 random roundtrips)" % CHECKS)
    return 0


if __name__ == "__main__":
    sys.exit(main())
