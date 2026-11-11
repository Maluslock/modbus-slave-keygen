   140041880  mov      qword ptr [rsp + 0x10], rbx
   140041885  mov      qword ptr [rsp + 0x18], rsi
   14004188a  push     rbp
   14004188b  push     rdi
   14004188c  push     r14
   14004188e  lea      rbp, [rsp - 0x1c0]
   140041896  sub      rsp, 0x2c0
   14004189d  mov      rax, qword ptr [rip + 0x20f19c]
   1400418a4  xor      rax, rsp
   1400418a7  mov      qword ptr [rbp + 0x1b0], rax
   1400418ae  mov      rbx, rcx
   1400418b1  mov      dword ptr [rsp + 0x38], 8
   1400418b9  mov      dword ptr [rsp + 0x3c], 0xff
   1400418c1  lea      rcx, [rsp + 0x38]
   1400418c6  call     qword ptr [rip + 0x1847b4]
   1400418cc  mov      rcx, rbx
   1400418cf  call     0x1400a29e0
   1400418d4  lea      rdx, [rip + 0x189e35]
   1400418db  mov      ecx, 4
   1400418e0  call     0x140175390
   1400418e5  call     0x1400964e0
   1400418ea  test     eax, eax
   1400418ec  jne      0x140041903
   1400418ee  xor      edx, edx
   1400418f0  lea      ecx, [rax + 0x64]
   1400418f3  mov      r8d, 0xffffffff
   1400418f9  call     0x140081014
   1400418fe  jmp      0x140041ba3
   140041903  lea      rdx, [rip + 0x18ff06]
   14004190a  mov      rcx, rbx
   14004190d  call     0x1400a5958
   140041912  mov      edx, 6
   140041917  mov      rcx, rbx
   14004191a  call     0x1400a2b64
   14004191f  mov      ecx, 0x140
   140041924  call     0x140078c24
   140041929  mov      qword ptr [rsp + 0x30], rax
   14004192e  xor      esi, esi
   140041930  test     rax, rax
   140041933  je       0x140041961
   140041935  lea      rcx, [rip + 0x19367c]
   14004193c  mov      qword ptr [rsp + 0x20], rcx
   140041941  lea      r9, [rip + 0x18aaf0]
   140041948  lea      r8, [rip + 0x1915a1]
   14004194f  mov      edx, 0x81
   140041954  mov      rcx, rax
   140041957  call     0x1400a6798
   14004195c  mov      rdi, rax
   14004195f  jmp      0x140041964
   140041961  mov      rdi, rsi
   140041964  test     rdi, rdi
   140041967  je       0x140041ba3
   14004196d  mov      rdx, rdi
   140041970  mov      rcx, rbx
   140041973  call     0x1400a4184
   140041978  lea      rcx, [rbx + 0x228]
   14004197f  mov      dword ptr [rsp + 0x20], esi
   140041983  xor      r9d, r9d
   140041986  mov      r8, rdi
   140041989  lea      rdx, [rip + 0x18f8b0]
   140041990  call     0x1400a6e2c
   140041995  call     0x14007c238
   14004199a  mov      ecx, 0x4b8
   14004199f  call     0x140078c24
   1400419a4  test     rax, rax
   1400419a7  je       0x140041ba3
   1400419ad  mov      rcx, rax
   1400419b0  call     0x14003d030
   1400419b5  mov      r14, rax
   1400419b8  test     rax, rax
   1400419bb  je       0x140041ba3
   1400419c1  mov      r10, qword ptr [rax]
   1400419c4  mov      qword ptr [rsp + 0x20], rsi
   1400419c9  xor      r9d, r9d
   1400419cc  mov      edx, 0x80
   1400419d1  mov      r8d, 0xcf8000
   1400419d7  mov      rcx, rax
   1400419da  call     qword ptr [r10 + 0x2d0]
   1400419e1  test     eax, eax
   1400419e3  je       0x140041b95
   1400419e9  mov      qword ptr [rbx + 0x40], r14
   1400419ed  mov      edi, 1
   1400419f2  mov      edx, edi
   1400419f4  mov      rcx, qword ptr [r14 + 0x40]
   1400419f8  call     qword ptr [rip + 0x18527a]
   1400419fe  mov      rcx, rbx
   140041a01  call     0x1400a4504
   140041a06  lea      rcx, [rsp + 0x50]
   140041a0b  call     0x1400a1bf8
   140041a10  nop      
   140041a11  lea      rdx, [rsp + 0x50]
   140041a16  mov      rcx, rbx
   140041a19  call     0x1400a2cec
   140041a1e  call     0x140058290
   140041a23  lea      r9, [rip + 0x2c26]
   140041a2a  xor      edx, edx
   140041a2c  xor      ecx, ecx
   140041a2e  mov      r8d, 0x3e8
   140041a34  call     qword ptr [rip + 0x1857ce]
   140041a3a  cmp      dword ptr [rsp + 0x5c], 0
   140041a3f  jne      0x140041b7d
   140041a45  cmp      dword ptr [rsp + 0x60], 0
   140041a4a  jne      0x140041b7d
   140041a50  lea      rdx, [rbx + 0x190]
   140041a57  mov      rcx, rbx
   140041a5a  call     0x140043de0
   140041a5f  mov      rcx, qword ptr [rsp + 0x70]
   140041a64  cmp      dword ptr [rcx - 0x10], 0
   140041a68  jl       0x140041b52
   140041a6e  lea      rdx, [rip + 0x18fdbb]
   140041a75  call     0x140138f14
   140041a7a  test     rax, rax
   140041a7d  je       0x140041b52
   140041a83  sub      rax, qword ptr [rsp + 0x70]
   140041a88  sar      rax, 1
   140041a8b  cmp      eax, -1
   140041a8e  je       0x140041b52
   140041a94  mov      word ptr [rbp - 0x60], si
   140041a98  xor      edx, edx
   140041a9a  mov      r8d, 0x206
   140041aa0  lea      rcx, [rbp - 0x5e]
   140041aa4  call     0x1401b6b50
   140041aa9  xor      r9d, r9d
   140041aac  lea      r8, [rbp - 0x60]
   140041ab0  mov      edx, 0x104
   140041ab5  mov      rcx, qword ptr [rsp + 0x70]
   140041aba  call     qword ptr [rip + 0x184e78]
   140041ac0  test     eax, eax
   140041ac2  je       0x140041b85
   140041ac8  lea      rax, [rsp + 0x30]
   140041acd  mov      qword ptr [rsp + 0x40], rax
   140041ad2  call     0x1400698f0
   140041ad7  mov      rcx, rax
   140041ada  test     rax, rax
   140041add  je       0x140041bcc
   140041ae3  mov      rax, qword ptr [rax]
   140041ae6  call     qword ptr [rax + 0x18]
   140041ae9  add      rax, 0x18
   140041aed  mov      qword ptr [rsp + 0x30], rax
   140041af2  lea      rax, [rbp - 0x60]
   140041af6  cmp      rax, 0x10000
   140041afc  lea      rax, [rbp - 0x60]
   140041b00  jae      0x140041b11
   140041b02  movzx    edx, ax
   140041b05  lea      rcx, [rsp + 0x30]
   140041b0a  call     0x140001ea0
   140041b0f  jmp      0x140041b3a
   140041b11  mov      r8, 0xffffffffffffffff
   140041b18  nop      dword ptr [rax + rax]
   140041b20  inc      r8
   140041b23  cmp      word ptr [rax + r8*2], 0
   140041b29  jne      0x140041b20
   140041b2b  lea      rdx, [rbp - 0x60]
   140041b2f  lea      rcx, [rsp + 0x30]
   140041b34  call     0x1400020c0
   140041b39  nop      
   140041b3a  mov      r8d, edi
   140041b3d  lea      rdx, [rsp + 0x30]
   140041b42  mov      rcx, rbx
   140041b45  call     0x140042e10
   140041b4a  mov      dword ptr [rip + 0x21522c], edi
   140041b50  jmp      0x140041b63
   140041b52  lea      rdx, [rsp + 0x50]
   140041b57  mov      rcx, rbx
   140041b5a  call     0x1400a46f0
   140041b5f  test     eax, eax
   140041b61  je       0x140041b85
   140041b63  mov      edx, dword ptr [rbx + 0x98]
   140041b69  mov      rcx, r14
   140041b6c  call     0x1400777c8
   140041b71  mov      rcx, qword ptr [r14 + 0x40]
   140041b75  call     qword ptr [rip + 0x185605]
   140041b7b  jmp      0x140041b87
   140041b7d  mov      dword ptr [rbx + 0x1f4], edi
   140041b83  mov      esi, edi
   140041b85  mov      edi, esi
   140041b87  lea      rcx, [rsp + 0x50]
   140041b8c  call     0x1400a1ef0
   140041b91  mov      eax, edi
   140041b93  jmp      0x140041ba5
   140041b95  mov      rax, qword ptr [r14]
   140041b98  mov      edx, 1
   140041b9d  mov      rcx, r14
   140041ba0  call     qword ptr [rax + 8]
   140041ba3  xor      eax, eax
   140041ba5  mov      rcx, qword ptr [rbp + 0x1b0]
   140041bac  xor      rcx, rsp
   140041baf  call     0x1400ff700
   140041bb4  lea      r11, [rsp + 0x2c0]
   140041bbc  mov      rbx, qword ptr [r11 + 0x28]
   140041bc0  mov      rsi, qword ptr [r11 + 0x30]
   140041bc4  mov      rsp, r11
   140041bc7  pop      r14
   140041bc9  pop      rdi
   140041bca  pop      rbp
   140041bcb  ret      
   140041bcc  mov      ecx, 0x80004005
   140041bd1  call     0x140001b30
   140041bd6  int3     
