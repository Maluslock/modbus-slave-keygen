   1400414b0  push     rbx
   1400414b2  sub      rsp, 0x30
   1400414b6  mov      rbx, rcx
   1400414b9  call     0x140058f80
   1400414be  test     al, al
   1400414c0  je       0x1400414cd
   1400414c2  mov      eax, 0x64
   1400414c7  add      rsp, 0x30
   1400414cb  pop      rbx
   1400414cc  ret      
   1400414cd  cmp      dword ptr [rbx + 0x1bc], 0
   1400414d4  je       0x1400414e1
   1400414d6  mov      eax, 0xff
   1400414db  add      rsp, 0x30
   1400414df  pop      rbx
   1400414e0  ret      
   1400414e1  mov      eax, dword ptr [rbx + 0x1b0]
   1400414e7  neg      eax
