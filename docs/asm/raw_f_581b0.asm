   1400581b0  mov      qword ptr [rsp + 0x10], rbx
   1400581b5  push     rdi
   1400581b6  sub      rsp, 0x20
   1400581ba  call     0x1400698f0
   1400581bf  mov      rcx, rax
   1400581c2  test     rax, rax
   1400581c5  je       0x14005826d
   1400581cb  mov      rax, qword ptr [rax]
   1400581ce  call     qword ptr [rax + 0x18]
   1400581d1  lea      rbx, [rax + 0x18]
   1400581d5  mov      qword ptr [rsp + 0x30], rbx
   1400581da  cmp      byte ptr [rip + 0x1ff2af], 0
   1400581e1  jne      0x14005823e
   1400581e3  lea      rcx, [rip + 0x1ff2b6]
   1400581ea  call     0x1400781b4
   1400581ef  cmp      byte ptr [rip + 0x1ff29a], 0
   1400581f6  jne      0x14005823e
   1400581f8  mov      r8d, dword ptr [rip + 0x1ff295]
   1400581ff  test     r8d, r8d
   140058202  jne      0x140058219
   140058204  lea      edx, [r8 + 0x30]
   140058208  lea      rcx, [rip + 0x17e211]
   14005820f  call     0x1400810d0
   140058214  xor      dil, dil
   140058217  jmp      0x140058241
   140058219  lea      rdx, [rip + 0x17e250]
   140058220  lea      rcx, [rsp + 0x30]
   140058225  call     0x140001cc0
   14005822a  xor      r8d, r8d
   14005822d  lea      edx, [r8 + 0x30]
   140058231  mov      rbx, qword ptr [rsp + 0x30]
   140058236  mov      rcx, rbx
   140058239  call     0x1400810d0
   14005823e  mov      dil, 1
   140058241  lea      rdx, [rbx - 0x18]
   140058245  mov      ecx, 0xffffffff
   14005824a  lock xadd dword ptr [rdx + 0x10], ecx
   14005824f  sub      ecx, 1
   140058252  jg       0x14005825e
   140058254  mov      rcx, qword ptr [rdx]
   140058257  mov      r8, qword ptr [rcx]
   14005825a  call     qword ptr [r8 + 8]
   14005825e  movzx    eax, dil
   140058262  mov      rbx, qword ptr [rsp + 0x38]
   140058267  add      rsp, 0x20
   14005826b  pop      rdi
   14005826c  ret      
   14005826d  mov      ecx, 0x80004005
   140058272  call     0x140001b30
   140058277  int3     
