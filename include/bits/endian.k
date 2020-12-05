/*
    Contents: Functions to convert between big and little endian integers
    
    MIT License
    Copyright (c) 2020 Philo Kaulkin

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
    DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
    OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
    OR OTHER DEALINGS IN THE SOFTWARE.
*/
#ifndef __BITS
#define __BITS 1

#include "util/stddef.k"

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