   140058fc0  mov      qword ptr [rsp + 0x10], rbx
   140058fc5  mov      qword ptr [rsp + 0x18], rsi
   140058fca  push     rdi
   140058fcb  sub      rsp, 0x60
   140058fcf  mov      rax, qword ptr [rip + 0x1f7a6a]
   140058fd6  xor      rax, rsp
   140058fd9  mov      qword ptr [rsp + 0x58], rax
   140058fde  mov      rsi, rcx
   140058fe1  mov      qword ptr [rsp + 0x30], rcx
   140058fe6  call     0x1400698f0
   140058feb  mov      rcx, rax
   140058fee  test     rax, rax
   140058ff1  je       0x1400591bd
   140058ff7  mov      rax, qword ptr [rax]
   140058ffa  call     qword ptr [rax + 0x18]
   140058ffd  add      rax, 0x18
   140059001  mov      qword ptr [rsp + 0x20], rax
   140059006  lea      rdx, [rip + 0x175607]
   14005900d  mov      rbx, 0xffffffffffffffff
   140059014  cmp      rdx, 0x10000
   14005901b  jae      0x14005902c
   14005901d  movzx    edx, dx
   140059020  lea      rcx, [rsp + 0x20]
   140059025  call     0x140001ea0
   14005902a  jmp      0x140059046
   14005902c  mov      r8, rbx
   14005902f  nop      
   140059030  inc      r8
   140059033  cmp      word ptr [rdx + r8*2], 0
   140059039  jne      0x140059030
   14005903b  lea      rcx, [rsp + 0x20]
   140059040  call     0x1400020c0
   140059045  nop      
   140059046  mov      rdx, qword ptr [rsi]
   140059049  mov      r9d, dword ptr [rdx - 0x10]
   14005904d  cmp      r9d, 0x18
   140059051  jne      0x140059157
   140059057  xorps    xmm0, xmm0
   14005905a  xor      eax, eax
   14005905c  movups   xmmword ptr [rsp + 0x38], xmm0
   140059061  mov      qword ptr [rsp + 0x48], rax
   140059066  mov      byte ptr [rsp + 0x50], al
   14005906a  xor      r8d, r8d
   14005906d  mov      ecx, r8d
   140059070  test     rcx, rcx
   140059073  js       0x1400591b2
   140059079  cmp      r8d, r9d
   14005907c  jg       0x1400591b2
   140059082  movzx    eax, word ptr [rdx]
   140059085  mov      byte ptr [rsp + rcx + 0x38], al
   140059089  inc      r8d
   14005908c  inc      rcx
   14005908f  add      rdx, 2
   140059093  cmp      rcx, 0x14
   140059097  jl       0x140059070
   140059099  mov      edx, 0x14
   14005909e  lea      rcx, [rsp + 0x38]
   1400590a3  call     0x140051ca0
   1400590a8  movzx    r8d, ax
   1400590ac  lea      rdx, [rip + 0x17c6dd]
   1400590b3  lea      rcx, [rsp + 0x20]
   1400590b8  call     0x140001cc0
   1400590bd  mov      r8d, 4
   1400590c3  lea      rdx, [rsp + 0x28]
   1400590c8  mov      rcx, rsi
   1400590cb  call     0x140044480
   1400590d0  mov      rdx, qword ptr [rax]
   1400590d3  test     rdx, rdx
   1400590d6  je       0x1400591c8
   1400590dc  mov      rax, qword ptr [rsp + 0x20]
   1400590e1  sub      rdx, rax
   1400590e4  movzx    edi, word ptr [rax]
   1400590e7  movzx    ecx, word ptr [rax + rdx]
   1400590eb  sub      edi, ecx
   1400590ed  jne      0x1400590f7
   1400590ef  add      rax, 2
   1400590f3  test     ecx, ecx
   1400590f5  jne      0x1400590e4
   1400590f7  mov      rdx, qword ptr [rsp + 0x28]
   1400590fc  add      rdx, -0x18
