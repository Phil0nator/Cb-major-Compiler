/*
  * <memory.k> contains rappers of malloc and its friends for convenience.
*/
#ifndef __MEMORY
#define __MEMORY 1


#define PROT_READ       0x1
#define PROT_WRITE      0x2
#define PROT_EXEC       0x4
#define PROT_NONE       0x0

#define PROT_GROWSDOWN  0x01000000
#define PROT_GROWSUP    0x02000000

#define MAP_SHARED      0x01
#define MAP_PRIVATE     0x02

#define MAP_FIXED       0x10
#define MAP_FILE        0

#define MAP_ANONYMOUS 0x20


#include "stddef.k"
typedef int intptr_t;
typedef int off_t;

cextern void* malloc(size_t size);
cextern void* calloc(size_t size);
cextern void* realloc(void* og, size_t newsize);
cextern void free(void *ptr);



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


global void* mmap(void* addr, size_t length, long prot, long flags, long fd, off_t offset){
    __asm{"
    mov rax, 9
    syscall
    "}
}

global void* munmap(void* addr, size_t length){
    __asm{"
    mov rax, 11
    syscall
    "}
}


#endif