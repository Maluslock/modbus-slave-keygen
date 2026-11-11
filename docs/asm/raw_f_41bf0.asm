   140041bf0  mov      qword ptr [rsp + 8], rbx
   140041bf5  push     rdi
   140041bf6  sub      rsp, 0x3b0
   140041bfd  lea      rcx, [rsp + 0x20]
   140041c02  call     0x140001880
   140041c07  nop      
   140041c08  call     0x140058f70
   140041c0d  test     al, al
   140041c0f  je       0x140041c77
   140041c11  mov      rdx, qword ptr [rip + 0x215880]
   140041c18  lea      rcx, [rdx - 0x18]
   140041c1c  mov      rbx, qword ptr [rsp + 0x150]
   140041c24  add      rbx, -0x18
   140041c28  cmp      rcx, rbx
   140041c2b  je       0x140041c9d
   140041c2d  cmp      dword ptr [rbx + 0x10], 0
   140041c31  jl       0x140041c71
   140041c33  mov      rax, qword ptr [rbx]
   140041c36  cmp      qword ptr [rcx], rax
   140041c39  jne      0x140041c71
   140041c3b  call     0x140002e60
   140041c40  mov      rdi, rax
   140041c43  mov      r8, 0xffffffffffffffff
   140041c4a  lock xadd dword ptr [rbx + 0x10], r8d
   140041c50  sub      r8d, 1
   140041c54  jg       0x140041c63
   140041c56  mov      rcx, qword ptr [rbx]
   140041c59  mov      r8, qword ptr [rcx]
   140041c5c  mov      rdx, rbx
   140041c5f  call     qword ptr [r8 + 8]
   140041c63  lea      rax, [rdi + 0x18]
   140041c67  mov      qword ptr [rsp + 0x150], rax
   140041c6f  jmp      0x140041c9d
   140041c71  mov      r8d, dword ptr [rdx - 0x10]
   140041c75  jmp      0x140041c90
   140041c77  lea      rdx, [rip + 0x18fbc2]
   140041c7e  mov      r8, 0xffffffffffffffff
   140041c85  inc      r8
   140041c88  cmp      word ptr [rdx + r8*2], 0
   140041c8e  jne      0x140041c85
   140041c90  lea      rcx, [rsp + 0x150]
   140041c98  call     0x1400020c0
   140041c9d  lea      rcx, [rsp + 0x20]
   140041ca2  call     0x1400781b4
   140041ca7  nop      
   140041ca8  lea      rcx, [rsp + 0x20]
   140041cad  call     0x140001a60
   140041cb2  mov      rbx, qword ptr [rsp + 0x3c0]
   140041cba  add      rsp, 0x3b0
   140041cc1  pop      rdi
   140041cc2  ret      
