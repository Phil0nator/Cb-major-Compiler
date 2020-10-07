%include "io64.inc"

section .data
    true: dq 1

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    xor rax, rax
    mov rax, 26
    xor rbx, rbx
    mov rcx, 1000000000
    flp:
    cmp rax, 26
    sete bl
    
    
    loop flp
    
    
    
    
    
    
    ret