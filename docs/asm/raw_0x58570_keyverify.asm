pdata funcs: 9090
   140058570  mov      qword ptr [rsp + 0x18], rbx
   140058575  push     rbp
   140058576  push     rsi
   140058577  push     rdi
   140058578  push     r12
   14005857a  push     r13
   14005857c  push     r14
   14005857e  push     r15
   140058580  lea      rbp, [rsp - 0x350]
   140058588  sub      rsp, 0x450
   14005858f  mov      rax, qword ptr [rip + 0x1f84aa]
   140058596  xor      rax, rsp
   140058599  mov      qword ptr [rbp + 0x340], rax
   1400585a0  mov      r15, rdx
   1400585a3  mov      qword ptr [rbp - 0x70], rdx
   1400585a7  mov      edi, ecx
   1400585a9  mov      qword ptr [rbp - 0x60], rdx
   1400585ad  xor      esi, esi
   1400585af  mov      r13d, esi
   1400585b2  mov      dword ptr [rsp + 0x30], esi
   1400585b6  call     0x1400698f0
   1400585bb  mov      rcx, rax
   1400585be  test     rax, rax
   1400585c1  je       0x140058ef5
   1400585c7  mov      rax, qword ptr [rax]
   1400585ca  call     qword ptr [rax + 0x18]
   1400585cd  add      rax, 0x18
   1400585d1  mov      qword ptr [rsp + 0x38], rax
   1400585d6  lea      rdx, [rip + 0x176037]
   1400585dd  lea      r14, [rsi - 1]
   1400585e1  cmp      rdx, 0x10000
   1400585e8  jae      0x1400585f9
   1400585ea  movzx    edx, dx
   1400585ed  lea      rcx, [rsp + 0x38]
   1400585f2  call     0x140001ea0
   1400585f7  jmp      0x140058616
   1400585f9  mov      r8, r14
   1400585fc  nop      dword ptr [rax]
   140058600  inc      r8
   140058603  cmp      word ptr [rdx + r8*2], 0
   140058609  jne      0x140058600
   14005860b  lea      rcx, [rsp + 0x38]
   140058610  call     0x1400020c0
   140058615  nop      
   140058616  call     0x1400698f0
   14005861b  mov      rcx, rax
   14005861e  test     rax, rax
   140058621  je       0x140058f00
   140058627  mov      rax, qword ptr [rax]
   14005862a  call     qword ptr [rax + 0x18]
   14005862d  add      rax, 0x18
   140058631  mov      qword ptr [rsp + 0x40], rax
   140058636  lea      rdx, [rip + 0x16f387]
   14005863d  cmp      rdx, 0x10000
   140058644  jae      0x140058655
   140058646  movzx    edx, dx
   140058649  lea      rcx, [rsp + 0x40]
   14005864e  call     0x140001ea0
   140058653  jmp      0x140058676
   140058655  mov      r8, r14
   140058658  nop      dword ptr [rax + rax]
   140058660  inc      r8
   140058663  cmp      word ptr [rdx + r8*2], 0
   140058669  jne      0x140058660
   14005866b  lea      rcx, [rsp + 0x40]
   140058670  call     0x1400020c0
   140058675  nop      
   140058676  call     0x1400698f0
   14005867b  mov      rcx, rax
   14005867e  test     rax, rax
   140058681  je       0x140058f0b
   140058687  mov      rax, qword ptr [rax]
   14005868a  call     qword ptr [rax + 0x18]
   14005868d  lea      rbx, [rax + 0x18]
   140058691  mov      qword ptr [rsp + 0x58], rbx
   140058696  xor      edx, edx
   140058698  mov      r8d, 0x12c
   14005869e  lea      rcx, [rbp - 0x50]
   1400586a2  call     0x1401b6b50
   1400586a7  mov      rax, qword ptr [r15]
   1400586aa  cmp      dword ptr [rax - 0x10], 0x1e
   1400586ae  jge      0x1400586b9
   1400586b0  lea      rdx, [rbx - 0x18]
   1400586b4  jmp      0x140058cc8
   1400586b9  mov      edx, 0xa
   1400586be  mov      rcx, r15
   1400586c1  call     0x140057a60
   1400586c6  mov      edx, 0xd
   1400586cb  mov      rcx, r15
   1400586ce  call     0x140057a60
   1400586d3  mov      r8d, edi
   1400586d6  lea      rdx, [rip + 0x16ff1b]
   1400586dd  lea      rcx, [rsp + 0x58]
   1400586e2  call     0x140001cc0
   1400586e7  mov      r12d, esi
   1400586ea  mov      r8, qword ptr [r15]
   1400586ed  mov      eax, dword ptr [r8 - 0x10]
   1400586f1  add      eax, -2
   1400586f4  cdq      
   1400586f5  sub      eax, edx
   1400586f7  sar      eax, 1
   1400586f9  mov      rbx, qword ptr [rsp + 0x38]
   1400586fe  test     eax, eax
   140058700  jle      0x1400589df
   140058706  lea      rax, [rbp - 0x50]
   14005870a  mov      qword ptr [rbp - 0x78], rax
   14005870e  mov      r11, rsi
   140058711  mov      qword ptr [rbp - 0x80], rsi
   140058715  mov      r9d, esi
   140058718  mov      dword ptr [rsp + 0x50], esi
   14005871c  mov      rcx, rsi
   14005871f  mov      qword ptr [rsp + 0x78], rcx
   140058724  test     rcx, rcx
   140058727  js       0x140058f2c
   14005872d  cmp      r9d, dword ptr [r8 - 0x10]
   140058731  jg       0x140058f2c
   140058737  movzx    esi, word ptr [r8 + rcx]
   14005873c  jge      0x140058f2c
   140058742  movzx    ecx, byte ptr [r8 + r11 + 2]
   140058748  call     0x140051c40
   14005874d  movzx    edi, al
   140058750  movzx    ecx, sil
   140058754  call     0x140051c40
   140058759  movzx    ecx, al
   14005875c  movzx    edx, dil
   140058760  call     0x140051cf0
   140058765  movzx    r15d, al
   140058769  mov      rcx, qword ptr [rsp + 0x58]
   14005876e  mov      r8d, dword ptr [rcx - 0x10]
   140058772  lea      eax, [r12 + 1]
   140058777  mov      dword ptr [rsp + 0x6c], eax
   14005877b  cdq      
   14005877c  idiv     r8d
   14005877f  test     edx, edx
   140058781  js       0x140058f2c
   140058787  cmp      edx, r8d
   14005878a  jg       0x140058f2c
   140058790  movsxd   rax, edx
   140058793  movzx    edi, word ptr [rcx + rax*2]
   140058797  movsxd   rsi, dword ptr [rbx - 0x10]
   14005879b  test     esi, esi
   14005879d  jle      0x140058f2c
   1400587a3  cmp      dword ptr [rbx - 8], 1
   1400587a7  jle      0x1400587c4
   1400587a9  mov      edx, dword ptr [rbx - 0x10]
   1400587ac  lea      rcx, [rsp + 0x38]
   1400587b1  call     0x140001bf0
   1400587b6  xor      r15b, dil
   1400587b9  movzx    eax, r15b
   1400587bd  mov      rbx, qword ptr [rsp + 0x38]
   1400587c2  jmp      0x1400587cb
   1400587c4  xor      dil, r15b
   1400587c7  movzx    eax, dil
   1400587cb  mov      word ptr [rbx], ax
   1400587ce  cmp      esi, dword ptr [rbx - 0xc]
   1400587d1  jg       0x140058f2c
   1400587d7  mov      dword ptr [rbx - 0x10], esi
   1400587da  xor      ecx, ecx
   1400587dc  mov      word ptr [rbx + rsi*2], cx
   1400587e0  mov      rsi, qword ptr [rsp + 0x40]
   1400587e5  lea      r15, [rsi - 0x18]
   1400587e9  mov      rcx, qword ptr [r15]
   1400587ec  test     rcx, rcx
   1400587ef  je       0x1400587ff
   1400587f1  mov      rax, qword ptr [rcx]
   1400587f4  call     qword ptr [rax + 0x20]
   1400587f7  mov      rcx, rax
   1400587fa  test     rax, rax
   1400587fd  jne      0x140058819
   1400587ff  call     0x1400698f0
   140058804  mov      rdx, qword ptr [rax]
   140058807  mov      rcx, rax
   14005880a  call     qword ptr [rdx + 0x20]
   14005880d  mov      rcx, rax
   140058810  test     rax, rax
   140058813  je       0x140058f21
   140058819  mov      rax, qword ptr [rcx]
   14005881c  call     qword ptr [rax + 0x18]
   14005881f  lea      rdi, [rax + 0x18]
   140058823  mov      qword ptr [rsp + 0x70], rdi
   140058828  or       r13d, 2
   14005882c  mov      dword ptr [rsp + 0x30], r13d
   140058831  mov      edx, dword ptr [rbx - 0x10]
   140058834  mov      dword ptr [rsp + 0x68], edx
   140058838  mov      ecx, dword ptr [rsi - 0x10]
   14005883b  mov      dword ptr [rsp + 0x60], ecx
   14005883f  lea      r12d, [rdx + rcx]
   140058843  test     r12d, r12d
   140058846  js       0x140058f16
   14005884c  mov      ecx, 1
   140058851  sub      ecx, dword ptr [rax + 0x10]
   140058854  mov      eax, dword ptr [rax + 0xc]
   140058857  sub      eax, r12d
   14005885a  or       eax, ecx
   14005885c  jge      0x140058870
   14005885e  mov      edx, r12d
   140058861  lea      rcx, [rsp + 0x70]
   140058866  call     0x140002000
   14005886b  mov      rdi, qword ptr [rsp + 0x70]
   140058870  movsxd   rax, dword ptr [rsp + 0x60]
   140058875  lea      r8, [rax + rax]
   140058879  mov      qword ptr [rsp + 0x60], r8
   14005887e  test     r8, r8
   140058881  je       0x1400588a5
   140058883  test     rdi, rdi
   140058886  jne      0x14005889a
   140058888  call     0x140148560
   14005888d  mov      dword ptr [rax], 0x16
   140058893  call     0x140148370
   140058898  jmp      0x1400588a5
   14005889a  mov      rdx, rsi
   14005889d  mov      rcx, rdi
   1400588a0  call     0x1401b64b0
   1400588a5  movsxd   r8, dword ptr [rsp + 0x68]
   1400588aa  add      r8, r8
   1400588ad  mov      rcx, qword ptr [rsp + 0x60]
   1400588b2  lea      rcx, [rcx + rdi]
   1400588b6  je       0x1400588d7
   1400588b8  test     rcx, rcx
   1400588bb  jne      0x1400588cf
   1400588bd  call     0x140148560
   1400588c2  mov      dword ptr [rax], 0x16
   1400588c8  call     0x140148370
   1400588cd  jmp      0x1400588d7
   1400588cf  mov      rdx, rbx
   1400588d2  call     0x1401b64b0
   1400588d7  cmp      r12d, dword ptr [rdi - 0xc]
   1400588db  jg       0x140058f16
   1400588e1  mov      dword ptr [rdi - 0x10], r12d
   1400588e5  movsxd   rax, r12d
   1400588e8  xor      ecx, ecx
   1400588ea  mov      word ptr [rdi + rax*2], cx
   1400588ee  lea      rsi, [rdi - 0x18]
   1400588f2  cmp      rsi, r15
   1400588f5  je       0x14005894c
   1400588f7  cmp      dword ptr [r15 + 0x10], ecx
   1400588fb  jl       0x14005893b
   1400588fd  mov      rax, qword ptr [r15]
   140058900  cmp      qword ptr [rsi], rax
   140058903  jne      0x14005893b
   140058905  mov      rcx, rsi
   140058908  call     0x140002e60
   14005890d  mov      rdi, rax
   140058910  mov      ecx, r14d
   140058913  lock xadd dword ptr [r15 + 0x10], ecx
   140058919  sub      ecx, 1
   14005891c  jg       0x14005892b
   14005891e  mov      rcx, qword ptr [r15]
   140058921  mov      r8, qword ptr [rcx]
   140058924  mov      rdx, r15
   140058927  call     qword ptr [r8 + 8]
   14005892b  lea      rax, [rdi + 0x18]
   14005892f  mov      qword ptr [rsp + 0x40], rax
   140058934  mov      r13d, dword ptr [rsp + 0x30]
   140058939  jmp      0x14005894c
   14005893b  mov      r8d, dword ptr [rdi - 0x10]
   14005893f  mov      rdx, rdi
   140058942  lea      rcx, [rsp + 0x40]
   140058947  call     0x1400020c0
   14005894c  and      r13d, 0xfffffffd
   140058950  mov      dword ptr [rsp + 0x30], r13d
   140058955  mov      eax, r14d
   140058958  lock xadd dword ptr [rsi + 0x10], eax
   14005895d  sub      eax, 1
   140058960  jg       0x14005896e
   140058962  mov      rcx, qword ptr [rsi]
   140058965  mov      rax, qword ptr [rcx]
   140058968  mov      rdx, rsi
   14005896b  call     qword ptr [rax + 8]
   14005896e  cmp      dword ptr [rbx - 0x10], 0
   140058972  jl       0x140058f2c
   140058978  mov      rbx, qword ptr [rsp + 0x38]
   14005897d  movzx    eax, word ptr [rbx]
   140058980  mov      r10, qword ptr [rbp - 0x78]
   140058984  mov      byte ptr [r10], al
   140058987  mov      r9d, dword ptr [rsp + 0x50]
   14005898c  add      r9d, 2
   140058990  mov      dword ptr [rsp + 0x50], r9d
   140058995  mov      rcx, qword ptr [rsp + 0x78]
   14005899a  add      rcx, 4
   14005899e  mov      qword ptr [rsp + 0x78], rcx
   1400589a3  mov      r11, qword ptr [rbp - 0x80]
   1400589a7  add      r11, 4
   1400589ab  mov      qword ptr [rbp - 0x80], r11
   1400589af  inc      r10
   1400589b2  mov      qword ptr [rbp - 0x78], r10
   1400589b6  mov      r15, qword ptr [rbp - 0x70]
   1400589ba  mov      r8, qword ptr [r15]
   1400589bd  mov      eax, dword ptr [r8 - 0x10]
   1400589c1  add      eax, -2
   1400589c4  cdq      
   1400589c5  sub      eax, edx
   1400589c7  sar      eax, 1
   1400589c9  mov      r12d, dword ptr [rsp + 0x6c]
   1400589ce  cmp      r12d, eax
   1400589d1  jge      0x1400589dd
   1400589d3  mov      r13d, dword ptr [rsp + 0x30]
   1400589d8  jmp      0x140058724
   1400589dd  xor      esi, esi
   1400589df  movsxd   rax, r12d
   1400589e2  cmp      rax, 0x12c
   1400589e8  jae      0x140058eef
   1400589ee  mov      byte ptr [rbp + rax - 0x50], 0
   1400589f3  mov      dword ptr [rsp + 0x28], 0x12c
   1400589fb  lea      rax, [rbp + 0xe0]
   140058a02  mov      qword ptr [rsp + 0x20], rax
   140058a07  mov      r9d, r14d
   140058a0a  lea      r8, [rbp - 0x50]
   140058a0e  xor      edx, edx
   140058a10  mov      ecx, 0xfde9
   140058a15  call     qword ptr [rip + 0x16dfed]
   140058a1b  test     eax, eax
   140058a1d  jne      0x140058a36
   140058a1f  xor      r8d, r8d
   140058a22  lea      edx, [rax + 0x30]
   140058a25  lea      rcx, [rip + 0x17d7d4]
   140058a2c  call     0x1400810d0
   140058a31  jmp      0x140058cbf
   140058a36  call     0x1400698f0
   140058a3b  mov      rcx, rax
   140058a3e  test     rax, rax
   140058a41  je       0x140058f37
   140058a47  mov      rax, qword ptr [rax]
   140058a4a  call     qword ptr [rax + 0x18]
   140058a4d  add      rax, 0x18
   140058a51  mov      qword ptr [rsp + 0x48], rax
   140058a56  lea      rax, [rbp + 0xe0]
   140058a5d  cmp      rax, 0x10000
   140058a63  lea      rax, [rbp + 0xe0]
   140058a6a  jae      0x140058a7b
   140058a6c  movzx    edx, ax
   140058a6f  lea      rcx, [rsp + 0x48]
   140058a74  call     0x140001ea0
   140058a79  jmp      0x140058a9d
   140058a7b  mov      r8, r14
   140058a7e  nop      
   140058a80  inc      r8
   140058a83  cmp      word ptr [rax + r8*2], 0
   140058a89  jne      0x140058a80
   140058a8b  lea      rdx, [rbp + 0xe0]
   140058a92  lea      rcx, [rsp + 0x48]
   140058a97  call     0x1400020c0
   140058a9c  nop      
   140058a9d  mov      r8d, 2
   140058aa3  lea      rdx, [rbp - 0x68]
   140058aa7  mov      rcx, r15
   140058aaa  call     0x140044480
   140058aaf  nop      
   140058ab0  mov      rdx, qword ptr [rax]
   140058ab3  lea      rcx, [rdx - 0x18]
   140058ab7  add      rbx, -0x18
   140058abb  cmp      rcx, rbx
   140058abe  je       0x140058b0a
   140058ac0  cmp      dword ptr [rbx + 0x10], 0
   140058ac4  jl       0x140058afb
   140058ac6  mov      rax, qword ptr [rbx]
   140058ac9  cmp      qword ptr [rcx], rax
   140058acc  jne      0x140058afb
   140058ace  call     0x140002e60
   140058ad3  mov      rdi, rax
   140058ad6  mov      ecx, r14d
   140058ad9  lock xadd dword ptr [rbx + 0x10], ecx
   140058ade  sub      ecx, 1
   140058ae1  jg       0x140058af0
   140058ae3  mov      rcx, qword ptr [rbx]
   140058ae6  mov      r8, qword ptr [rcx]
   140058ae9  mov      rdx, rbx
   140058aec  call     qword ptr [r8 + 8]
   140058af0  lea      rax, [rdi + 0x18]
   140058af4  mov      qword ptr [rsp + 0x38], rax
   140058af9  jmp      0x140058b0a
   140058afb  mov      r8d, dword ptr [rdx - 0x10]
   140058aff  lea      rcx, [rsp + 0x38]
   140058b04  call     0x1400020c0
   140058b09  nop      
   140058b0a  mov      rdx, qword ptr [rbp - 0x68]
   140058b0e  add      rdx, -0x18
   140058b12  mov      eax, r14d
   140058b15  lock xadd dword ptr [rdx + 0x10], eax
   140058b1a  sub      eax, 1
   140058b1d  jg       0x140058b28
   140058b1f  mov      rcx, qword ptr [rdx]
   140058b22  mov      rax, qword ptr [rcx]
   140058b25  call     qword ptr [rax + 8]
   140058b28  mov      rax, qword ptr [rsp + 0x38]
   140058b2d  cmp      dword ptr [rax - 0x10], 1
   140058b31  jl       0x140058ee4
   140058b37  movzx    ebx, word ptr [rax]
   140058b3a  movzx    ecx, byte ptr [rax + 2]
   140058b3e  call     0x140051c40
   140058b43  movzx    edi, al
   140058b46  movzx    ecx, bl
   140058b49  call     0x140051c40
   140058b4e  movzx    ecx, al
   140058b51  movzx    edx, dil
   140058b55  call     0x140051cf0
   140058b5a  xor      r8b, r8b
   140058b5d  mov      edx, esi
   140058b5f  mov      rbx, qword ptr [rsp + 0x40]
   140058b64  mov      r9d, dword ptr [rbx - 0x10]
   140058b68  test     r9d, r9d
   140058b6b  jle      0x140058b90
   140058b6d  mov      rcx, rsi
   140058b70  test     rcx, rcx
   140058b73  js       0x140058ee4
   140058b79  cmp      edx, r9d
   140058b7c  jg       0x140058ee4
   140058b82  xor      r8b, byte ptr [rbx + rcx*2]
   140058b86  inc      edx
   140058b88  inc      rcx
   140058b8b  cmp      edx, r9d
   140058b8e  jl       0x140058b70
   140058b90  mov      esi, 7
   140058b95  cmp      r8b, al
   140058b98  jne      0x140058c69
   140058b9e  cmp      r9d, esi
   140058ba1  jg       0x140058bbe
   140058ba3  lea      rcx, [rbx - 0x18]
   140058ba7  call     0x140002e60
   140058bac  add      rax, 0x18
   140058bb0  mov      r8d, dword ptr [rsp + 0x30]
   140058bb5  or       r8d, 4
   140058bb9  xor      r12d, r12d
   140058bbc  jmp      0x140058c3c
   140058bbe  mov      rcx, qword ptr [rbx - 0x18]
   140058bc2  test     rcx, rcx
   140058bc5  je       0x140058bd5
   140058bc7  mov      rax, qword ptr [rcx]
   140058bca  call     qword ptr [rax + 0x20]
   140058bcd  mov      rcx, rax
   140058bd0  test     rax, rax
   140058bd3  jne      0x140058bef
   140058bd5  call     0x1400698f0
   140058bda  mov      rdx, qword ptr [rax]
   140058bdd  mov      rcx, rax
   140058be0  call     qword ptr [rdx + 0x20]
   140058be3  mov      rcx, rax
   140058be6  test     rax, rax
   140058be9  je       0x140058f42
   140058bef  mov      rax, qword ptr [rcx]
   140058bf2  mov      r8d, 2
   140058bf8  mov      edx, esi
   140058bfa  call     qword ptr [rax]
   140058bfc  test     rax, rax
   140058bff  je       0x140058f4d
   140058c05  add      rax, 0x18
   140058c09  cmp      dword ptr [rax - 0xc], esi
   140058c0c  jl       0x140058ee4
   140058c12  mov      dword ptr [rax - 0x10], esi
   140058c15  xor      r12d, r12d
   140058c18  mov      word ptr [rax + 0xe], r12w
   140058c1d  movsd    xmm0, qword ptr [rbx]
   140058c21  movsd    qword ptr [rax], xmm0
   140058c25  mov      ecx, dword ptr [rbx + 8]
   140058c28  mov      dword ptr [rax + 8], ecx
   140058c2b  movzx    ecx, word ptr [rbx + 0xc]
   140058c2f  mov      word ptr [rax + 0xc], cx
   140058c33  mov      r8d, dword ptr [rsp + 0x30]
   140058c38  or       r8d, 4
   140058c3c  or       r8d, 1
   140058c40  mov      dword ptr [rsp + 0x30], r8d
   140058c45  mov      rdx, r12
   140058c48  lea      r9, [rip + 0x17d5f9]
   140058c4f  nop      
   140058c50  movzx    ecx, word ptr [rax + rdx*2]
   140058c54  inc      rdx
   140058c57  cmp      cx, word ptr [r9 + rdx*2 - 2]
   140058c5d  jne      0x140058c75
   140058c5f  cmp      rdx, 8
   140058c63  jne      0x140058c50
   140058c65  xor      bl, bl
   140058c67  jmp      0x140058c77
   140058c69  mov      rax, qword ptr [rbp - 0x60]
   140058c6d  mov      r8d, dword ptr [rsp + 0x30]
   140058c72  xor      r12d, r12d
   140058c75  mov      bl, 1
   140058c77  test     r8b, 1
   140058c7b  je       0x140058c97
   140058c7d  lea      rdx, [rax - 0x18]
   140058c81  mov      eax, r14d
   140058c84  lock xadd dword ptr [rdx + 0x10], eax
   140058c89  sub      eax, 1
   140058c8c  jg       0x140058c97
   140058c8e  mov      rcx, qword ptr [rdx]
   140058c91  mov      rax, qword ptr [rcx]
   140058c94  call     qword ptr [rax + 8]
   140058c97  test     bl, bl
   140058c99  je       0x140058d67
   140058c9f  mov      rdx, qword ptr [rsp + 0x48]
   140058ca4  add      rdx, -0x18
   140058ca8  mov      eax, r14d
   140058cab  lock xadd dword ptr [rdx + 0x10], eax
   140058cb0  sub      eax, 1
   140058cb3  jg       0x140058cbf
   140058cb5  mov      rcx, qword ptr [rdx]
   140058cb8  mov      rax, qword ptr [rcx]
   140058cbb  call     qword ptr [rax + 8]
   140058cbe  nop      
   140058cbf  mov      rdx, qword ptr [rsp + 0x58]
   140058cc4  add      rdx, -0x18
   140058cc8  mov      eax, r14d
   140058ccb  lock xadd dword ptr [rdx + 0x10], eax
   140058cd0  sub      eax, 1
   140058cd3  jg       0x140058cdf
   140058cd5  mov      rcx, qword ptr [rdx]
   140058cd8  mov      rax, qword ptr [rcx]
   140058cdb  call     qword ptr [rax + 8]
   140058cde  nop      
   140058cdf  mov      rdx, qword ptr [rsp + 0x40]
   140058ce4  add      rdx, -0x18
   140058ce8  mov      eax, r14d
   140058ceb  lock xadd dword ptr [rdx + 0x10], eax
   140058cf0  sub      eax, 1
   140058cf3  jg       0x140058cff
   140058cf5  mov      rcx, qword ptr [rdx]
   140058cf8  mov      rax, qword ptr [rcx]
   140058cfb  call     qword ptr [rax + 8]
   140058cfe  nop      
   140058cff  mov      rdx, qword ptr [rsp + 0x38]
   140058d04  add      rdx, -0x18
   140058d08  mov      eax, r14d
   140058d0b  lock xadd dword ptr [rdx + 0x10], eax
   140058d10  sub      eax, 1
   140058d13  jg       0x140058d1f
   140058d15  mov      rcx, qword ptr [rdx]
   140058d18  mov      rax, qword ptr [rcx]
   140058d1b  call     qword ptr [rax + 8]
   140058d1e  nop      
   140058d1f  mov      rdx, qword ptr [r15]
   140058d22  sub      rdx, 0x18
   140058d26  lock xadd dword ptr [rdx + 0x10], r14d
   140058d2c  sub      r14d, 1
   140058d30  jg       0x140058d3b
   140058d32  mov      rcx, qword ptr [rdx]
   140058d35  mov      rax, qword ptr [rcx]
   140058d38  call     qword ptr [rax + 8]
   140058d3b  xor      al, al
   140058d3d  mov      rcx, qword ptr [rbp + 0x340]
   140058d44  xor      rcx, rsp
   140058d47  call     0x1400ff700
   140058d4c  mov      rbx, qword ptr [rsp + 0x4a0]
   140058d54  add      rsp, 0x450
   140058d5b  pop      r15
   140058d5d  pop      r14
   140058d5f  pop      r13
   140058d61  pop      r12
   140058d63  pop      rdi
   140058d64  pop      rsi
   140058d65  pop      rbp
   140058d66  ret      
   140058d67  mov      rbx, qword ptr [rsp + 0x48]
   140058d6c  mov      edi, dword ptr [rbx - 0x10]
   140058d6f  cmp      edi, esi
   140058d71  jge      0x140058d79
   140058d73  mov      esi, edi
   140058d75  test     edi, edi
   140058d77  jle      0x140058ddf
   140058d79  sub      edi, esi
   140058d7b  lea      r15d, [rdi + 1]
   140058d7f  cmp      dword ptr [rbx - 8], 1
   140058d83  jle      0x140058d97
   140058d85  mov      edx, dword ptr [rbx - 0x10]
   140058d88  lea      rcx, [rsp + 0x48]
   140058d8d  call     0x140001bf0
   140058d92  mov      rbx, qword ptr [rsp + 0x48]
   140058d97  movsxd   r8, r15d
   140058d9a  add      r8, r8
   140058d9d  mov      eax, esi
   140058d9f  lea      rdx, [rbx + rax*2]
   140058da3  je       0x140058dbf
   140058da5  test     rbx, rbx
   140058da8  je       0x140058f53
   140058dae  test     rdx, rdx
   140058db1  je       0x140058f53
   140058db7  mov      rcx, rbx
   140058dba  call     0x1401b64b0
   140058dbf  test     edi, edi
   140058dc1  js       0x140058ee4
   140058dc7  cmp      edi, dword ptr [rbx - 0xc]
   140058dca  jg       0x140058ee4
   140058dd0  mov      dword ptr [rbx - 0x10], edi
   140058dd3  movsxd   rax, edi
   140058dd6  mov      word ptr [rbx + rax*2], r12w
   140058ddb  mov      r15, qword ptr [rbp - 0x70]
   140058ddf  lea      rdi, [rbx - 0x18]
   140058de3  mov      rsi, qword ptr [rip + 0x1fe6ae]
   140058dea  add      rsi, -0x18
   140058dee  cmp      rdi, rsi
   140058df1  je       0x140058e47
   140058df3  cmp      dword ptr [rsi + 0x10], 0
   140058df7  jl       0x140058e33
   140058df9  mov      rax, qword ptr [rsi]
   140058dfc  cmp      qword ptr [rdi], rax
   140058dff  jne      0x140058e33
   140058e01  mov      rcx, rdi
   140058e04  call     0x140002e60
   140058e09  mov      rbx, rax
   140058e0c  mov      ecx, r14d
   140058e0f  lock xadd dword ptr [rsi + 0x10], ecx
   140058e14  sub      ecx, 1
   140058e17  jg       0x140058e26
   140058e19  mov      rcx, qword ptr [rsi]
   140058e1c  mov      r8, qword ptr [rcx]
   140058e1f  mov      rdx, rsi
   140058e22  call     qword ptr [r8 + 8]
   140058e26  lea      rax, [rbx + 0x18]
   140058e2a  mov      qword ptr [rip + 0x1fe667], rax
   140058e31  jmp      0x140058e47
   140058e33  mov      r8d, dword ptr [rbx - 0x10]
   140058e37  mov      rdx, rbx
   140058e3a  lea      rcx, [rip + 0x1fe657]
   140058e41  call     0x1400020c0
   140058e46  nop      
   140058e47  mov      eax, r14d
   140058e4a  lock xadd dword ptr [rdi + 0x10], eax
   140058e4f  sub      eax, 1
   140058e52  jg       0x140058e61
   140058e54  mov      rcx, qword ptr [rdi]
   140058e57  mov      rax, qword ptr [rcx]
   140058e5a  mov      rdx, rdi
   140058e5d  call     qword ptr [rax + 8]
   140058e60  nop      
   140058e61  mov      rdx, qword ptr [rsp + 0x58]
   140058e66  add      rdx, -0x18
   140058e6a  mov      eax, r14d
   140058e6d  lock xadd dword ptr [rdx + 0x10], eax
   140058e72  sub      eax, 1
   140058e75  jg       0x140058e81
   140058e77  mov      rcx, qword ptr [rdx]
   140058e7a  mov      rax, qword ptr [rcx]
   140058e7d  call     qword ptr [rax + 8]
   140058e80  nop      
   140058e81  mov      rdx, qword ptr [rsp + 0x40]
   140058e86  add      rdx, -0x18
   140058e8a  mov      eax, r14d
   140058e8d  lock xadd dword ptr [rdx + 0x10], eax
   140058e92  sub      eax, 1
   140058e95  jg       0x140058ea1
   140058e97  mov      rcx, qword ptr [rdx]
   140058e9a  mov      rax, qword ptr [rcx]
   140058e9d  call     qword ptr [rax + 8]
   140058ea0  nop      
   140058ea1  mov      rdx, qword ptr [rsp + 0x38]
   140058ea6  add      rdx, -0x18
   140058eaa  mov      eax, r14d
   140058ead  lock xadd dword ptr [rdx + 0x10], eax
   140058eb2  sub      eax, 1
   140058eb5  jg       0x140058ec1
   140058eb7  mov      rcx, qword ptr [rdx]
   140058eba  mov      rax, qword ptr [rcx]
   140058ebd  call     qword ptr [rax + 8]
   140058ec0  nop      
   140058ec1  mov      rdx, qword ptr [r15]
   140058ec4  sub      rdx, 0x18
   140058ec8  lock xadd dword ptr [rdx + 0x10], r14d
   140058ece  sub      r14d, 1
   140058ed2  jg       0x140058edd
   140058ed4  mov      rcx, qword ptr [rdx]
   140058ed7  mov      rax, qword ptr [rcx]
   140058eda  call     qword ptr [rax + 8]
   140058edd  mov      al, 1
   140058edf  jmp      0x140058d3d
   140058ee4  mov      ecx, 0x80070057
   140058ee9  call     0x140001b30
   140058eee  nop      
   140058eef  call     0x1400ffb0c
   140058ef4  nop      
   140058ef5  mov      ecx, 0x80004005
   140058efa  call     0x140001b30
   140058eff  nop      
   140058f00  mov      ecx, 0x80004005
   140058f05  call     0x140001b30
   140058f0a  nop      
   140058f0b  mov      ecx, 0x80004005
   140058f10  call     0x140001b30
   140058f15  nop      
   140058f16  mov      ecx, 0x80070057
   140058f1b  call     0x140001b30
   140058f20  int3     
   140058f21  mov      ecx, 0x80004005
   140058f26  call     0x140001b30
   140058f2b  nop      
   140058f2c  mov      ecx, 0x80070057
   140058f31  call     0x140001b30
   140058f36  int3     
   140058f37  mov      ecx, 0x80004005
   140058f3c  call     0x140001b30
   140058f41  nop      
   140058f42  mov      ecx, 0x80004005
   140058f47  call     0x140001b30
   140058f4c  int3     
   140058f4d  call     0x140002250
   140058f52  int3     
   140058f53  call     0x140148560
   140058f58  mov      dword ptr [rax], 0x16
   140058f5e  call     0x140148370
   140058f63  call     0x140065c04
   140058f68  int3     
