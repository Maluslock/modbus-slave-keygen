   1400410c0  mov      qword ptr [rsp + 8], rbx
   1400410c5  mov      qword ptr [rsp + 0x10], rbp
   1400410ca  push     rsi
   1400410cb  push     rdi
   1400410cc  push     r14
   1400410ce  sub      rsp, 0x30
   1400410d2  mov      ebp, edx
   1400410d4  mov      rdi, rcx
   1400410d7  call     0x1400698f0
   1400410dc  mov      rcx, rax
   1400410df  test     rax, rax
   1400410e2  je       0x1400412dc
   1400410e8  mov      rax, qword ptr [rax]
   1400410eb  call     qword ptr [rax + 0x18]
   1400410ee  lea      rbx, [rax + 0x18]
   1400410f2  mov      qword ptr [rsp + 0x60], rbx
   1400410f7  call     0x1400581b0
   1400410fc  test     al, al
   1400410fe  je       0x1400412ad
   140041104  test     ebp, ebp
   140041106  jne      0x14004111f
   140041108  lea      rdx, [rdi + 0x190]
   14004110f  mov      rcx, rdi
   140041112  call     0x140040ba0
   140041117  test     eax, eax
   140041119  je       0x1400412ad
   14004111f  mov      rcx, rdi
   140041122  cmp      dword ptr [rdi + 0x1c4], 0
   140041129  jne      0x140041132
   14004112b  call     0x1400414b0
   140041130  jmp      0x140041137
   140041132  call     0x140041320
   140041137  mov      esi, eax
   140041139  cmp      dword ptr [rdi + 0x1bc], 0
   140041140  jne      0x140041299
   140041146  cmp      dword ptr [rdi + 0x1c4], 0
   14004114d  jne      0x1400411ef
   140041153  mov      ecx, eax
   140041155  sub      ecx, 1
   140041158  je       0x1400411d9
   14004115a  sub      ecx, 1
   14004115d  je       0x140041172
   14004115f  sub      ecx, 1
   140041162  je       0x140041172
   140041164  sub      ecx, 1
   140041167  je       0x140041172
   140041169  cmp      ecx, 1
   14004116c  jne      0x1400412ad
   140041172  movsxd   rax, dword ptr [rdi + 0x194]
   140041179  lea      rdx, [rip - 0x41180]
   140041180  mov      ebx, dword ptr [rdx + rax*4 + 0x1d1260]
   140041187  cmp      dword ptr [rdi + 0x2bc], 0
   14004118e  je       0x140041196
   140041190  mov      ebx, dword ptr [rdi + 0x2b8]
   140041196  call     0x140025b70
   14004119b  mov      r9d, eax
   14004119e  mov      dword ptr [rsp + 0x20], ebx
   1400411a2  mov      r8d, esi
   1400411a5  lea      rdx, [rip + 0x190944]
   1400411ac  lea      rcx, [rsp + 0x60]
   1400411b1  call     0x140001cc0
   1400411b6  mov      r9d, 0x30
   1400411bc  lea      r8, [rip + 0x187175]
   1400411c3  mov      rbx, qword ptr [rsp + 0x60]
   1400411c8  mov      rdx, rbx
   1400411cb  mov      rcx, qword ptr [rdi + 0x40]
   1400411cf  call     0x140070838
   1400411d4  jmp      0x1400412ad
   1400411d9  mov      r8d, dword ptr [rdi + 0x190]
   1400411e0  inc      r8d
   1400411e3  lea      rdx, [rip + 0x1908d6]
   1400411ea  jmp      0x14004126f
   1400411ef  call     0x140063270
   1400411f4  add      esi, -0xc
   1400411f7  cmp      esi, 0xc
   1400411fa  ja       0x140041265
   1400411fc  movsxd   rcx, esi
   1400411ff  lea      rdx, [rip - 0x41206]
   140041206  mov      ecx, dword ptr [rdx + rcx*4 + 0x412e8]
   14004120d  add      rcx, rdx
   140041210  jmp      rcx
   140041212  lea      rdx, [rip + 0x1909a7]
   140041219  jmp      0x14004126c
   14004121b  lea      rdx, [rip + 0x190a0e]
   140041222  jmp      0x14004126c
   140041224  lea      rdx, [rip + 0x190a75]
   14004122b  jmp      0x14004126c
   14004122d  mov      r9d, eax
   140041230  mov      r8, qword ptr [rdi + 0x178]
   140041237  lea      rdx, [rip + 0x190ac2]
   14004123e  lea      rcx, [rsp + 0x60]
   140041243  call     0x140001cc0
   140041248  jmp      0x140041279
   14004124a  lea      rdx, [rip + 0x190b2f]
   140041251  jmp      0x14004126c
   140041253  lea      rdx, [rip + 0x190ba6]
   14004125a  jmp      0x14004126c
   14004125c  lea      rdx, [rip + 0x190c2d]
   140041263  jmp      0x14004126c
   140041265  lea      rdx, [rip + 0x190d64]
   14004126c  mov      r8d, eax
   14004126f  lea      rcx, [rsp + 0x60]
   140041274  call     0x140001cc0
   140041279  mov      r9d, 0x30
   14004127f  lea      r8, [rip + 0x1870b2]
   140041286  mov      rbx, qword ptr [rsp + 0x60]
   14004128b  mov      rdx, rbx
   14004128e  mov      rcx, qword ptr [rdi + 0x40]
   140041292  call     0x140070838
   140041297  jmp      0x1400412ad
   140041299  test     ebp, ebp
   14004129b  jne      0x1400412ad
   14004129d  lea      rdx, [rdi + 0x190]
   1400412a4  mov      rcx, rdi
   1400412a7  call     0x140044750
   1400412ac  nop      
   1400412ad  lea      rdx, [rbx - 0x18]
   1400412b1  mov      eax, 0xffffffff
   1400412b6  lock xadd dword ptr [rdx + 0x10], eax
   1400412bb  sub      eax, 1
   1400412be  jg       0x1400412c9
   1400412c0  mov      rcx, qword ptr [rdx]
   1400412c3  mov      rax, qword ptr [rcx]
   1400412c6  call     qword ptr [rax + 8]
   1400412c9  mov      rbx, qword ptr [rsp + 0x50]
   1400412ce  mov      rbp, qword ptr [rsp + 0x58]
   1400412d3  add      rsp, 0x30
   1400412d7  pop      r14
   1400412d9  pop      rdi
   1400412da  pop      rsi
   1400412db  ret      
   1400412dc  mov      ecx, 0x80004005
   1400412e1  call     0x140001b30
   1400412e6  int3     
   1400412e7  nop      
   1400412e8  adc      dl, byte ptr [rdx]
   1400412ea  add      al, 0
   1400412ec  adc      al, byte ptr gs:[rax + rax]
   1400412f0  adc      al, byte ptr gs:[rax + rax]
   1400412f4  sbb      edx, dword ptr [rdx]
   1400412f6  add      al, 0
   1400412f8  adc      al, byte ptr gs:[rax + rax]
   1400412fc  adc      al, byte ptr gs:[rax + rax]
   140041300  adc      al, byte ptr gs:[rax + rax]
   140041304  adc      al, byte ptr gs:[rax + rax]
   140041308  sub      eax, 0x4a000412
   14004130d  adc      al, byte ptr [rax + rax]
   140041310  and      al, 0x12
   140041312  add      al, 0
   140041314  pop      rsp
   140041315  adc      al, byte ptr [rax + rax]
   140041318  push     rbx
   140041319  adc      al, byte ptr [rax + rax]
