   140057a60  mov      qword ptr [rsp + 8], rbx
   140057a65  mov      qword ptr [rsp + 0x10], rbp
   140057a6a  mov      qword ptr [rsp + 0x18], rsi
   140057a6f  push     rdi
   140057a70  sub      rsp, 0x20
   140057a74  mov      rax, qword ptr [rcx]
   140057a77  movzx    esi, dx
   140057a7a  mov      rdi, rcx
   140057a7d  movsxd   rbx, dword ptr [rax - 0x10]
   140057a81  test     ebx, ebx
   140057a83  js       0x140057b2b
   140057a89  mov      r8d, 1
   140057a8f  sub      r8d, dword ptr [rax - 8]
   140057a93  mov      eax, dword ptr [rax - 0xc]
   140057a96  sub      eax, ebx
   140057a98  or       r8d, eax
   140057a9b  jge      0x140057aa4
   140057a9d  mov      edx, ebx
   140057a9f  call     0x140002000
   140057aa4  mov      rax, qword ptr [rdi]
   140057aa7  xor      ebp, ebp
   140057aa9  mov      rdx, rax
   140057aac  lea      r11, [rax + rbx*2]
   140057ab0  cmp      rax, r11
   140057ab3  jae      0x140057af4
   140057ab5  lea      r10, [rax + 2]
   140057ab9  cmp      word ptr [rax], si
   140057abc  je       0x140057aec
   140057abe  lea      r9, [rdx + 2]
   140057ac2  mov      r8, rbp
   140057ac5  cmp      rdx, r9
   140057ac8  je       0x140057aec
   140057aca  nop      word ptr [rax + rax]
   140057ad0  cmp      r8, 1
   140057ad4  jae      0x140057aec
   140057ad6  movzx    ecx, word ptr [rax]
   140057ad9  inc      r8
   140057adc  mov      word ptr [rdx], cx
