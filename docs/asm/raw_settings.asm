==== func 5d810..5dca2 (entry 5d810)
   14005d810  mov      qword ptr [rsp + 0x10], rbx
   14005d815  mov      qword ptr [rsp + 0x18], rbp
   14005d81a  mov      qword ptr [rsp + 0x20], rsi
   14005d81f  mov      qword ptr [rsp + 8], rcx
   14005d824  push     rdi
   14005d825  push     r12
   14005d827  push     r13
   14005d829  push     r14
   14005d82b  push     r15
   14005d82d  sub      rsp, 0x30
   14005d831  mov      ebx, r9d
   14005d834  mov      edi, r8d
   14005d837  mov      rbp, rdx
   14005d83a  mov      r12, rcx
   14005d83d  xor      r13d, r13d
   14005d840  call     0x1400698f0
   14005d845  mov      rcx, rax
   14005d848  test     rax, rax
   14005d84b  je       0x14005dc81
   14005d851  mov      rax, qword ptr [rax]
   14005d854  call     qword ptr [rax + 0x18]
   14005d857  add      rax, 0x18
   14005d85b  mov      qword ptr [r12 + 0x10], rax
   14005d860  call     0x1400698f0
   14005d865  mov      rcx, rax
   14005d868  test     rax, rax
   14005d86b  je       0x14005dc81
   14005d871  mov      rax, qword ptr [rax]
   14005d874  call     qword ptr [rax + 0x18]
   14005d877  add      rax, 0x18
   14005d87b  mov      qword ptr [r12 + 0x18], rax
   14005d880  mov      dword ptr [r12 + 0x20], r13d
   14005d885  mov      dword ptr [r12 + 0x24], edi
   14005d88a  mov      dword ptr [r12 + 0x2c], ebx
   14005d88f  mov      rax, qword ptr [rsp + 0x80]
   14005d897  mov      qword ptr [r12], rax
   14005d89b  mov      dword ptr [r12 + 0x28], r13d
   14005d8a0  mov      rdx, rbp
   14005d8a3  lea      rcx, [r12 + 0x10]
   14005d8a8  call     0x140003490
   14005d8ad  mov      rbx, qword ptr [r12 + 0x10]
   14005d8b2  movzx    eax, word ptr [rbx]
   14005d8b5  test     ax, ax
   14005d8b8  je       0x14005d8e0
   14005d8ba  nop      word ptr [rax + rax]
   14005d8c0  movzx    edx, ax
   14005d8c3  lea      rcx, [rip + 0x17d082]
   14005d8ca  call     0x140138e9c
   14005d8cf  test     rax, rax
   14005d8d2  je       0x14005d8e0
   14005d8d4  add      rbx, 2
   14005d8d8  movzx    eax, word ptr [rbx]
   14005d8db  test     ax, ax
   14005d8de  jne      0x14005d8c0
   14005d8e0  mov      rdx, qword ptr [r12 + 0x10]
   14005d8e5  cmp      rbx, rdx
   14005d8e8  je       0x14005d98c
   14005d8ee  sub      rbx, rdx
   14005d8f1  sar      rbx, 1
   14005d8f4  mov      edx, dword ptr [rdx - 0x10]
   14005d8f7  lea      rcx, [r12 + 0x10]
   14005d8fc  call     0x14005ee30
   14005d901  mov      r9, rax
   14005d904  movsxd   rax, ebx
   14005d907  lea      rdx, [r9 + rax*2]
   14005d90b  mov      rax, qword ptr [r12 + 0x10]
   14005d910  mov      ecx, dword ptr [rax - 0x10]
   14005d913  mov      edi, ecx
   14005d915  sub      edi, ebx
   14005d917  lea      eax, [rdi + 1]
   14005d91a  movsxd   r8, eax
   14005d91d  add      r8, r8
   14005d920  je       0x14005d966
   14005d922  test     r9, r9
   14005d925  jne      0x14005d937
   14005d927  call     0x140148560
   14005d92c  mov      dword ptr [rax], 0x16
   14005d932  jmp      0x14005dc97
   14005d937  test     rdx, rdx
   14005d93a  jne      0x14005d94c
   14005d93c  call     0x140148560
   14005d941  mov      dword ptr [rax], 0x16
   14005d947  jmp      0x14005dc97
   14005d94c  lea      eax, [rcx + 1]
   14005d94f  movsxd   rcx, eax
   14005d952  add      rcx, rcx
   14005d955  cmp      rcx, r8
   14005d958  jb       0x14005dc8c
   14005d95e  mov      rcx, r9
   14005d961  call     0x1401b64b0
   14005d966  test     edi, edi
   14005d968  js       0x14005dc76
   14005d96e  mov      rax, qword ptr [r12 + 0x10]
   14005d973  cmp      edi, dword ptr [rax - 0xc]
   14005d976  jg       0x14005dc76
   14005d97c  mov      dword ptr [rax - 0x10], edi
   14005d97f  movsxd   rcx, edi
   14005d982  mov      rax, qword ptr [r12 + 0x10]
   14005d987  mov      word ptr [rax + rcx*2], r13w
   14005d98c  mov      edx, 0x5c
   14005d991  mov      rcx, qword ptr [r12 + 0x10]
   14005d996  call     0x140139120
   14005d99b  mov      rbp, rax
   14005d99e  mov      r14d, 0xffffffff
   14005d9a4  test     rax, rax
   14005d9a7  jne      0x14005d9ae
   14005d9a9  mov      ebp, r14d
   14005d9ac  jmp      0x14005d9b6
   14005d9ae  sub      rbp, qword ptr [r12 + 0x10]
   14005d9b3  sar      rbp, 1
   14005d9b6  mov      r8d, ebp
   14005d9b9  lea      rdx, [rsp + 0x28]
   14005d9be  lea      rcx, [r12 + 0x10]
   14005d9c3  call     0x140031620
   14005d9c8  nop      
   14005d9c9  mov      rdx, rax
   14005d9cc  lea      rcx, [r12 + 0x18]
   14005d9d1  call     0x140003490
   14005d9d6  nop      
   14005d9d7  mov      rdx, qword ptr [rsp + 0x28]
   14005d9dc  add      rdx, -0x18
   14005d9e0  mov      eax, r14d
   14005d9e3  lock xadd dword ptr [rdx + 0x10], eax
   14005d9e8  sub      eax, 1
   14005d9eb  jg       0x14005d9f6
   14005d9ed  mov      rcx, qword ptr [rdx]
   14005d9f0  mov      rax, qword ptr [rcx]
   14005d9f3  call     qword ptr [rax + 8]
   14005d9f6  mov      rdi, qword ptr [r12 + 0x18]
   14005d9fb  mov      rbx, r13
   14005d9fe  movzx    eax, word ptr [rdi]
   14005da01  mov      r13d, 1
   14005da07  test     ax, ax
   14005da0a  je       0x14005da97
   14005da10  movzx    edx, ax
   14005da13  lea      rcx, [rip + 0x17cf32]
   14005da1a  call     0x140138e9c
   14005da1f  test     rax, rax
   14005da22  je       0x14005da33
   14005da24  mov      rax, rdi
   14005da27  test     rbx, rbx
   14005da2a  cmovne   rax, rbx
   14005da2e  mov      rbx, rax
   14005da31  jmp      0x14005da35
   14005da33  xor      ebx, ebx
   14005da35  add      rdi, 2
   14005da39  movzx    eax, word ptr [rdi]
   14005da3c  test     ax, ax
   14005da3f  jne      0x14005da10
   14005da41  test     rbx, rbx
   14005da44  je       0x14005da97
   14005da46  mov      rax, qword ptr [r12 + 0x18]
   14005da4b  sub      rbx, rax
   14005da4e  sar      rbx, 1
   14005da51  test     ebx, ebx
   14005da53  js       0x14005dc76
   14005da59  mov      ecx, r13d
   14005da5c  sub      ecx, dword ptr [rax - 8]
   14005da5f  mov      eax, dword ptr [rax - 0xc]
   14005da62  sub      eax, ebx
   14005da64  or       eax, ecx
   14005da66  jge      0x14005da74
   14005da68  mov      edx, ebx
   14005da6a  lea      rcx, [r12 + 0x18]
   14005da6f  call     0x140002000
   14005da74  mov      rax, qword ptr [r12 + 0x18]
   14005da79  cmp      ebx, dword ptr [rax - 0xc]
   14005da7c  jg       0x14005dc76
   14005da82  mov      dword ptr [rax - 0x10], ebx
   14005da85  movsxd   rcx, ebx
   14005da88  mov      rax, qword ptr [r12 + 0x18]
   14005da8d  xor      r15d, r15d
   14005da90  mov      word ptr [rax + rcx*2], r15w
   14005da95  jmp      0x14005da9a
   14005da97  xor      r15d, r15d
   14005da9a  mov      rax, qword ptr [r12 + 0x10]
   14005da9f  mov      r9d, dword ptr [rax - 0x10]
   14005daa3  sub      r9d, ebp
   14005daa6  mov      r8d, ebp
   14005daa9  lea      rdx, [rsp + 0x20]
   14005daae  lea      rcx, [r12 + 0x10]
   14005dab3  call     0x140010850
   14005dab8  nop      
   14005dab9  lea      rdx, [rsp + 0x20]
   14005dabe  lea      rcx, [r12 + 0x10]
   14005dac3  call     0x140003490
   14005dac8  nop      
   14005dac9  mov      rdx, qword ptr [rsp + 0x20]
   14005dace  add      rdx, -0x18
   14005dad2  lock xadd dword ptr [rdx + 0x10], r14d
   14005dad8  sub      r14d, 1
   14005dadc  jg       0x14005dae7
   14005dade  mov      rcx, qword ptr [rdx]
   14005dae1  mov      rax, qword ptr [rcx]
   14005dae4  call     qword ptr [rax + 8]
   14005dae7  mov      rdi, qword ptr [r12 + 0x10]
   14005daec  mov      rbx, r15
   14005daef  movzx    eax, word ptr [rdi]
   14005daf2  test     ax, ax
   14005daf5  je       0x14005db82
   14005dafb  nop      dword ptr [rax + rax]
   14005db00  movzx    edx, ax
   14005db03  lea      rcx, [rip + 0x17ce42]
   14005db0a  call     0x140138e9c
   14005db0f  test     rax, rax
   14005db12  je       0x14005db23
   14005db14  mov      rax, rdi
   14005db17  test     rbx, rbx
   14005db1a  cmovne   rax, rbx
   14005db1e  mov      rbx, rax
   14005db21  jmp      0x14005db26
   14005db23  mov      rbx, r15
   14005db26  add      rdi, 2
   14005db2a  movzx    eax, word ptr [rdi]
   14005db2d  test     ax, ax
   14005db30  jne      0x14005db00
   14005db32  test     rbx, rbx
   14005db35  je       0x14005db82
   14005db37  mov      rax, qword ptr [r12 + 0x10]
   14005db3c  sub      rbx, rax
   14005db3f  sar      rbx, 1
   14005db42  test     ebx, ebx
   14005db44  js       0x14005dc76
   14005db4a  sub      r13d, dword ptr [rax - 8]
   14005db4e  mov      eax, dword ptr [rax - 0xc]
   14005db51  sub      eax, ebx
   14005db53  or       eax, r13d
   14005db56  jge      0x14005db64
   14005db58  mov      edx, ebx
   14005db5a  lea      rcx, [r12 + 0x10]
   14005db5f  call     0x140002000
   14005db64  mov      rax, qword ptr [r12 + 0x10]
   14005db69  cmp      ebx, dword ptr [rax - 0xc]
   14005db6c  jg       0x14005dc76
   14005db72  mov      dword ptr [rax - 0x10], ebx
   14005db75  movsxd   rcx, ebx
   14005db78  mov      rax, qword ptr [r12 + 0x10]
   14005db7d  mov      word ptr [rax + rcx*2], r15w
   14005db82  mov      rbx, qword ptr [r12 + 0x10]
   14005db87  movzx    eax, word ptr [rbx]
   14005db8a  test     ax, ax
   14005db8d  je       0x14005dbb0
   14005db8f  nop      
   14005db90  movzx    edx, ax
   14005db93  lea      rcx, [rip + 0x17cdb2]
   14005db9a  call     0x140138e9c
   14005db9f  test     rax, rax
   14005dba2  je       0x14005dbb0
   14005dba4  add      rbx, 2
   14005dba8  movzx    eax, word ptr [rbx]
   14005dbab  test     ax, ax
   14005dbae  jne      0x14005db90
   14005dbb0  mov      rdx, qword ptr [r12 + 0x10]
   14005dbb5  cmp      rbx, rdx
   14005dbb8  je       0x14005dc4d
   14005dbbe  sub      rbx, rdx
   14005dbc1  sar      rbx, 1
   14005dbc4  mov      edx, dword ptr [rdx - 0x10]
   14005dbc7  lea      rcx, [r12 + 0x10]
   14005dbcc  call     0x14005ee30
   14005dbd1  mov      r9, rax
   14005dbd4  movsxd   rax, ebx
   14005dbd7  lea      rdx, [r9 + rax*2]
   14005dbdb  mov      rax, qword ptr [r12 + 0x10]
   14005dbe0  mov      ecx, dword ptr [rax - 0x10]
   14005dbe3  mov      edi, ecx
   14005dbe5  sub      edi, ebx
   14005dbe7  lea      eax, [rdi + 1]
   14005dbea  movsxd   r8, eax
   14005dbed  add      r8, r8
   14005dbf0  je       0x14005dc2f
   14005dbf2  test     r9, r9
   14005dbf5  jne      0x14005dc07
   14005dbf7  call     0x140148560
   14005dbfc  mov      dword ptr [rax], 0x16
   14005dc02  jmp      0x14005dc97
   14005dc07  test     rdx, rdx
   14005dc0a  jne      0x14005dc19
   14005dc0c  call     0x140148560
   14005dc11  mov      dword ptr [rax], 0x16
   14005dc17  jmp      0x14005dc97
   14005dc19  lea      eax, [rcx + 1]
   14005dc1c  movsxd   rcx, eax
   14005dc1f  add      rcx, rcx
   14005dc22  cmp      rcx, r8
   14005dc25  jb       0x14005dc8c
   14005dc27  mov      rcx, r9
   14005dc2a  call     0x1401b64b0
   14005dc2f  test     edi, edi
   14005dc31  js       0x14005dc76
   14005dc33  mov      rax, qword ptr [r12 + 0x10]
   14005dc38  cmp      edi, dword ptr [rax - 0xc]
   14005dc3b  jg       0x14005dc76
   14005dc3d  mov      dword ptr [rax - 0x10], edi
   14005dc40  movsxd   rcx, edi
   14005dc43  mov      rax, qword ptr [r12 + 0x10]
   14005dc48  mov      word ptr [rax + rcx*2], r15w
   14005dc4d  mov      rcx, r12
   14005dc50  call     0x14005f0c0
   14005dc55  nop      
   14005dc56  mov      rax, r12
   14005dc59  mov      rbx, qword ptr [rsp + 0x68]
   14005dc5e  mov      rbp, qword ptr [rsp + 0x70]
   14005dc63  mov      rsi, qword ptr [rsp + 0x78]
   14005dc68  add      rsp, 0x30
   14005dc6c  pop      r15
   14005dc6e  pop      r14
   14005dc70  pop      r13
   14005dc72  pop      r12
   14005dc74  pop      rdi
   14005dc75  ret      
   14005dc76  mov      ecx, 0x80070057
   14005dc7b  call     0x140001b30
   14005dc80  nop      
   14005dc81  mov      ecx, 0x80004005
   14005dc86  call     0x140001b30
   14005dc8b  nop      
   14005dc8c  call     0x140148560
   14005dc91  mov      dword ptr [rax], 0x22
   14005dc97  call     0x140148370
   14005dc9c  call     0x140065c04
   14005dca1  int3     
==== func 5edf0..5ee30 (entry 5edf0)
   14005edf0  push     rbx
   14005edf2  sub      rsp, 0x30
   14005edf6  cmp      dword ptr [rcx + 0x30], 0
   14005edfa  mov      rbx, rdx
   14005edfd  je       0x14005ee22
   14005edff  cmp      dword ptr [rcx + 0x34], 0
   14005ee03  jne      0x14005ee22
   14005ee05  mov      rcx, qword ptr [rcx + 0x20]
   14005ee09  sub      rcx, 0x18
   14005ee0d  call     0x140002e60
   14005ee12  add      rax, 0x18
   14005ee16  mov      qword ptr [rbx], rax
   14005ee19  mov      rax, rbx
   14005ee1c  add      rsp, 0x30
   14005ee20  pop      rbx
   14005ee21  ret      
   14005ee22  call     0x14005f2a0
   14005ee27  mov      rax, rbx
   14005ee2a  add      rsp, 0x30
   14005ee2e  pop      rbx
   14005ee2f  ret      
==== func 5e2b0..5e7c8 (entry 5e2b0)
   14005e2b0  mov      qword ptr [rsp + 0x18], rbx
   14005e2b5  mov      qword ptr [rsp + 0x10], rdx
   14005e2ba  mov      qword ptr [rsp + 8], rcx
   14005e2bf  push     rbp
   14005e2c0  push     rsi
   14005e2c1  push     rdi
   14005e2c2  push     r12
   14005e2c4  push     r13
   14005e2c6  push     r14
   14005e2c8  push     r15
   14005e2ca  sub      rsp, 0x40
   14005e2ce  mov      ebp, r9d
   14005e2d1  mov      r12, r8
   14005e2d4  mov      r13, rcx
   14005e2d7  call     0x1400698f0
   14005e2dc  mov      rcx, rax
   14005e2df  test     rax, rax
   14005e2e2  je       0x14005e791
   14005e2e8  mov      rax, qword ptr [rax]
   14005e2eb  call     qword ptr [rax + 0x18]
   14005e2ee  add      rax, 0x18
   14005e2f2  mov      qword ptr [r13 + 0x10], rax
   14005e2f6  call     0x1400698f0
   14005e2fb  mov      rcx, rax
   14005e2fe  test     rax, rax
   14005e301  je       0x14005e791
   14005e307  mov      rax, qword ptr [rax]
   14005e30a  call     qword ptr [rax + 0x18]
   14005e30d  add      rax, 0x18
   14005e311  mov      qword ptr [r13 + 0x18], rax
   14005e315  call     0x1400698f0
   14005e31a  mov      rcx, rax
   14005e31d  test     rax, rax
   14005e320  je       0x14005e79c
   14005e326  mov      rax, qword ptr [rax]
   14005e329  call     qword ptr [rax + 0x18]
   14005e32c  add      rax, 0x18
   14005e330  mov      qword ptr [r13 + 0x20], rax
   14005e334  call     0x1400698f0
   14005e339  mov      rcx, rax
   14005e33c  test     rax, rax
   14005e33f  je       0x14005e7a7
   14005e345  mov      rax, qword ptr [rax]
   14005e348  call     qword ptr [rax + 0x18]
   14005e34b  add      rax, 0x18
   14005e34f  mov      qword ptr [r13 + 0x28], rax
   14005e353  lea      rdx, [rip + 0x16966a]
   14005e35a  mov      r15, 0xffffffffffffffff
   14005e361  mov      r8, r15
   14005e364  inc      r8
   14005e367  cmp      word ptr [rdx + r8*2], 0
   14005e36d  jne      0x14005e364
   14005e36f  lea      rcx, [r13 + 0x20]
   14005e373  call     0x1400020c0
   14005e378  mov      rdx, r12
   14005e37b  lea      rcx, [r13 + 0x28]
   14005e37f  call     0x140003490
   14005e384  mov      dword ptr [r13 + 0x34], ebp
   14005e388  mov      rax, qword ptr [rsp + 0xa0]
   14005e390  mov      qword ptr [r13], rax
   14005e394  xor      r12d, r12d
   14005e397  mov      dword ptr [r13 + 0x30], r12d
   14005e39b  mov      rdx, qword ptr [rsp + 0x88]
   14005e3a3  lea      rcx, [r13 + 0x10]
   14005e3a7  call     0x140003490
   14005e3ac  mov      rbx, qword ptr [r13 + 0x10]
   14005e3b0  movzx    eax, word ptr [rbx]
   14005e3b3  test     ax, ax
   14005e3b6  je       0x14005e3e0
   14005e3b8  nop      dword ptr [rax + rax]
   14005e3c0  movzx    edx, ax
   14005e3c3  lea      rcx, [rip + 0x17c582]
   14005e3ca  call     0x140138e9c
   14005e3cf  test     rax, rax
   14005e3d2  je       0x14005e3e0
   14005e3d4  add      rbx, 2
   14005e3d8  movzx    eax, word ptr [rbx]
   14005e3db  test     ax, ax
   14005e3de  jne      0x14005e3c0
   14005e3e0  mov      rdx, qword ptr [r13 + 0x10]
   14005e3e4  cmp      rbx, rdx
   14005e3e7  je       0x14005e487
   14005e3ed  sub      rbx, rdx
   14005e3f0  sar      rbx, 1
   14005e3f3  mov      edx, dword ptr [rdx - 0x10]
   14005e3f6  lea      rcx, [r13 + 0x10]
   14005e3fa  call     0x14005ee30
   14005e3ff  mov      r9, rax
   14005e402  movsxd   rax, ebx
   14005e405  lea      rdx, [r9 + rax*2]
   14005e409  mov      rax, qword ptr [r13 + 0x10]
   14005e40d  mov      ecx, dword ptr [rax - 0x10]
   14005e410  mov      edi, ecx
   14005e412  sub      edi, ebx
   14005e414  lea      eax, [rdi + 1]
   14005e417  movsxd   r8, eax
   14005e41a  add      r8, r8
   14005e41d  je       0x14005e463
   14005e41f  test     r9, r9
   14005e422  jne      0x14005e434
   14005e424  call     0x140148560
   14005e429  mov      dword ptr [rax], 0x16
   14005e42f  jmp      0x14005e7bd
   14005e434  test     rdx, rdx
   14005e437  jne      0x14005e449
   14005e439  call     0x140148560
   14005e43e  mov      dword ptr [rax], 0x16
   14005e444  jmp      0x14005e7bd
   14005e449  lea      eax, [rcx + 1]
   14005e44c  movsxd   rcx, eax
   14005e44f  add      rcx, rcx
   14005e452  cmp      rcx, r8
   14005e455  jb       0x14005e7b2
   14005e45b  mov      rcx, r9
   14005e45e  call     0x1401b64b0
   14005e463  test     edi, edi
   14005e465  js       0x14005e786
   14005e46b  mov      rax, qword ptr [r13 + 0x10]
   14005e46f  cmp      edi, dword ptr [rax - 0xc]
   14005e472  jg       0x14005e786
   14005e478  mov      dword ptr [rax - 0x10], edi
   14005e47b  movsxd   rcx, edi
   14005e47e  mov      rax, qword ptr [r13 + 0x10]
   14005e482  mov      word ptr [rax + rcx*2], r12w
   14005e487  mov      edx, 0x5c
   14005e48c  mov      rcx, qword ptr [r13 + 0x10]
   14005e490  call     0x140139120
   14005e495  mov      rbp, rax
   14005e498  test     rax, rax
   14005e49b  jne      0x14005e4a2
   14005e49d  mov      ebp, r15d
   14005e4a0  jmp      0x14005e4a9
   14005e4a2  sub      rbp, qword ptr [r13 + 0x10]
   14005e4a6  sar      rbp, 1
   14005e4a9  mov      r8d, ebp
   14005e4ac  lea      rdx, [rsp + 0x28]
   14005e4b1  lea      rcx, [r13 + 0x10]
   14005e4b5  call     0x140031620
   14005e4ba  nop      
   14005e4bb  mov      rdx, rax
   14005e4be  lea      rcx, [r13 + 0x18]
   14005e4c2  call     0x140003490
   14005e4c7  nop      
   14005e4c8  mov      rdx, qword ptr [rsp + 0x28]
   14005e4cd  add      rdx, -0x18
   14005e4d1  mov      eax, r15d
   14005e4d4  lock xadd dword ptr [rdx + 0x10], eax
   14005e4d9  sub      eax, 1
   14005e4dc  jg       0x14005e4e7
   14005e4de  mov      rcx, qword ptr [rdx]
   14005e4e1  mov      rax, qword ptr [rcx]
   14005e4e4  call     qword ptr [rax + 8]
   14005e4e7  mov      rdi, qword ptr [r13 + 0x18]
   14005e4eb  mov      rbx, r12
   14005e4ee  movzx    eax, word ptr [rdi]
   14005e4f1  mov      r12d, 1
   14005e4f7  test     ax, ax
   14005e4fa  je       0x14005e583
   14005e500  movzx    edx, ax
   14005e503  lea      rcx, [rip + 0x17c442]
   14005e50a  call     0x140138e9c
   14005e50f  test     rax, rax
   14005e512  je       0x14005e523
   14005e514  mov      rax, rdi
   14005e517  test     rbx, rbx
   14005e51a  cmovne   rax, rbx
   14005e51e  mov      rbx, rax
   14005e521  jmp      0x14005e525
   14005e523  xor      ebx, ebx
   14005e525  add      rdi, 2
   14005e529  movzx    eax, word ptr [rdi]
   14005e52c  test     ax, ax
   14005e52f  jne      0x14005e500
   14005e531  test     rbx, rbx
   14005e534  je       0x14005e583
   14005e536  mov      rax, qword ptr [r13 + 0x18]
   14005e53a  sub      rbx, rax
   14005e53d  sar      rbx, 1
   14005e540  test     ebx, ebx
   14005e542  js       0x14005e786
   14005e548  mov      ecx, r12d
   14005e54b  sub      ecx, dword ptr [rax - 8]
   14005e54e  mov      eax, dword ptr [rax - 0xc]
   14005e551  sub      eax, ebx
   14005e553  or       eax, ecx
   14005e555  jge      0x14005e562
   14005e557  mov      edx, ebx
   14005e559  lea      rcx, [r13 + 0x18]
   14005e55d  call     0x140002000
   14005e562  mov      rax, qword ptr [r13 + 0x18]
   14005e566  cmp      ebx, dword ptr [rax - 0xc]
   14005e569  jg       0x14005e786
   14005e56f  mov      dword ptr [rax - 0x10], ebx
   14005e572  movsxd   rcx, ebx
   14005e575  mov      rax, qword ptr [r13 + 0x18]
   14005e579  xor      r14d, r14d
   14005e57c  mov      word ptr [rax + rcx*2], r14w
   14005e581  jmp      0x14005e586
   14005e583  xor      r14d, r14d
   14005e586  mov      rax, qword ptr [r13 + 0x10]
   14005e58a  mov      r9d, dword ptr [rax - 0x10]
   14005e58e  sub      r9d, ebp
   14005e591  mov      r8d, ebp
   14005e594  lea      rdx, [rsp + 0x20]
   14005e599  lea      rcx, [r13 + 0x10]
   14005e59d  call     0x140010850
   14005e5a2  nop      
   14005e5a3  lea      rdx, [rsp + 0x20]
   14005e5a8  lea      rcx, [r13 + 0x10]
   14005e5ac  call     0x140003490
   14005e5b1  nop      
   14005e5b2  mov      rdx, qword ptr [rsp + 0x20]
   14005e5b7  add      rdx, -0x18
   14005e5bb  mov      eax, r15d
   14005e5be  lock xadd dword ptr [rdx + 0x10], eax
   14005e5c3  sub      eax, 1
   14005e5c6  jg       0x14005e5d1
   14005e5c8  mov      rcx, qword ptr [rdx]
   14005e5cb  mov      rax, qword ptr [rcx]
   14005e5ce  call     qword ptr [rax + 8]
   14005e5d1  mov      rdi, qword ptr [r13 + 0x10]
   14005e5d5  mov      rbx, r14
   14005e5d8  movzx    eax, word ptr [rdi]
   14005e5db  test     ax, ax
   14005e5de  je       0x14005e66e
   14005e5e4  nop      dword ptr [rax]
   14005e5e8  nop      dword ptr [rax + rax]
   14005e5f0  movzx    edx, ax
   14005e5f3  lea      rcx, [rip + 0x17c352]
   14005e5fa  call     0x140138e9c
   14005e5ff  test     rax, rax
   14005e602  je       0x14005e613
   14005e604  mov      rax, rdi
   14005e607  test     rbx, rbx
   14005e60a  cmovne   rax, rbx
   14005e60e  mov      rbx, rax
   14005e611  jmp      0x14005e616
   14005e613  mov      rbx, r14
   14005e616  add      rdi, 2
   14005e61a  movzx    eax, word ptr [rdi]
   14005e61d  test     ax, ax
   14005e620  jne      0x14005e5f0
   14005e622  test     rbx, rbx
   14005e625  je       0x14005e66e
   14005e627  mov      rax, qword ptr [r13 + 0x10]
   14005e62b  sub      rbx, rax
   14005e62e  sar      rbx, 1
   14005e631  test     ebx, ebx
   14005e633  js       0x14005e786
   14005e639  sub      r12d, dword ptr [rax - 8]
   14005e63d  mov      eax, dword ptr [rax - 0xc]
   14005e640  sub      eax, ebx
   14005e642  or       eax, r12d
   14005e645  jge      0x14005e652
   14005e647  mov      edx, ebx
   14005e649  lea      rcx, [r13 + 0x10]
   14005e64d  call     0x140002000
   14005e652  mov      rax, qword ptr [r13 + 0x10]
   14005e656  cmp      ebx, dword ptr [rax - 0xc]
   14005e659  jg       0x14005e786
   14005e65f  mov      dword ptr [rax - 0x10], ebx
   14005e662  movsxd   rcx, ebx
   14005e665  mov      rax, qword ptr [r13 + 0x10]
   14005e669  mov      word ptr [rax + rcx*2], r14w
   14005e66e  mov      rbx, qword ptr [r13 + 0x10]
   14005e672  movzx    eax, word ptr [rbx]
   14005e675  test     ax, ax
   14005e678  je       0x14005e6a0
   14005e67a  nop      word ptr [rax + rax]
   14005e680  movzx    edx, ax
   14005e683  lea      rcx, [rip + 0x17c2c2]
   14005e68a  call     0x140138e9c
   14005e68f  test     rax, rax
   14005e692  je       0x14005e6a0
   14005e694  add      rbx, 2
   14005e698  movzx    eax, word ptr [rbx]
   14005e69b  test     ax, ax
   14005e69e  jne      0x14005e680
   14005e6a0  mov      rdx, qword ptr [r13 + 0x10]
   14005e6a4  cmp      rbx, rdx
   14005e6a7  je       0x14005e73f
   14005e6ad  sub      rbx, rdx
   14005e6b0  sar      rbx, 1
   14005e6b3  mov      edx, dword ptr [rdx - 0x10]
   14005e6b6  lea      rcx, [r13 + 0x10]
   14005e6ba  call     0x14005ee30
   14005e6bf  mov      r9, rax
   14005e6c2  movsxd   rax, ebx
   14005e6c5  lea      rdx, [r9 + rax*2]
   14005e6c9  mov      rax, qword ptr [r13 + 0x10]
   14005e6cd  mov      ecx, dword ptr [rax - 0x10]
   14005e6d0  mov      edi, ecx
   14005e6d2  sub      edi, ebx
   14005e6d4  lea      eax, [rdi + 1]
   14005e6d7  movsxd   r8, eax
   14005e6da  add      r8, r8
   14005e6dd  je       0x14005e723
   14005e6df  test     r9, r9
   14005e6e2  jne      0x14005e6f4
   14005e6e4  call     0x140148560
   14005e6e9  mov      dword ptr [rax], 0x16
   14005e6ef  jmp      0x14005e7bd
   14005e6f4  test     rdx, rdx
   14005e6f7  jne      0x14005e709
   14005e6f9  call     0x140148560
   14005e6fe  mov      dword ptr [rax], 0x16
   14005e704  jmp      0x14005e7bd
   14005e709  lea      eax, [rcx + 1]
   14005e70c  movsxd   rcx, eax
   14005e70f  add      rcx, rcx
   14005e712  cmp      rcx, r8
   14005e715  jb       0x14005e7b2
   14005e71b  mov      rcx, r9
   14005e71e  call     0x1401b64b0
   14005e723  test     edi, edi
   14005e725  js       0x14005e786
   14005e727  mov      rax, qword ptr [r13 + 0x10]
   14005e72b  cmp      edi, dword ptr [rax - 0xc]
   14005e72e  jg       0x14005e786
   14005e730  mov      dword ptr [rax - 0x10], edi
   14005e733  movsxd   rcx, edi
   14005e736  mov      rax, qword ptr [r13 + 0x10]
   14005e73a  mov      word ptr [rax + rcx*2], r14w
   14005e73f  lea      rdx, [rsp + 0x30]
   14005e744  mov      rcx, r13
   14005e747  call     0x14005f2a0
   14005e74c  mov      rdx, qword ptr [rsp + 0x30]
   14005e751  add      rdx, -0x18
   14005e755  lock xadd dword ptr [rdx + 0x10], r15d
   14005e75b  sub      r15d, 1
   14005e75f  jg       0x14005e76b
   14005e761  mov      rcx, qword ptr [rdx]
   14005e764  mov      rax, qword ptr [rcx]
   14005e767  call     qword ptr [rax + 8]
   14005e76a  nop      
   14005e76b  mov      rax, r13
   14005e76e  mov      rbx, qword ptr [rsp + 0x90]
   14005e776  add      rsp, 0x40
   14005e77a  pop      r15
   14005e77c  pop      r14
   14005e77e  pop      r13
   14005e780  pop      r12
   14005e782  pop      rdi
   14005e783  pop      rsi
   14005e784  pop      rbp
   14005e785  ret      
   14005e786  mov      ecx, 0x80070057
   14005e78b  call     0x140001b30
   14005e790  nop      
   14005e791  mov      ecx, 0x80004005
   14005e796  call     0x140001b30
   14005e79b  nop      
   14005e79c  mov      ecx, 0x80004005
   14005e7a1  call     0x140001b30
   14005e7a6  nop      
   14005e7a7  mov      ecx, 0x80004005
   14005e7ac  call     0x140001b30
   14005e7b1  nop      
   14005e7b2  call     0x140148560
   14005e7b7  mov      dword ptr [rax], 0x22
   14005e7bd  call     0x140148370
   14005e7c2  call     0x140065c04
   14005e7c7  int3     
==== func 5ecb0..5ecd5 (entry 5ecb0)
   14005ecb0  push     rbx
   14005ecb2  sub      rsp, 0x20
   14005ecb6  mov      rbx, rcx
   14005ecb9  cmp      edx, dword ptr [rcx + 0x20]
   14005ecbc  jne      0x14005ecc4
   14005ecbe  cmp      dword ptr [rcx + 0x2c], 0
   14005ecc2  je       0x14005eccc
   14005ecc4  mov      dword ptr [rcx + 0x20], edx
   14005ecc7  call     0x14005f4d0
   14005eccc  mov      rax, rbx
   14005eccf  add      rsp, 0x20
   14005ecd3  pop      rbx
   14005ecd4  ret      