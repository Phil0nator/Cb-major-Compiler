
#ifndef __BITS
#define __BITS 1

#include "stddef.k"

#define DOUBLE_PRECISION_MULTIPLIER 1000000000
#define FLOAT_PRECISION_MULTIPLIER 10000000

global long hton64(long x){
    __asm{"
    
    bswap rdi
    mov rax, rdi

    "}
}

global int hton32(int x){
    __asm{
        "
        xor rax,rax
        bswap edi
        mov eax, edi
        "
    }
}

global short hton16(short x){
    __asm{"
    xor rax, rax
    bswap edi
    shr edi, 16
    mov eax, edi
    "}
}

#endif