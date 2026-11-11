' keygen.vbs - mbslave 9.3.0.2120 (x64) registration key generator (VBScript)
'
' Equivalent to keygen.py. Run on Windows with:
'     wscript keygen.vbs [NAME] [WIT_NUM]
'     cscript //nologo keygen.vbs [NAME] [WIT_NUM]
'
' Defaults: NAME = TESTSLAVE-2026, WIT_NUM = 99.
'
' Algorithm (from static analysis of mbslave.exe 9.3.0.2120):
'   keystream = "97280132"  (decimal 29728013 shifted left by one digit)
'   plaintext = "mbslave" & name & Chr(10) & "# WIT" & two-digit WIT number
'   cipher[i] = plaintext[i] Xor Asc(keystream[i Mod 8])
'   key       = uppercase hex of cipher & uppercase hex of XOR of all plaintext bytes
'
' Notes:
'   * The app's hex parser accepts only 0-9 and A-F (lowercase silently becomes 0),
'     so the key must be uppercase - Hex() already returns uppercase.
'   * The 9.x version gate rejects WIT 14..22 ("version 5 - 8" key), everything
'     else passes; this script therefore requires WIT 23..99.
'   * The app reads the first "WIT" in the decrypted string, so the name must not
'     contain uppercase "WIT".
'   * This script is ASCII-only: the app supports UTF-8 names, but VBScript cannot
'     emit UTF-8 bytes portably, so only printable ASCII names are accepted here.

Option Explicit

Const PREFIX = "mbslave"
Const KEYSTREAM = "97280132"
Const MARKER = "# WIT"
Const NAME_MIN = 12
Const WIT_MIN = 23
Const WIT_MAX = 99

Dim args, nm, witNum, errMsg, pt, key, cipherHex, chk, i, b, c, hx, msg

Set args = WScript.Arguments

If args.Count > 2 Then
    WScript.Echo "usage: cscript //nologo keygen.vbs [NAME] [WIT_NUM]"
    WScript.Quit 2
End If

If args.Count >= 1 Then
    nm = args(0)
Else
    nm = "TESTSLAVE-2026"
End If

If args.Count >= 2 Then
    If Not IsAllDigits(args(1)) Then
        WScript.Echo "ERROR: WIT_NUM must be a decimal integer in " & WIT_MIN & ".." & WIT_MAX
        WScript.Quit 2
    End If
    witNum = CLng(args(1))
Else
    witNum = 99
End If

errMsg = ValidateName(nm)
If errMsg <> "" Then
    WScript.Echo "ERROR: " & errMsg
    WScript.Quit 1
End If

errMsg = ValidateWit(witNum)
If errMsg <> "" Then
    WScript.Echo "ERROR: " & errMsg
    WScript.Quit 1
End If

' plaintext bytes as a VBScript string (all characters are ASCII by validation)
pt = PREFIX & nm & Chr(10) & MARKER & Right("0" & CStr(witNum), 2)

chk = 0
cipherHex = ""
For i = 1 To Len(pt)
    b = AscW(Mid(pt, i, 1))
    chk = chk Xor b
    c = b Xor AscW(Mid(KEYSTREAM, ((i - 1) Mod 8) + 1, 1))
    hx = Hex(c)
    If Len(hx) < 2 Then hx = "0" & hx
    cipherHex = cipherHex & hx
Next

hx = Hex(chk)
If Len(hx) < 2 Then hx = "0" & hx
key = cipherHex & hx

msg = ""
msg = msg & "name      : " & nm & vbCrLf
msg = msg & "wit_num   : " & witNum & vbCrLf
msg = msg & "keystream : " & KEYSTREAM & vbCrLf
msg = msg & "plaintext : " & Replace(pt, Chr(10), "\n") & vbCrLf
msg = msg & "checksum  : " & Right(key, 2) & vbCrLf
msg = msg & "key       : " & key & vbCrLf
msg = msg & "key_len   : " & Len(key)
WScript.Echo msg
WScript.Quit 0


' ---------------------------------------------------------------------------
' helpers
' ---------------------------------------------------------------------------
Function IsAllDigits(s)
    Dim k, ch
    IsAllDigits = (Len(s) > 0)
    For k = 1 To Len(s)
        ch = Mid(s, k, 1)
        If ch < "0" Or ch > "9" Then
            IsAllDigits = False
            Exit Function
        End If
    Next
End Function


Function ValidateName(s)
    Dim k, o
    ValidateName = ""
    If VarType(s) <> vbString Then
        ValidateName = "name must be a string"
        Exit Function
    End If
    If Len(s) < NAME_MIN Then
        ValidateName = "name must be at least " & NAME_MIN & " printable ASCII characters (got " & Len(s) & ")"
        Exit Function
    End If
    For k = 1 To Len(s)
        o = AscW(Mid(s, k, 1))
        If o < 32 Or o > 126 Then
            ValidateName = "name must contain only printable ASCII (0x20-0x7E); bad character at index " & (k - 1)
            Exit Function
        End If
    Next
    If InStr(1, s, "WIT", vbBinaryCompare) > 0 Then
        ValidateName = "name must not contain uppercase 'WIT' (the app's version gate reads the first 'WIT')"
    End If
End Function


Function ValidateWit(w)
    ValidateWit = ""
    If VarType(w) <> vbLong And VarType(w) <> vbInteger Then
        ValidateWit = "WIT_NUM must be an integer"
        Exit Function
    End If
    If w >= 14 And w <= 22 Then
        ValidateWit = "WIT_NUM " & w & " is rejected by mbslave 9.3 (version gate 14..22)"
        Exit Function
    End If
    If w < WIT_MIN Or w > WIT_MAX Then
        ValidateWit = "WIT_NUM must be in " & WIT_MIN & ".." & WIT_MAX & " (got " & w & ")"
    End If
End Function
