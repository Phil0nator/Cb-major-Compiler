
section .data
    %%CONSTANTS%%

section .bss
    %%HEAP%%

section .text
global CMAIN


%%TEXT%%


CMAIN:
    mov rbp, rsp
    xor rax, rax


    mov r9, rsi     ;commandline args
    mov r10, rdi
    align 16

    %%INITIALIZE%%

    %%ENTRY%%

    ret
