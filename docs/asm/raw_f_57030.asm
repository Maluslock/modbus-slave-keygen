   140057030  mov      qword ptr [rsp + 8], rcx
   140057035  push     rbp
   140057036  push     rbx
   140057037  push     rsi
   140057038  push     rdi
   140057039  push     r14
   14005703b  lea      rbp, [rsp - 0x37]
   140057040  sub      rsp, 0x90
   140057047  mov      r14, rcx
   14005704a  mov      r8, qword ptr [rcx]
   14005704d  mov      r9d, dword ptr [r8 - 0x10]
   140057051  cmp      r9d, 0x258
   140057058  jl       0x14005706a
   14005705a  lea      rdx, [r8 - 0x18]
   14005705e  mov      rdi, 0xffffffffffffffff
   140057065  jmp      0x140057549
   14005706a  lea      r10, [rip + 0x17f1e7]
   140057071  xor      ecx, ecx
   140057073  nop      dword ptr [rax]
   140057077  nop      word ptr [rax + rax]
   140057080  movzx    eax, word ptr [r8 + rcx*2]
   140057085  cmp      ax, word ptr [r10 + rcx*2]
   14005708a  jne      0x1400572af
   140057090  movzx    eax, word ptr [r8 + rcx*2 + 2]
   140057096  cmp      ax, word ptr [r10 + rcx*2 + 2]
   14005709c  jne      0x1400572af
   1400570a2  add      rcx, 2
   1400570a6  cmp      rcx, 0xa
   1400570aa  jne      0x140057080
   1400570ac  test     dl, dl
   1400570ae  je       0x1400570b7
   1400570b0  mov      cl, 1
   1400570b2  call     0x140057d00
   1400570b7  cmp      dword ptr [rip + 0x2003d6], 0xa
   1400570be  jge      0x140057282
   1400570c4  xor      r8d, r8d
   1400570c7  lea      edx, [r8 + 0x30]
   1400570cb  lea      rcx, [rip + 0x17f19e]
   1400570d2  call     0x1400810d0
   1400570d7  call     0x1400698f0
   1400570dc  mov      rcx, rax
   1400570df  test     rax, rax
   1400570e2  je       0x140057577
   1400570e8  mov      rax, qword ptr [rax]
   1400570eb  call     qword ptr [rax + 0x18]
   1400570ee  add      rax, 0x18
   1400570f2  mov      qword ptr [rbp + 0x7f], rax
   1400570f6  lea      rbx, [rip + 0x1708c7]
   1400570fd  mov      rdi, 0xffffffffffffffff
   140057104  cmp      rbx, 0x10000
   14005710b  jae      0x14005711b
   14005710d  movzx    edx, bx
   140057110  lea      rcx, [rbp + 0x7f]
   140057114  call     0x140001ea0
   140057119  jmp      0x140057138
   14005711b  mov      r8, rdi
   14005711e  nop      
   140057120  inc      r8
   140057123  cmp      word ptr [rbx + r8*2], 0
   140057129  jne      0x140057120
   14005712b  mov      rdx, rbx
   14005712e  lea      rcx, [rbp + 0x7f]
   140057132  call     0x1400020c0
   140057137  nop      
   140057138  call     0x1400698f0
   14005713d  mov      rcx, rax
   140057140  test     rax, rax
   140057143  je       0x140057582
   140057149  mov      rax, qword ptr [rax]
   14005714c  call     qword ptr [rax + 0x18]
   14005714f  add      rax, 0x18
   140057153  mov      qword ptr [rbp + 0x77], rax
   140057157  lea      rdx, [rip + 0x17f042]
   14005715e  cmp      rdx, 0x10000
   140057165  jae      0x140057175
   140057167  movzx    edx, dx
   14005716a  lea      rcx, [rbp + 0x77]
   14005716e  call     0x140001ea0
   140057173  jmp      0x140057195
   140057175  mov      r8, rdi
   140057178  nop      dword ptr [rax + rax]
   140057180  inc      r8
   140057183  cmp      word ptr [rdx + r8*2], 0
   140057189  jne      0x140057180
   14005718b  lea      rcx, [rbp + 0x77]
   14005718f  call     0x1400020c0
   140057194  nop      
   140057195  mov      qword ptr [rsp + 0x20], 0xffffffff80000001
   14005719e  xor      r9d, r9d
   1400571a1  lea      r8, [rbp + 0x7f]
   1400571a5  lea      rdx, [rbp + 0x77]
   1400571a9  lea      rcx, [rbp - 1]
   1400571ad  call     0x14005e2b0
   1400571b2  nop      
   1400571b3  mov      rdx, qword ptr [rbp + 0x77]
   1400571b7  add      rdx, -0x18
   1400571bb  mov      eax, edi
   1400571bd  lock xadd dword ptr [rdx + 0x10], eax
   1400571c2  sub      eax, 1
   1400571c5  jg       0x1400571d1
   1400571c7  mov      rcx, qword ptr [rdx]
   1400571ca  mov      rax, qword ptr [rcx]
   1400571cd  call     qword ptr [rax + 8]
   1400571d0  nop      
   1400571d1  mov      rdx, qword ptr [rbp + 0x7f]
   1400571d5  add      rdx, -0x18
   1400571d9  mov      eax, edi
   1400571db  lock xadd dword ptr [rdx + 0x10], eax
   1400571e0  sub      eax, 1
   1400571e3  jg       0x1400571ee
   1400571e5  mov      rcx, qword ptr [rdx]
   1400571e8  mov      rax, qword ptr [rcx]
   1400571eb  call     qword ptr [rax + 8]
   1400571ee  call     0x1400698f0
   1400571f3  mov      rcx, rax
   1400571f6  test     rax, rax
   1400571f9  je       0x14005758d
   1400571ff  mov      rax, qword ptr [rax]
   140057202  call     qword ptr [rax + 0x18]
   140057205  add      rax, 0x18
   140057209  mov      qword ptr [rbp - 0x29], rax
   14005720d  cmp      rbx, 0x10000
   140057214  jae      0x140057224
   140057216  movzx    edx, bx
   140057219  lea      rcx, [rbp - 0x29]
   14005721d  call     0x140001ea0
   140057222  jmp      0x140057248
   140057224  mov      r8, rdi
   140057227  nop      word ptr [rax + rax]
   140057230  inc      r8
   140057233  cmp      word ptr [rbx + r8*2], 0
   140057239  jne      0x140057230
   14005723b  mov      rdx, rbx
   14005723e  lea      rcx, [rbp - 0x29]
   140057242  call     0x1400020c0
   140057247  nop      
   140057248  lea      rdx, [rbp - 0x29]
   14005724c  lea      rcx, [rbp - 1]
   140057250  call     0x14005ed20
   140057255  nop      
   140057256  mov      rdx, qword ptr [rbp - 0x29]
   14005725a  add      rdx, -0x18
   14005725e  mov      eax, edi
   140057260  lock xadd dword ptr [rdx + 0x10], eax
   140057265  sub      eax, 1
   140057268  jg       0x140057274
   14005726a  mov      rcx, qword ptr [rdx]
   14005726d  mov      rax, qword ptr [rcx]
   140057270  call     qword ptr [rax + 8]
   140057273  nop      
   140057274  lea      rcx, [rbp - 1]
   140057278  call     0x14005ebd0
   14005727d  jmp      0x140057542
   140057282  lea      rdx, [rip + 0x17f037]
   140057289  mov      rdi, 0xffffffffffffffff
   140057290  mov      r8, rdi
   140057293  inc      r8
   140057296  cmp      word ptr [rdx + r8*2], 0
   14005729c  jne      0x140057293
   14005729e  lea      rcx, [rip + 0x2001f3]
   1400572a5  call     0x1400020c0
   1400572aa  jmp      0x140057475
   1400572af  cmp      r9d, 0x1f
   1400572b3  jge      0x1400572c5
   1400572b5  lea      rdx, [r8 - 0x18]
   1400572b9  mov      rdi, 0xffffffffffffffff
   1400572c0  jmp      0x140057549
   1400572c5  call     0x1400698f0
   1400572ca  mov      rcx, rax
   1400572cd  test     rax, rax
   1400572d0  je       0x14005756c
   1400572d6  mov      rax, qword ptr [rax]
   1400572d9  call     qword ptr [rax + 0x18]
   1400572dc  mov      rsi, rax
   1400572df  lea      rbx, [rax + 0x18]
   1400572e3  mov      qword ptr [rbp - 0x19], rbx
   1400572e7  mov      rcx, qword ptr [r14]
   1400572ea  sub      rcx, 0x18
   1400572ee  call     0x140002e60
   1400572f3  add      rax, 0x18
   1400572f7  mov      qword ptr [rbp - 0x21], rax
   1400572fb  lea      rdx, [rbp - 0x21]
   1400572ff  mov      ecx, 0x1c59d0d
   140057304  call     0x140058570
   140057309  test     al, al
   14005730b  je       0x1400574a2
   140057311  mov      rcx, qword ptr [rip + 0x200180]
   140057318  mov      rdi, 0xffffffffffffffff
   14005731f  cmp      dword ptr [rcx - 0x10], 0
   140057323  jge      0x140057329
   140057325  mov      esi, edi
   140057327  jmp      0x14005734e
   140057329  lea      rdx, [rip + 0x17eff8]
   140057330  call     0x140138f14
   140057335  mov      rsi, rax
   140057338  mov      rcx, qword ptr [rip + 0x200159]
   14005733f  test     rax, rax
   140057342  jne      0x140057348
   140057344  mov      esi, edi
   140057346  jmp      0x14005734e
   140057348  sub      rsi, rcx
   14005734b  sar      rsi, 1
   14005734e  cmp      dword ptr [rcx - 0x10], 0
   140057352  jge      0x140057358
   140057354  mov      eax, edi
   140057356  jmp      0x14005737a
   140057358  lea      rdx, [rip + 0x17efd9]
   14005735f  call     0x140138f14
   140057364  mov      rcx, qword ptr [rip + 0x20012d]
   14005736b  test     rax, rax
   14005736e  jne      0x140057374
   140057370  mov      eax, edi
   140057372  jmp      0x14005737a
   140057374  sub      rax, rcx
   140057377  sar      rax, 1
   14005737a  test     esi, esi
   14005737c  jns      0x140057386
   14005737e  test     eax, eax
   140057380  js       0x140057414
   140057386  cmp      dword ptr [rcx - 0x10], 0
   14005738a  jge      0x140057390
   14005738c  mov      eax, edi
   14005738e  jmp      0x1400573af
   140057390  lea      rdx, [rip + 0x17efb1]
   140057397  call     0x140138f14
   14005739c  test     rax, rax
   14005739f  jne      0x1400573a5
   1400573a1  mov      eax, edi
   1400573a3  jmp      0x1400573af
   1400573a5  sub      rax, qword ptr [rip + 0x2000ec]
   1400573ac  sar      rax, 1
   1400573af  lea      r8d, [rax + 3]
   1400573b3  mov      r9d, 2
   1400573b9  lea      rdx, [rbp - 9]
   1400573bd  lea      rcx, [rip + 0x2000d4]
   1400573c4  call     0x140010850
   1400573c9  nop      
   1400573ca  mov      rdx, rax
   1400573cd  lea      rcx, [rbp - 0x19]
   1400573d1  call     0x140003490
   1400573d6  nop      
   1400573d7  mov      rdx, qword ptr [rbp - 9]
   1400573db  add      rdx, -0x18
   1400573df  mov      eax, edi
   1400573e1  lock xadd dword ptr [rdx + 0x10], eax
   1400573e6  sub      eax, 1
   1400573e9  jg       0x1400573f4
   1400573eb  mov      rcx, qword ptr [rdx]
   1400573ee  mov      rax, qword ptr [rcx]
   1400573f1  call     qword ptr [rax + 8]
   1400573f4  mov      rbx, qword ptr [rbp - 0x19]
   1400573f8  cmp      dword ptr [rbx - 0x10], 2
   1400573fc  jne      0x14005745b
   1400573fe  mov      rcx, rbx
   140057401  call     0x14017445c
   140057406  test     eax, eax
   140057408  je       0x14005745b
   14005740a  cmp      eax, 0xe
   14005740d  jl       0x14005745b
   14005740f  cmp      eax, 0x17
   140057412  jge      0x14005745b
   140057414  lea      rdx, [rbx - 0x18]
   140057418  mov      eax, edi
   14005741a  lock xadd dword ptr [rdx + 0x10], eax
   14005741f  sub      eax, 1
   140057422  jg       0x14005742e
   140057424  mov      rcx, qword ptr [rdx]
   140057427  mov      rax, qword ptr [rcx]
   14005742a  call     qword ptr [rax + 8]
   14005742d  nop      
   14005742e  mov      rdx, qword ptr [r14]
   140057431  sub      rdx, 0x18
   140057435  lock xadd dword ptr [rdx + 0x10], edi
   14005743a  sub      edi, 1
   14005743d  jg       0x140057448
   14005743f  mov      rcx, qword ptr [rdx]
   140057442  mov      rax, qword ptr [rcx]
   140057445  call     qword ptr [rax + 8]
   140057448  mov      eax, 5
   14005744d  add      rsp, 0x90
   140057454  pop      r14
   140057456  pop      rdi
   140057457  pop      rsi
   140057458  pop      rbx
   140057459  pop      rbp
   14005745a  ret      
   14005745b  lea      rdx, [rbx - 0x18]
   14005745f  mov      eax, edi
   140057461  lock xadd dword ptr [rdx + 0x10], eax
   140057466  sub      eax, 1
   140057469  jg       0x140057475
   14005746b  mov      rcx, qword ptr [rdx]
   14005746e  mov      rax, qword ptr [rcx]
   140057471  call     qword ptr [rax + 8]
   140057474  nop      
   140057475  mov      rdx, qword ptr [r14]
   140057478  sub      rdx, 0x18
   14005747c  lock xadd dword ptr [rdx + 0x10], edi
   140057481  sub      edi, 1
   140057484  jg       0x14005748f
   140057486  mov      rcx, qword ptr [rdx]
   140057489  mov      rax, qword ptr [rcx]
   14005748c  call     qword ptr [rax + 8]
   14005748f  mov      eax, 6
   140057494  add      rsp, 0x90
   14005749b  pop      r14
   14005749d  pop      rdi
   14005749e  pop      rsi
   14005749f  pop      rbx
   1400574a0  pop      rbp
   1400574a1  ret      
   1400574a2  mov      rcx, qword ptr [r14]
   1400574a5  sub      rcx, 0x18
   1400574a9  call     0x140002e60
   1400574ae  add      rax, 0x18
   1400574b2  mov      qword ptr [rbp - 0x11], rax
   1400574b6  lea      rcx, [rbp - 0x11]
   1400574ba  call     0x140058fc0
   1400574bf  test     al, al
   1400574c1  je       0x140057522
   1400574c3  xor      r8d, r8d
   1400574c6  xor      edx, edx
   1400574c8  lea      rcx, [rip + 0x17eb11]
   1400574cf  call     0x1400810d0
   1400574d4  nop      
   1400574d5  mov      rdi, 0xffffffffffffffff
   1400574dc  mov      eax, edi
   1400574de  lock xadd dword ptr [rsi + 0x10], eax
   1400574e3  sub      eax, 1
   1400574e6  jg       0x1400574f5
   1400574e8  mov      rcx, qword ptr [rsi]
   1400574eb  mov      rax, qword ptr [rcx]
   1400574ee  mov      rdx, rsi
   1400574f1  call     qword ptr [rax + 8]
   1400574f4  nop      
   1400574f5  mov      rdx, qword ptr [r14]
   1400574f8  sub      rdx, 0x18
   1400574fc  lock xadd dword ptr [rdx + 0x10], edi
   140057501  sub      edi, 1
   140057504  jg       0x14005750f
   140057506  mov      rcx, qword ptr [rdx]
   140057509  mov      rax, qword ptr [rcx]
   14005750c  call     qword ptr [rax + 8]
   14005750f  mov      eax, 4
   140057514  add      rsp, 0x90
   14005751b  pop      r14
   14005751d  pop      rdi
   14005751e  pop      rsi
   14005751f  pop      rbx
   140057520  pop      rbp
   140057521  ret      
   140057522  mov      rdi, 0xffffffffffffffff
   140057529  mov      eax, edi
   14005752b  lock xadd dword ptr [rsi + 0x10], eax
   140057530  sub      eax, 1
   140057533  jg       0x140057542
   140057535  mov      rcx, qword ptr [rsi]
   140057538  mov      rax, qword ptr [rcx]
   14005753b  mov      rdx, rsi
   14005753e  call     qword ptr [rax + 8]
   140057541  nop      
   140057542  mov      rdx, qword ptr [r14]
   140057545  sub      rdx, 0x18
   140057549  lock xadd dword ptr [rdx + 0x10], edi
   14005754e  sub      edi, 1
   140057551  jg       0x14005755c
   140057553  mov      rcx, qword ptr [rdx]
   140057556  mov      rax, qword ptr [rcx]
   140057559  call     qword ptr [rax + 8]
   14005755c  xor      eax, eax
   14005755e  add      rsp, 0x90
   140057565  pop      r14
   140057567  pop      rdi
   140057568  pop      rsi
   140057569  pop      rbx
   14005756a  pop      rbp
   14005756b  ret      
   14005756c  mov      ecx, 0x80004005
   140057571  call     0x140001b30
   140057576  int3     
   140057577  mov      ecx, 0x80004005
   14005757c  call     0x140001b30
   140057581  nop      
   140057582  mov      ecx, 0x80004005
   140057587  call     0x140001b30
   14005758c  nop      
   14005758d  mov      ecx, 0x80004005
   140057592  call     0x140001b30
   140057597  int3     
