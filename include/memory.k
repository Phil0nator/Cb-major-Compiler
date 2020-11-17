/*
  * <memory.k> contains wrappers of malloc and its friends for convenience.
*/
#ifndef __MEMORY
#define __MEMORY 1



#include "stddef.k"
#include "sys/mman.cb"
#include "malloc.cb"


/* Temporary memory macros until proper malloc is implimented */

// global void* malloc(size_t size){
//     register void* out = qmmap(size+8);
//     @out = size;
//     return out+8;
// }
// global void free(void* addr){
//     return munmap(addr-0x8, @(addr-0x8));
// }






function void memcpy(void *dest, void* source, size_t bytes){

    __asm{"
    ; rax = final dest:
    
    _void_memcpy_pvoid.void.int_flp:
    mov bl, [rsi]
    mov [rdi], bl
    inc rsi
    inc rdi
    dec rdx
    jnz _void_memcpy_pvoid.void.int_flp
    
    
    "}

}

#ifdef __AVX
function void avx_memcpy(void* dest, void* source, size_t bytes){

    int offset = bytes%32;
    size_t avxcount = (bytes-offset)/4;
    for(int i = 0; i < avxcount;i=i+4){
        __simd 4 char (source, i) {} (dest, i);
    }
    if(offset != 0){
        memcpy(dest+avxcount, source+avxcount, offset);
    }
}
#endif

function void memset(void* dest, unsigned char value, size_t bytes){
    __asm{"
    
    _void_memset_pvoid.ucharsize_t_flp:
    dec rdx
    mov [rdi+rdx], sil
    jnz _void_memset_pvoid.ucharsize_t_flp
    
    "}
}



#endif