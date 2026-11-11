   140057610  sub      rsp, 0x68
   140057614  mov      rax, qword ptr [rip + 0x1f9425]
   14005761b  xor      rax, rsp
   14005761e  mov      qword ptr [rsp + 0x50], rax
   140057623  cmp      byte ptr [rip + 0x1ffe66], 0
   14005762a  jne      0x14005768f
   14005762c  xor      ecx, ecx
   14005762e  call     0x14016e140
   140057633  lea      rdx, [rsp + 0x20]
   140057638  mov      qword ptr [rsp + 0x20], rax
   14005763d  lea      rcx, [rsp + 0x28]
   140057642  call     0x14016dd9c
   140057647  test     eax, eax
   140057649  jne      0x140057656
   14005764b  mov      eax, dword ptr [rsp + 0x3c]
   14005764f  add      eax, 0x76c
   140057654  jmp      0x140057658
   140057656  xor      eax, eax
   140057658  cmp      dword ptr [rip + 0x1ffe35], 0x18
   14005765f  jle      0x14005767b
   140057661  cmp      eax, 0x7e8
   140057666  setl     al
   140057669  mov      rcx, qword ptr [rsp + 0x50]
   14005766e  xor      rcx, rsp
   140057671  call     0x1400ff700
   140057676  add      rsp, 0x68
   14005767a  ret      
   14005767b  xor      al, al
   14005767d  mov      rcx, qword ptr [rsp + 0x50]
   140057682  xor      rcx, rsp
   140057685  call     0x1400ff700
   14005768a  add      rsp, 0x68
   14005768e  ret      
   14005768f  mov      al, 1
   140057691  mov      rcx, qword ptr [rsp + 0x50]
   140057696  xor      rcx, rsp
   140057699  call     0x1400ff700
   14005769e  add      rsp, 0x68
   1400576a2  ret      
