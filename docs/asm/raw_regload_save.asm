==== 5f2a0
   14005f2a0  push     rbx
   14005f2a2  push     rbp
   14005f2a3  push     rsi
   14005f2a4  push     rdi
   14005f2a5  push     r12
   14005f2a7  push     r14
   14005f2a9  push     r15
   14005f2ab  sub      rsp, 0x40
   14005f2af  mov      rsi, rdx
   14005f2b2  mov      rdi, rcx
   14005f2b5  xor      r12d, r12d
   14005f2b8  lea      r14, [rcx + 8]
   14005f2bc  mov      qword ptr [rsp + 0x20], r14
   14005f2c1  mov      r9d, 0x20019
   14005f2c7  xor      r8d, r8d
   14005f2ca  mov      rdx, qword ptr [rcx + 0x18]
   14005f2ce  mov      rcx, qword ptr [rcx]
   14005f2d1  call     qword ptr [rip + 0x166d89]
   14005f2d7  test     eax, eax
   14005f2d9  jne      0x14005f44d
   14005f2df  mov      dword ptr [rsp + 0x80], r12d
   14005f2e7  lea      rax, [rsp + 0x80]
   14005f2ef  mov      qword ptr [rsp + 0x28], rax
   14005f2f4  mov      qword ptr [rsp + 0x20], r12
   14005f2f9  lea      r9, [rsp + 0x90]
   14005f301  xor      r8d, r8d
   14005f304  mov      rdx, qword ptr [rdi + 0x10]
   14005f308  mov      rcx, qword ptr [r14]
   14005f30b  call     qword ptr [rip + 0x166cf7]
   14005f311  movsxd   rcx, dword ptr [rsp + 0x80]
   14005f319  mov      eax, 2
   14005f31e  mul      rcx
   14005f321  mov      rbp, 0xffffffffffffffff
   14005f328  cmovo    rax, rbp
   14005f32c  mov      rcx, rax
   14005f32f  call     0x140080bd0
   14005f334  mov      rbx, rax
   14005f337  lea      rax, [rsp + 0x80]
   14005f33f  mov      qword ptr [rsp + 0x28], rax
   14005f344  mov      qword ptr [rsp + 0x20], rbx
   14005f349  lea      r9, [rsp + 0x90]
   14005f351  xor      r8d, r8d
   14005f354  mov      rdx, qword ptr [rdi + 0x10]
   14005f358  mov      rcx, qword ptr [r14]
   14005f35b  call     qword ptr [rip + 0x166ca7]
   14005f361  test     eax, eax
   14005f363  jne      0x14005f423
   14005f369  call     0x1400698f0
   14005f36e  mov      rcx, rax
   14005f371  test     rax, rax
   14005f374  je       0x14005f480
   14005f37a  mov      rax, qword ptr [rax]
   14005f37d  call     qword ptr [rax + 0x18]
   14005f380  add      rax, 0x18
   14005f384  mov      qword ptr [rsp + 0x98], rax
   14005f38c  test     rbx, rbx
   14005f38f  je       0x14005f3bd
   14005f391  cmp      rbx, 0x10000
   14005f398  jae      0x14005f3ac
   14005f39a  movzx    edx, bx
   14005f39d  lea      rcx, [rsp + 0x98]
   14005f3a5  call     0x140001ea0
   14005f3aa  jmp      0x14005f3d1
   14005f3ac  mov      r8, rbp
   14005f3af  nop      
   14005f3b0  inc      r8
   14005f3b3  cmp      word ptr [rbx + r8*2], 0
   14005f3b9  jne      0x14005f3b0
   14005f3bb  jmp      0x14005f3c0
   14005f3bd  mov      r8d, r12d
   14005f3c0  mov      rdx, rbx
   14005f3c3  lea      rcx, [rsp + 0x98]
   14005f3cb  call     0x1400020c0
   14005f3d0  nop      
   14005f3d1  lea      rdx, [rsp + 0x98]
   14005f3d9  lea      rcx, [rdi + 0x20]
   14005f3dd  call     0x140003490
   14005f3e2  nop      
   14005f3e3  mov      rdx, qword ptr [rsp + 0x98]
   14005f3eb  add      rdx, -0x18
   14005f3ef  lock xadd dword ptr [rdx + 0x10], ebp
   14005f3f4  sub      ebp, 1
   14005f3f7  jg       0x14005f402
   14005f3f9  mov      rcx, qword ptr [rdx]
   14005f3fc  mov      rax, qword ptr [rcx]
   14005f3ff  call     qword ptr [rax + 8]
   14005f402  mov      rcx, rbx
   14005f405  call     0x140080bd8
   14005f40a  mov      dword ptr [rdi + 0x30], 1
   14005f411  mov      rcx, qword ptr [r14]
   14005f414  call     qword ptr [rip + 0x166c2e]
   14005f41a  mov      qword ptr [r14], r12
   14005f41d  mov      rcx, qword ptr [rdi + 0x20]
   14005f421  jmp      0x14005f45e
   14005f423  mov      rcx, rbx
   14005f426  call     0x140080bd8
   14005f42b  mov      rcx, qword ptr [r14]
   14005f42e  call     qword ptr [rip + 0x166c14]
   14005f434  mov      qword ptr [r14], r12
   14005f437  lea      rcx, [rdi + 0x20]
   14005f43b  lea      rdx, [rdi + 0x28]
   14005f43f  call     0x140003490
   14005f444  mov      dword ptr [rdi + 0x30], 1
   14005f44b  jmp      0x14005f45a
   14005f44d  lea      rcx, [rdi + 0x20]
   14005f451  lea      rdx, [rdi + 0x28]
   14005f455  call     0x140003490
   14005f45a  mov      rcx, qword ptr [rdi + 0x28]
   14005f45e  sub      rcx, 0x18
   14005f462  call     0x140002e60
   14005f467  add      rax, 0x18
   14005f46b  mov      qword ptr [rsi], rax
   14005f46e  mov      rax, rsi
   14005f471  add      rsp, 0x40
   14005f475  pop      r15
   14005f477  pop      r14
   14005f479  pop      r12
   14005f47b  pop      rdi
   14005f47c  pop      rsi
   14005f47d  pop      rbp
   14005f47e  pop      rbx
   14005f47f  ret      
   14005f480  mov      ecx, 0x80004005
   14005f485  call     0x140001b30
   14005f48a  int3     
==== 5f4d0
   14005f4d0  mov      qword ptr [rsp + 0x10], rbx
   14005f4d5  push     rdi
   14005f4d6  sub      rsp, 0x50
   14005f4da  mov      rdx, qword ptr [rcx + 0x18]
   14005f4de  lea      rdi, [rcx + 8]
   14005f4e2  lea      rax, [rsp + 0x60]
   14005f4e7  mov      rbx, rcx
   14005f4ea  mov      rcx, qword ptr [rcx]
   14005f4ed  lea      r9, [rip + 0x1684d0]
   14005f4f4  mov      qword ptr [rsp + 0x40], rax
   14005f4f9  xor      r8d, r8d
   14005f4fc  mov      qword ptr [rsp + 0x38], rdi
   14005f501  mov      qword ptr [rsp + 0x30], 0
   14005f50a  mov      dword ptr [rsp + 0x28], 0x20006
   14005f512  mov      dword ptr [rsp + 0x20], 0
   14005f51a  call     qword ptr [rip + 0x166af0]
   14005f520  test     eax, eax
   14005f522  jne      0x14005f566
   14005f524  mov      rdx, qword ptr [rbx + 0x10]
   14005f528  lea      rax, [rbx + 0x20]
   14005f52c  mov      rcx, qword ptr [rdi]
   14005f52f  mov      r9d, 4
   14005f535  mov      dword ptr [rsp + 0x28], 4
   14005f53d  xor      r8d, r8d
   14005f540  mov      qword ptr [rsp + 0x20], rax
   14005f545  call     qword ptr [rip + 0x166b0d]
   14005f54b  test     eax, eax
   14005f54d  jne      0x14005f556
   14005f54f  mov      dword ptr [rbx + 0x28], 1
   14005f556  mov      rcx, qword ptr [rdi]
   14005f559  call     qword ptr [rip + 0x166ae9]
   14005f55f  mov      qword ptr [rdi], 0
   14005f566  mov      rbx, qword ptr [rsp + 0x68]
   14005f56b  add      rsp, 0x50
   14005f56f  pop      rdi
   14005f570  ret      