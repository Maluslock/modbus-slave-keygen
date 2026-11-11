   14005ee80  push     rbx
   14005ee82  sub      rsp, 0x50
   14005ee86  mov      rdx, qword ptr [rcx + 0x10]
   14005ee8a  lea      rbx, [rcx + 8]
   14005ee8e  mov      rcx, qword ptr [rcx]
   14005ee91  lea      rax, [rsp + 0x60]
   14005ee96  mov      qword ptr [rsp + 0x40], rax
   14005ee9b  lea      r9, [rip + 0x168b22]
   14005eea2  xor      eax, eax
   14005eea4  mov      qword ptr [rsp + 0x38], rbx
   14005eea9  mov      qword ptr [rsp + 0x30], rax
   14005eeae  xor      r8d, r8d
   14005eeb1  mov      dword ptr [rsp + 0x28], 0x20006
   14005eeb9  mov      dword ptr [rsp + 0x20], eax
   14005eebd  call     qword ptr [rip + 0x16714d]
   14005eec3  test     eax, eax
   14005eec5  jne      0x14005eed0
   14005eec7  mov      rcx, qword ptr [rbx]
   14005eeca  call     qword ptr [rip + 0x167178]
   14005eed0  add      rsp, 0x50
   14005eed4  pop      rbx
   14005eed5  ret      