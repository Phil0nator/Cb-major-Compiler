
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


    ;rsi     ;commandline args
    ;rdi

    %%INITIALIZE%%

    %%ENTRY%%

    ret
