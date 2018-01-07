OPEN_BRACKETS:
  .zero 3
openBrackets:
  .zero 1024
openCursor:
  .zero 4
CLOSE_BRACKETS:
  .zero 3
closeBrackets:
  .zero 1024
closeCursor:
  .long 1024
indexOf(char, char const*):
  push rbp
  mov rbp, rsp
  mov eax, edi
  mov QWORD PTR [rbp-32], rsi
  mov BYTE PTR [rbp-20], al
  mov DWORD PTR [rbp-4], 0
.L5:
  cmp DWORD PTR [rbp-4], 2
  jg .L2
  mov eax, DWORD PTR [rbp-4]
  movsx rdx, eax
  mov rax, QWORD PTR [rbp-32]
  add rax, rdx
  movzx eax, BYTE PTR [rax]
  cmp BYTE PTR [rbp-20], al
  jne .L3
  mov eax, DWORD PTR [rbp-4]
  jmp .L4
.L3:
  add DWORD PTR [rbp-4], 1
  jmp .L5
.L2:
  mov eax, -1
.L4:
  pop rbp
  ret
in_array(char, char const*):
  push rbp
  mov rbp, rsp
  sub rsp, 16
  mov eax, edi
  mov QWORD PTR [rbp-16], rsi
  mov BYTE PTR [rbp-4], al
  movsx eax, BYTE PTR [rbp-4]
  mov rdx, QWORD PTR [rbp-16]
  mov rsi, rdx
  mov edi, eax
  call indexOf(char, char const*)
  cmp eax, -1
  setne al
  leave
  ret
checkBrackets(int, char const*):
  push rbp
  mov rbp, rsp
  sub rsp, 32
  mov DWORD PTR [rbp-20], edi
  mov QWORD PTR [rbp-32], rsi
  mov DWORD PTR [rbp-4], 0
.L12:
  mov eax, DWORD PTR [rbp-4]
  cmp eax, DWORD PTR [rbp-20]
  jge .L9
  mov eax, DWORD PTR [rbp-4]
  movsx rdx, eax
  mov rax, QWORD PTR [rbp-32]
  add rax, rdx
  movzx eax, BYTE PTR [rax]
  movsx eax, al
  mov esi, OFFSET FLAT:OPEN_BRACKETS
  mov edi, eax
  call in_array(char, char const*)
  test al, al
  je .L10
  mov eax, DWORD PTR [rbp-4]
  movsx rdx, eax
  mov rax, QWORD PTR [rbp-32]
  lea rcx, [rdx+rax]
  mov eax, DWORD PTR openCursor[rip]
  lea edx, [rax+1]
  mov DWORD PTR openCursor[rip], edx
  movzx edx, BYTE PTR [rcx]
  cdqe
  mov BYTE PTR openBrackets[rax], dl
  jmp .L11
.L10:
  mov eax, DWORD PTR [rbp-4]
  movsx rdx, eax
  mov rax, QWORD PTR [rbp-32]
  add rax, rdx
  movzx eax, BYTE PTR [rax]
  movsx eax, al
  mov esi, OFFSET FLAT:CLOSE_BRACKETS
  mov edi, eax
  call in_array(char, char const*)
  test al, al
  je .L11
  mov eax, DWORD PTR [rbp-4]
  movsx rdx, eax
  mov rax, QWORD PTR [rbp-32]
  add rdx, rax
  mov eax, DWORD PTR closeCursor[rip]
  sub eax, 1
  mov DWORD PTR closeCursor[rip], eax
  mov eax, DWORD PTR closeCursor[rip]
  movzx edx, BYTE PTR [rdx]
  cdqe
  mov BYTE PTR closeBrackets[rax], dl
.L11:
  add DWORD PTR [rbp-4], 1
  jmp .L12
.L9:
  mov eax, DWORD PTR openCursor[rip]
  mov edx, 1023
  sub edx, eax
  mov eax, DWORD PTR closeCursor[rip]
  cmp edx, eax
  je .L13
  mov eax, 0
  jmp .L14
.L13:
  mov DWORD PTR [rbp-8], 0
.L17:
  mov eax, DWORD PTR openCursor[rip]
  cmp DWORD PTR [rbp-8], eax
  jge .L15
  mov eax, DWORD PTR [rbp-8]
  cdqe
  movzx eax, BYTE PTR openBrackets[rax]
  movsx eax, al
  mov esi, OFFSET FLAT:OPEN_BRACKETS
  mov edi, eax
  call indexOf(char, char const*)
  mov DWORD PTR [rbp-12], eax
  cmp DWORD PTR [rbp-12], -1
  je .L16
  mov eax, DWORD PTR closeCursor[rip]
  lea edx, [rax+1]
  mov DWORD PTR closeCursor[rip], edx
  cdqe
  movzx edx, BYTE PTR closeBrackets[rax]
  mov eax, DWORD PTR [rbp-12]
  cdqe
  movzx eax, BYTE PTR CLOSE_BRACKETS[rax]
  cmp dl, al
  setne al
  test al, al
  je .L16
  mov eax, 0
  jmp .L14
.L16:
  add DWORD PTR [rbp-8], 1
  jmp .L17
.L15:
  mov eax, 1
.L14:
  leave
  ret
.LC0:
  .string "YES"
.LC1:
  .string "NO"
main:
  push rbp
  mov rbp, rsp
  push rbx
  sub rsp, 24
  mov DWORD PTR [rbp-20], edi
  mov QWORD PTR [rbp-32], rsi
  mov BYTE PTR OPEN_BRACKETS[rip], 40
  mov BYTE PTR OPEN_BRACKETS[rip+1], 123
  mov BYTE PTR OPEN_BRACKETS[rip+2], 91
  mov BYTE PTR CLOSE_BRACKETS[rip], 41
  mov BYTE PTR CLOSE_BRACKETS[rip+1], 125
  mov BYTE PTR CLOSE_BRACKETS[rip+2], 93
  mov rax, QWORD PTR [rbp-32]
  add rax, 8
  mov rbx, QWORD PTR [rax]
  mov rax, QWORD PTR [rbp-32]
  add rax, 8
  mov rax, QWORD PTR [rax]
  mov rdi, rax
  call strlen
  mov rsi, rbx
  mov edi, eax
  call checkBrackets(int, char const*)
  test al, al
  je .L19
  mov eax, OFFSET FLAT:.LC0
  jmp .L20
.L19:
  mov eax, OFFSET FLAT:.LC1
.L20:
  mov rdi, rax
  call puts
  mov eax, 0
  add rsp, 24
  pop rbx
  pop rbp
  ret
