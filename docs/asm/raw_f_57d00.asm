   140057d00  mov      qword ptr [rsp + 8], rbx
   140057d05  mov      qword ptr [rsp + 0x10], rsi
   140057d0a  mov      qword ptr [rsp + 0x18], rdi
   140057d0f  push     rbp
   140057d10  push     r12
   140057d12  push     r13
   140057d14  push     r14
   140057d16  push     r15
   140057d18  lea      rbp, [rsp - 0x37]
   140057d1d  sub      rsp, 0xa0
   140057d24  mov      rax, qword ptr [rip + 0x1f8d15]
   140057d2b  xor      rax, rsp
   140057d2e  mov      qword ptr [rbp + 0x2f], rax
   140057d32  movzx    r15d, cl
   140057d36  xor      ecx, ecx
   140057d38  call     0x14016e140
   140057d3d  mov      qword ptr [rbp - 0x39], rax
   140057d41  call     0x1400698f0
   140057d46  mov      rcx, rax
   140057d49  test     rax, rax
   140057d4c  je       0x1400581a0
   140057d52  mov      rax, qword ptr [rax]
   140057d55  call     qword ptr [rax + 0x18]
   140057d58  add      rax, 0x18
   140057d5c  mov      qword ptr [rbp - 0x31], rax
   140057d60  lea      rdx, [rip + 0x17e639]
   140057d67  mov      rbx, 0xffffffffffffffff
   140057d6e  cmp      rdx, 0x10000
   140057d75  jae      0x140057d85
   140057d77  movzx    edx, dx
   140057d7a  lea      rcx, [rbp - 0x31]
   140057d7e  call     0x140001ea0
   140057d83  jmp      0x140057da5
   140057d85  mov      r8, rbx
   140057d88  nop      dword ptr [rax + rax]
   140057d90  inc      r8
   140057d93  cmp      word ptr [rdx + r8*2], 0
   140057d99  jne      0x140057d90
   140057d9b  lea      rcx, [rbp - 0x31]
   140057d9f  call     0x1400020c0
   140057da4  nop      
   140057da5  mov      qword ptr [rsp + 0x20], 0xffffffff80000001
   140057dae  mov      r9d, 1
   140057db4  xor      r8d, r8d
   140057db7  lea      rdx, [rbp - 0x31]
   140057dbb  lea      rcx, [rbp - 0x29]
   140057dbf  call     0x14005d810
   140057dc4  nop      
   140057dc5  mov      rdx, qword ptr [rbp - 0x31]
   140057dc9  add      rdx, -0x18
   140057dcd  mov      eax, ebx
   140057dcf  lock xadd dword ptr [rdx + 0x10], eax
   140057dd4  sub      eax, 1
   140057dd7  jg       0x140057de2
   140057dd9  mov      rcx, qword ptr [rdx]
   140057ddc  mov      rax, qword ptr [rcx]
   140057ddf  call     qword ptr [rax + 8]
   140057de2  lea      rcx, [rbp - 0x29]
   140057de6  call     0x14005ed90
   140057deb  test     eax, eax
   140057ded  jne      0x140057ea7
   140057df3  lea      rdx, [rbp - 0x39]
   140057df7  lea      rcx, [rbp + 7]
   140057dfb  call     0x14016dd9c
   140057e00  xor      edi, edi
   140057e02  test     eax, eax
   140057e04  jne      0x140057e11
   140057e06  mov      edx, dword ptr [rbp + 0x1b]
   140057e09  add      edx, 0x76c
   140057e0f  jmp      0x140057e13
   140057e11  mov      edx, edi
   140057e13  lea      rcx, [rbp - 0x29]
   140057e17  call     0x14005ecb0
   140057e1c  lea      rsi, [rip + 0x17e5b5]
   140057e23  mov      r8, rbx
   140057e26  inc      r8
   140057e29  cmp      word ptr [rsi + r8*2], di
   140057e2e  jne      0x140057e26
   140057e30  mov      rdx, rsi
   140057e33  lea      rcx, [rbp - 0x19]
   140057e37  call     0x1400020c0
   140057e3c  lea      rdx, [rbp - 0x39]
   140057e40  lea      rcx, [rbp + 7]
   140057e44  call     0x14016dd9c
   140057e49  test     eax, eax
   140057e4b  jne      0x140057e54
   140057e4d  mov      edx, dword ptr [rbp + 0x17]
   140057e50  inc      edx
   140057e52  jmp      0x140057e56
   140057e54  mov      edx, edi
   140057e56  lea      rcx, [rbp - 0x29]
   140057e5a  call     0x14005ecb0
   140057e5f  lea      r14, [rip + 0x17e582]
   140057e66  inc      rbx
   140057e69  cmp      word ptr [r14 + rbx*2], di
   140057e6e  jne      0x140057e66
   140057e70  mov      r8d, ebx
   140057e73  mov      rdx, r14
   140057e76  lea      rcx, [rbp - 0x19]
   140057e7a  call     0x1400020c0
   140057e7f  lea      rdx, [rbp - 0x39]
   140057e83  lea      rcx, [rbp + 7]
   140057e87  call     0x14016dd9c
   140057e8c  test     eax, eax
   140057e8e  cmove    edi, dword ptr [rbp + 0x13]
   140057e92  mov      edx, edi
   140057e94  lea      rcx, [rbp - 0x29]
   140057e98  call     0x14005ecb0
   140057e9d  mov      edi, 0x1e
   140057ea2  jmp      0x14005814c
   140057ea7  xor      edi, edi
   140057ea9  lea      rsi, [rip + 0x17e528]
   140057eb0  lea      r14, [rip + 0x17e531]
   140057eb7  lea      r12, [rip + 0x17e542]
   140057ebe  test     r15b, r15b
   140057ec1  je       0x140057ff1
   140057ec7  lea      r15, [rip + 0x17e522]
   140057ece  mov      r8, rbx
   140057ed1  inc      r8
   140057ed4  cmp      word ptr [r15 + r8*2], di
   140057ed9  jne      0x140057ed1
   140057edb  mov      rdx, r15
   140057ede  lea      rcx, [rbp - 0x19]
   140057ee2  call     0x1400020c0
   140057ee7  lea      rcx, [rbp - 0x29]
   140057eeb  call     0x14005ed90
   140057ef0  test     eax, eax
   140057ef2  jne      0x140057ff1
   140057ef8  lea      rdx, [rbp - 0x39]
   140057efc  lea      rcx, [rbp + 7]
   140057f00  call     0x14016dd9c
   140057f05  test     eax, eax
   140057f07  jne      0x140057f14
   140057f09  mov      edx, dword ptr [rbp + 0x1b]
   140057f0c  add      edx, 0x76c
   140057f12  jmp      0x140057f16
   140057f14  mov      edx, edi
   140057f16  lea      rcx, [rbp - 0x29]
   140057f1a  call     0x14005ecb0
   140057f1f  mov      r8, rbx
   140057f22  inc      r8
   140057f25  cmp      word ptr [rsi + r8*2], di
   140057f2a  jne      0x140057f22
   140057f2c  mov      rdx, rsi
   140057f2f  lea      rcx, [rbp - 0x19]
   140057f33  call     0x1400020c0
   140057f38  lea      rdx, [rbp - 0x39]
   140057f3c  lea      rcx, [rbp + 7]
   140057f40  call     0x14016dd9c
   140057f45  test     eax, eax
   140057f47  jne      0x140057f50
   140057f49  mov      edx, dword ptr [rbp + 0x17]
   140057f4c  inc      edx
   140057f4e  jmp      0x140057f52
   140057f50  mov      edx, edi
   140057f52  lea      rcx, [rbp - 0x29]
   140057f56  call     0x14005ecb0
   140057f5b  mov      r8, rbx
   140057f5e  nop      
   140057f60  inc      r8
   140057f63  cmp      word ptr [r14 + r8*2], di
   140057f68  jne      0x140057f60
   140057f6a  mov      rdx, r14
   140057f6d  lea      rcx, [rbp - 0x19]
   140057f71  call     0x1400020c0
   140057f76  lea      rdx, [rbp - 0x39]
   140057f7a  lea      rcx, [rbp + 7]
   140057f7e  call     0x14016dd9c
   140057f83  mov      edx, edi
   140057f85  test     eax, eax
   140057f87  cmove    edx, dword ptr [rbp + 0x13]
   140057f8b  lea      rcx, [rbp - 0x29]
   140057f8f  call     0x14005ecb0
   140057f94  mov      r8, rbx
   140057f97  nop      word ptr [rax + rax]
   140057fa0  inc      r8
   140057fa3  cmp      word ptr [r15 + r8*2], di
   140057fa8  jne      0x140057fa0
   140057faa  mov      rdx, r15
   140057fad  lea      rcx, [rbp - 0x19]
   140057fb1  call     0x1400020c0
   140057fb6  mov      edx, 1
   140057fbb  lea      rcx, [rbp - 0x29]
   140057fbf  call     0x14005ecb0
   140057fc4  mov      r8, rbx
   140057fc7  nop      word ptr [rax + rax]
   140057fd0  inc      r8
   140057fd3  cmp      word ptr [r12 + r8*2], di
   140057fd8  jne      0x140057fd0
   140057fda  mov      rdx, r12
   140057fdd  lea      rcx, [rbp - 0x19]
   140057fe1  call     0x1400020c0
   140057fe6  xor      edx, edx
   140057fe8  lea      rcx, [rbp - 0x29]
   140057fec  call     0x14005ecb0
   140057ff1  lea      rdx, [rip + 0x17e418]
   140057ff8  mov      r8, rbx
   140057ffb  nop      dword ptr [rax + rax]
   140058000  inc      r8
   140058003  cmp      word ptr [rdx + r8*2], di
   140058008  jne      0x140058000
   14005800a  lea      rcx, [rbp - 0x19]
   14005800e  call     0x1400020c0
   140058013  lea      rcx, [rbp - 0x29]
   140058017  call     0x14005ed90
   14005801c  mov      r13d, eax
   14005801f  mov      r8, rbx
   140058022  inc      r8
   140058025  cmp      word ptr [rsi + r8*2], di
   14005802a  jne      0x140058022
   14005802c  mov      rdx, rsi
   14005802f  lea      rcx, [rbp - 0x19]
   140058033  call     0x1400020c0
   140058038  lea      rcx, [rbp - 0x29]
   14005803c  call     0x14005ed90
   140058041  mov      r15d, eax
   140058044  mov      r8, rbx
   140058047  nop      word ptr [rax + rax]
   140058050  inc      r8
   140058053  cmp      word ptr [r14 + r8*2], di
   140058058  jne      0x140058050
   14005805a  mov      rdx, r14
   14005805d  lea      rcx, [rbp - 0x19]
   140058061  call     0x1400020c0
   140058066  lea      rcx, [rbp - 0x29]
   14005806a  call     0x14005ed90
   14005806f  mov      esi, eax
   140058071  mov      r8, rbx
   140058074  inc      r8
   140058077  cmp      word ptr [r12 + r8*2], di
   14005807c  jne      0x140058074
   14005807e  mov      rdx, r12
   140058081  lea      rcx, [rbp - 0x19]
   140058085  call     0x1400020c0
   14005808a  lea      rcx, [rbp - 0x29]
   14005808e  call     0x14005ed90
   140058093  mov      r14d, eax
   140058096  cmp      r13d, 0x7b2
   14005809d  jl       0x140058195
   1400580a3  lea      edx, [r15 - 1]
   1400580a7  cmp      edx, 0xb
   1400580aa  ja       0x140058195
   1400580b0  lea      ecx, [rsi - 1]
   1400580b3  cmp      ecx, 0x1e
   1400580b6  ja       0x140058195
   1400580bc  mov      qword ptr [rbp + 7], rdi
   1400580c0  mov      dword ptr [rbp + 0xf], edi
   1400580c3  mov      dword ptr [rbp + 0x13], esi
   1400580c6  mov      dword ptr [rbp + 0x17], edx
   1400580c9  lea      eax, [r13 - 0x76c]
   1400580d0  mov      dword ptr [rbp + 0x1b], eax
   1400580d3  mov      dword ptr [rbp + 0x27], ebx
   1400580d6  lea      rcx, [rbp + 7]
   1400580da  call     0x140177564
   1400580df  cmp      rax, -1
   1400580e3  je       0x14005818a
   1400580e9  mov      rcx, qword ptr [rbp - 0x39]
   1400580ed  sub      rcx, rax
   1400580f0  movabs   rax, 0x1845c8a0ce512957
   1400580fa  imul     rcx
   1400580fd  sar      rdx, 0xd
   140058101  mov      rax, rdx
   140058104  shr      rax, 0x3f
   140058108  add      rdx, rax
   14005810b  mov      eax, edi
   14005810d  test     edx, edx
   14005810f  cmovns   eax, edx
   140058112  cmp      eax, 0x1e
   140058115  jg       0x140058125
   140058117  test     r14d, r14d
   14005811a  jne      0x140058125
   14005811c  mov      edi, 0x1e
   140058121  sub      edi, eax
   140058123  jmp      0x14005814c
   140058125  inc      rbx
   140058128  cmp      word ptr [r12 + rbx*2], di
   14005812d  jne      0x140058125
   14005812f  mov      r8d, ebx
   140058132  mov      rdx, r12
   140058135  lea      rcx, [rbp - 0x19]
   140058139  call     0x1400020c0
   14005813e  mov      edx, 1
   140058143  lea      rcx, [rbp - 0x29]
   140058147  call     0x14005ecb0
   14005814c  mov      dword ptr [rip + 0x1ff342], edi
   140058152  lea      rcx, [rbp - 0x29]
   140058156  call     0x14005eaf0
   14005815b  mov      eax, edi
   14005815d  mov      rcx, qword ptr [rbp + 0x2f]
   140058161  xor      rcx, rsp
   140058164  call     0x1400ff700
   140058169  lea      r11, [rsp + 0xa0]
   140058171  mov      rbx, qword ptr [r11 + 0x30]
   140058175  mov      rsi, qword ptr [r11 + 0x38]
   140058179  mov      rdi, qword ptr [r11 + 0x40]
   14005817d  mov      rsp, r11
   140058180  pop      r15
   140058182  pop      r14
   140058184  pop      r13
   140058186  pop      r12
   140058188  pop      rbp
   140058189  ret      
   14005818a  mov      ecx, 0x80070057
   14005818f  call     0x140001b30
   140058194  int3     
   140058195  mov      ecx, 0x80004005
   14005819a  call     0x140001b30
   14005819f  nop      
   1400581a0  mov      ecx, 0x80004005
   1400581a5  call     0x140001b30
   1400581aa  int3     
