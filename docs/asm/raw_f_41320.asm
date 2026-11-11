   140041320  push     rbx
   140041322  sub      rsp, 0x30
   140041326  mov      rbx, rcx
   140041329  call     0x140058f80
   14004132e  test     al, al
   140041330  je       0x14004133d
   140041332  mov      eax, 0x64
   140041337  add      rsp, 0x30
   14004133b  pop      rbx
   14004133c  ret      
   14004133d  cmp      dword ptr [rbx + 0x1bc], 0
   140041344  je       0x140041351
   140041346  mov      eax, 0xff
   14004134b  add      rsp, 0x30
   14004134f  pop      rbx
   140041350  ret      
   140041351  mov      rax, qword ptr [rbx + 0x1e8]
