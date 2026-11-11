   140058f80  sub      rsp, 0x28
   140058f84  cmp      dword ptr [rip + 0x1fe509], 0
   140058f8b  jne      0x140058fb0
   140058f8d  cmp      byte ptr [rip + 0x1fe4fc], 0
   140058f94  jne      0x140058fb0
   140058f96  xor      r8d, r8d
   140058f99  lea      rcx, [rip + 0x17d480]
   140058fa0  lea      edx, [r8 + 0x30]
   140058fa4  call     0x1400810d0
   140058fa9  mov      al, 1
   140058fab  add      rsp, 0x28
   140058faf  ret      
   140058fb0  xor      al, al
   140058fb2  add      rsp, 0x28
   140058fb6  ret      
