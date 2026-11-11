pdata funcs: 9090
   1400576f0  push     rbp
   1400576f2  push     rbx
   1400576f3  push     rsi
   1400576f4  push     rdi
   1400576f5  push     r14
   1400576f7  lea      rbp, [rsp - 0x300]
   1400576ff  sub      rsp, 0x400
   140057706  mov      rsi, rcx
   140057709  call     0x1400698f0
   14005770e  mov      rcx, rax
   140057711  test     rax, rax
   140057714  je       0x1400579f4
   14005771a  mov      rax, qword ptr [rax]
   14005771d  call     qword ptr [rax + 0x18]
   140057720  lea      rbx, [rax + 0x18]
   140057724  mov      qword ptr [rsp + 0x30], rbx
   140057729  lea      rcx, [rsp + 0x70]
   14005772e  call     0x140001880
   140057733  nop      
   140057734  mov      edx, 1
   140057739  mov      rcx, rsi
   14005773c  call     0x140073c38
   140057741  lea      rcx, [rsi + 0x218]
   140057748  call     0x140057b40
   14005774d  mov      rcx, qword ptr [rsi + 0x218]
   140057754  sub      rcx, 0x18
   140057758  call     0x140002e60
   14005775d  add      rax, 0x18
   140057761  mov      qword ptr [rbp + 0x348], rax
   140057768  mov      dl, 1
   14005776a  lea      rcx, [rbp + 0x348]
   140057771  call     0x140057030
   140057776  mov      rdi, 0xffffffffffffffff
   14005777d  test     eax, eax
   14005777f  je       0x1400577d4
   140057781  sub      eax, 4
   140057784  je       0x1400577b6
   140057786  sub      eax, 1
   140057789  je       0x140057798
   14005778b  cmp      eax, 1
   14005778e  jne      0x1400577e7
   140057790  mov      byte ptr [rip + 0x1ffcfa], al
   140057796  jmp      0x1400577f4
   140057798  mov      r9d, 0x40
   14005779e  lea      r8, [rip + 0x17e813]
   1400577a5  lea      rdx, [rip + 0x17e8d4]
   1400577ac  mov      rcx, rsi
   1400577af  call     0x140070838
   1400577b4  jmp      0x1400577e7
   1400577b6  mov      r9d, 0x40
   1400577bc  lea      r8, [rip + 0x17e7f5]
   1400577c3  lea      rdx, [rip + 0x17e816]
   1400577ca  mov      rcx, rsi
   1400577cd  call     0x140070838
   1400577d2  jmp      0x1400577e7
   1400577d4  xor      r8d, r8d
   1400577d7  lea      edx, [r8 + 0x30]
   1400577db  lea      rcx, [rip + 0x17e79e]
   1400577e2  call     0x1400810d0
   1400577e7  cmp      byte ptr [rip + 0x1ffca2], 0
   1400577ee  je       0x1400579b0
   1400577f4  call     0x1400698f0
   1400577f9  mov      rcx, rax
   1400577fc  test     rax, rax
   1400577ff  je       0x1400579ff
   140057805  mov      rax, qword ptr [rax]
   140057808  call     qword ptr [rax + 0x18]
   14005780b  add      rax, 0x18
   14005780f  mov      qword ptr [rbp + 0x340], rax
   140057816  lea      rdx, [rip + 0x1701a7]
   14005781d  cmp      rdx, 0x10000
   140057824  jae      0x140057837
   140057826  movzx    edx, dx
   140057829  lea      rcx, [rbp + 0x340]
   140057830  call     0x140001ea0
   140057835  jmp      0x140057858
   140057837  mov      r8, rdi
   14005783a  nop      word ptr [rax + rax]
   140057840  inc      r8
   140057843  cmp      word ptr [rdx + r8*2], 0
   140057849  jne      0x140057840
   14005784b  lea      rcx, [rbp + 0x340]
   140057852  call     0x1400020c0
   140057857  nop      
   140057858  call     0x1400698f0
   14005785d  mov      rcx, rax
   140057860  test     rax, rax
   140057863  je       0x1400579e9
   140057869  mov      rax, qword ptr [rax]
   14005786c  call     qword ptr [rax + 0x18]
   14005786f  add      rax, 0x18
   140057873  mov      qword ptr [rbp + 0x338], rax
   14005787a  lea      rdx, [rip + 0x17e91f]
   140057881  cmp      rdx, 0x10000
   140057888  jae      0x14005789b
   14005788a  movzx    edx, dx
   14005788d  lea      rcx, [rbp + 0x338]
   140057894  call     0x140001ea0
   140057899  jmp      0x1400578b8
   14005789b  mov      r8, rdi
   14005789e  nop      
   1400578a0  inc      r8
   1400578a3  cmp      word ptr [rdx + r8*2], 0
   1400578a9  jne      0x1400578a0
   1400578ab  lea      rcx, [rbp + 0x338]
   1400578b2  call     0x1400020c0
   1400578b7  nop      
   1400578b8  mov      qword ptr [rsp + 0x20], 0xffffffff80000001
   1400578c1  xor      r9d, r9d
   1400578c4  lea      r8, [rbp + 0x340]
   1400578cb  lea      rdx, [rbp + 0x338]
   1400578d2  lea      rcx, [rsp + 0x38]
   1400578d7  call     0x14005e2b0
   1400578dc  nop      
   1400578dd  mov      rdx, qword ptr [rbp + 0x338]
   1400578e4  add      rdx, -0x18
   1400578e8  mov      eax, edi
   1400578ea  lock xadd dword ptr [rdx + 0x10], eax
   1400578ef  sub      eax, 1
   1400578f2  jg       0x1400578fe
   1400578f4  mov      rcx, qword ptr [rdx]
   1400578f7  mov      rax, qword ptr [rcx]
   1400578fa  call     qword ptr [rax + 8]
   1400578fd  nop      
   1400578fe  mov      rdx, qword ptr [rbp + 0x340]
   140057905  add      rdx, -0x18
   140057909  mov      eax, edi
   14005790b  lock xadd dword ptr [rdx + 0x10], eax
   140057910  sub      eax, 1
   140057913  jg       0x14005791e
   140057915  mov      rcx, qword ptr [rdx]
   140057918  mov      rax, qword ptr [rcx]
   14005791b  call     qword ptr [rax + 8]
   14005791e  lea      rdx, [rsi + 0x218]
   140057925  lea      rcx, [rsp + 0x38]
   14005792a  call     0x14005ed20
   14005792f  mov      rdx, qword ptr [rip + 0x1ffb62]
   140057936  lea      rcx, [rdx - 0x18]
   14005793a  mov      rbx, qword ptr [rbp + 0xa0]
   140057941  add      rbx, -0x18
   140057945  cmp      rcx, rbx
   140057948  je       0x140057996
   14005794a  cmp      dword ptr [rbx + 0x10], 0
   14005794e  jl       0x140057986
   140057950  mov      rax, qword ptr [rbx]
   140057953  cmp      qword ptr [rcx], rax
   140057956  jne      0x140057986
   140057958  call     0x140002e60
   14005795d  mov      r14, rax
   140057960  mov      ecx, edi
   140057962  lock xadd dword ptr [rbx + 0x10], ecx
   140057967  sub      ecx, 1
   14005796a  jg       0x140057979
   14005796c  mov      rcx, qword ptr [rbx]
   14005796f  mov      r8, qword ptr [rcx]
   140057972  mov      rdx, rbx
   140057975  call     qword ptr [r8 + 8]
   140057979  lea      rax, [r14 + 0x18]
   14005797d  mov      qword ptr [rbp + 0xa0], rax
   140057984  jmp      0x140057996
   140057986  mov      r8d, dword ptr [rdx - 0x10]
   14005798a  lea      rcx, [rbp + 0xa0]
   140057991  call     0x1400020c0
   140057996  lea      rcx, [rsp + 0x70]
   14005799b  call     0x1400781b4
   1400579a0  nop      
   1400579a1  lea      rcx, [rsp + 0x38]
   1400579a6  call     0x14005ebd0
   1400579ab  mov      rbx, qword ptr [rsp + 0x30]
   1400579b0  mov      rcx, rsi
   1400579b3  call     0x140078890
   1400579b8  nop      
   1400579b9  lea      rcx, [rsp + 0x70]
   1400579be  call     0x140001a60
   1400579c3  nop      
   1400579c4  lea      rdx, [rbx - 0x18]
   1400579c8  lock xadd dword ptr [rdx + 0x10], edi
   1400579cd  sub      edi, 1
   1400579d0  jg       0x1400579db
   1400579d2  mov      rcx, qword ptr [rdx]
   1400579d5  mov      rax, qword ptr [rcx]
   1400579d8  call     qword ptr [rax + 8]
   1400579db  add      rsp, 0x400
   1400579e2  pop      r14
   1400579e4  pop      rdi
   1400579e5  pop      rsi
   1400579e6  pop      rbx
   1400579e7  pop      rbp
   1400579e8  ret      
   1400579e9  mov      ecx, 0x80004005
   1400579ee  call     0x140001b30
   1400579f3  nop      
   1400579f4  mov      ecx, 0x80004005
   1400579f9  call     0x140001b30
   1400579fe  nop      
   1400579ff  mov      ecx, 0x80004005
   140057a04  call     0x140001b30
   140057a09  int3     
