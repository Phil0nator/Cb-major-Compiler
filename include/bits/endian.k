/**
 * endian.k provides conversions between big and little endian.
 */
#ifndef __BITS
#define __BITS 1

#include "stddef.k"

#define DOUBLE_PRECISION_MULTIPLIER 1000000000
#define FLOAT_PRECISION_MULTIPLIER 10000000

typedef unsigned long ulong;

/**
 * 64 bit little endian - big endian conversion
 */
inline long hton64(long x){
    __asm{"
    
    bswap rdi
    mov rax, rdi

    "}
}
/**
 * 32 bit little endian - big endian conversion
 */
inline int hton32(int x){
    __asm{
        "
        xor rax,rax
        bswap edi
        mov eax, edi
        "
    }
}
/**
 * 16 bit little endian - big endian conversion
 */
inline short hton16(short x){
    __asm{"
    xor rax, rax
    bswap edi
    shr edi, 16
    mov eax, edi
    "}
}

#endif