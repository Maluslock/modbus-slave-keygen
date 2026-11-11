   140058290  push     rbp
   140058292  push     rbx
   140058293  push     rsi
   140058294  push     rdi
   140058295  lea      rbp, [rsp - 0x3f]
   14005829a  sub      rsp, 0xc8
   1400582a1  call     0x1400698f0
   1400582a6  mov      rcx, rax
   1400582a9  test     rax, rax
   1400582ac  je       0x140058543
   1400582b2  mov      rax, qword ptr [rax]
   1400582b5  call     qword ptr [rax + 0x18]
   1400582b8  add      rax, 0x18
   1400582bc  mov      qword ptr [rbp + 0x6f], rax
   1400582c0  lea      rsi, [rip + 0x16f6fd]
   1400582c7  mov      rbx, 0xffffffffffffffff
   1400582ce  cmp      rsi, 0x10000
   1400582d5  jae      0x1400582e5
   1400582d7  movzx    edx, si
   1400582da  lea      rcx, [rbp + 0x6f]
   1400582de  call     0x140001ea0
   1400582e3  jmp      0x140058308
   1400582e5  mov      r8, rbx
   1400582e8  nop      dword ptr [rax + rax]
   1400582f0  inc      r8
   1400582f3  cmp      word ptr [rsi + r8*2], 0
   1400582f9  jne      0x1400582f0
   1400582fb  mov      rdx, rsi
   1400582fe  lea      rcx, [rbp + 0x6f]
   140058302  call     0x1400020c0
   140058307  nop      
   140058308  call     0x1400698f0
   14005830d  mov      rcx, rax
   140058310  test     rax, rax
   140058313  je       0x14005854e
   140058319  mov      rax, qword ptr [rax]
   14005831c  call     qword ptr [rax + 0x18]
   14005831f  add      rax, 0x18
   140058323  mov      qword ptr [rbp + 0x67], rax
   140058327  lea      rdi, [rip + 0x17de72]
   14005832e  cmp      rdi, 0x10000
   140058335  jae      0x140058345
   140058337  movzx    edx, di
   14005833a  lea      rcx, [rbp + 0x67]
   14005833e  call     0x140001ea0
   140058343  jmp      0x140058368
   140058345  mov      r8, rbx
   140058348  nop      dword ptr [rax + rax]
   140058350  inc      r8
   140058353  cmp      word ptr [rdi + r8*2], 0
   140058359  jne      0x140058350
   14005835b  mov      rdx, rdi
   14005835e  lea      rcx, [rbp + 0x67]
   140058362  call     0x1400020c0
   140058367  nop      
   140058368  mov      qword ptr [rsp + 0x20], 0xffffffff80000001
   140058371  mov      r9d, 1
   140058377  lea      r8, [rbp + 0x6f]
   14005837b  lea      rdx, [rbp + 0x67]
   14005837f  lea      rcx, [rbp - 9]
   140058383  call     0x14005e2b0
   140058388  nop      
   140058389  mov      rdx, qword ptr [rbp + 0x67]
   14005838d  add      rdx, -0x18
   140058391  mov      eax, ebx
   140058393  lock xadd dword ptr [rdx + 0x10], eax
   140058398  sub      eax, 1
   14005839b  jg       0x1400583a7
   14005839d  mov      rcx, qword ptr [rdx]
   1400583a0  mov      rax, qword ptr [rcx]
   1400583a3  call     qword ptr [rax + 8]
   1400583a6  nop      
   1400583a7  mov      rdx, qword ptr [rbp + 0x6f]
   1400583ab  add      rdx, -0x18
   1400583af  mov      eax, ebx
   1400583b1  lock xadd dword ptr [rdx + 0x10], eax
   1400583b6  sub      eax, 1
   1400583b9  jg       0x1400583c4
   1400583bb  mov      rcx, qword ptr [rdx]
   1400583be  mov      rax, qword ptr [rcx]
   1400583c1  call     qword ptr [rax + 8]
   1400583c4  mov      byte ptr [rip + 0x1ff0c5], 0
   1400583cb  xor      ecx, ecx
   1400583cd  call     0x140057d00
   1400583d2  lea      rdx, [rbp - 0x59]
   1400583d6  lea      rcx, [rbp - 9]
   1400583da  call     0x14005edf0
   1400583df  xor      edx, edx
   1400583e1  mov      rcx, rax
   1400583e4  call     0x140057030
   1400583e9  cmp      eax, 6
   1400583ec  jne      0x1400583fa
   1400583ee  mov      byte ptr [rip + 0x1ff09b], 1
   1400583f5  jmp      0x140058523
   1400583fa  call     0x1400698f0
   1400583ff  mov      rcx, rax
   140058402  test     rax, rax
   140058405  je       0x140058559
   14005840b  mov      rax, qword ptr [rax]
   14005840e  call     qword ptr [rax + 0x18]
   140058411  add      rax, 0x18
   140058415  mov      qword ptr [rbp + 0x7f], rax
   140058419  cmp      rsi, 0x10000
   140058420  jae      0x140058430
   140058422  movzx    edx, si
   140058425  lea      rcx, [rbp + 0x7f]
   140058429  call     0x140001ea0
   14005842e  jmp      0x14005844b
   140058430  mov      r8, rbx
   140058433  inc      r8
   140058436  cmp      word ptr [rsi + r8*2], 0
   14005843c  jne      0x140058433
   14005843e  mov      rdx, rsi
   140058441  lea      rcx, [rbp + 0x7f]
   140058445  call     0x1400020c0
   14005844a  nop      
   14005844b  call     0x1400698f0
   140058450  mov      rcx, rax
   140058453  test     rax, rax
   140058456  je       0x140058538
   14005845c  mov      rax, qword ptr [rax]
   14005845f  call     qword ptr [rax + 0x18]
   140058462  add      rax, 0x18
   140058466  mov      qword ptr [rbp + 0x77], rax
   14005846a  cmp      rdi, 0x10000
   140058471  jae      0x140058481
   140058473  movzx    edx, di
   140058476  lea      rcx, [rbp + 0x77]
   14005847a  call     0x140001ea0
   14005847f  jmp      0x14005849c
   140058481  mov      r8, rbx
   140058484  inc      r8
   140058487  cmp      word ptr [rdi + r8*2], 0
   14005848d  jne      0x140058484
   14005848f  mov      rdx, rdi
   140058492  lea      rcx, [rbp + 0x77]
   140058496  call     0x1400020c0
   14005849b  nop      
   14005849c  mov      qword ptr [rsp + 0x20], 0xffffffff80000002
   1400584a5  mov      r9d, 1
   1400584ab  lea      r8, [rbp + 0x7f]
   1400584af  lea      rdx, [rbp + 0x77]
   1400584b3  lea      rcx, [rbp - 0x41]
   1400584b7  call     0x14005e2b0
   1400584bc  nop      
   1400584bd  mov      rdx, qword ptr [rbp + 0x77]
   1400584c1  add      rdx, -0x18
   1400584c5  mov      eax, ebx
   1400584c7  lock xadd dword ptr [rdx + 0x10], eax
   1400584cc  sub      eax, 1
   1400584cf  jg       0x1400584db
   1400584d1  mov      rcx, qword ptr [rdx]
   1400584d4  mov      rax, qword ptr [rcx]
   1400584d7  call     qword ptr [rax + 8]
   1400584da  nop      
   1400584db  mov      rdx, qword ptr [rbp + 0x7f]
   1400584df  add      rdx, -0x18
   1400584e3  lock xadd dword ptr [rdx + 0x10], ebx
   1400584e8  sub      ebx, 1
   1400584eb  jg       0x1400584f6
   1400584ed  mov      rcx, qword ptr [rdx]
   1400584f0  mov      rax, qword ptr [rcx]
   1400584f3  call     qword ptr [rax + 8]
   1400584f6  lea      rdx, [rbp - 0x51]
   1400584fa  lea      rcx, [rbp - 0x41]
   1400584fe  call     0x14005edf0
   140058503  xor      edx, edx
   140058505  mov      rcx, rax
   140058508  call     0x140057030
   14005850d  cmp      eax, 6
   140058510  jne      0x140058519
   140058512  mov      byte ptr [rip + 0x1fef77], 1
   140058519  lea      rcx, [rbp - 0x41]
   14005851d  call     0x14005ebd0
   140058522  nop      
   140058523  lea      rcx, [rbp - 9]
   140058527  call     0x14005ebd0
   14005852c  add      rsp, 0xc8
   140058533  pop      rdi
   140058534  pop      rsi
   140058535  pop      rbx
   140058536  pop      rbp
   140058537  ret      
   140058538  mov      ecx, 0x80004005
   14005853d  call     0x140001b30
   140058542  nop      
   140058543  mov      ecx, 0x80004005
   140058548  call     0x140001b30
   14005854d  nop      
   14005854e  mov      ecx, 0x80004005
   140058553  call     0x140001b30
   140058558  nop      
   140058559  mov      ecx, 0x80004005
   14005855e  call     0x140001b30
   140058563  int3     
