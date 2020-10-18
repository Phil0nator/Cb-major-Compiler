/*
  * <memory.k> contains rappers of malloc and its friends for convenience.
*/
#ifndef __MEMORY
#define __MEMORY 1


function void* malloc(size_t size){

    __asm{"
    
    ALIGN_STACK
    call malloc
    UNALIGN_STACK
    
    "}

}

function void* calloc(size_t size){

    __asm{"
    
    ALIGN_STACK
    call calloc
    UNALIGN_STACK
    
    "}

}

function void* realloc(void* og, size_t newsize){

    __asm{"
    
    ALIGN_STACK
    call realloc
    UNALIGN_STACK
    
    "}

}

function void free(void *ptr){

    __asm{"
    
    ALIGN_STACK
    call free
    UNALIGN_STACK
    
    
    "}

}

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

function void memset(void* dest, unsigned char value, size_t bytes){
    __asm{"
    
    _void_memset_pvoid.ucharsize_t_flp:
    dec rdx
    mov [rdi+rdx], sil
    jnz _void_memset_pvoid.ucharsize_t_flp
    
    "}
}

function void strcpy(char* dest, char* source){
    __asm{"
    
    _void_strcpy_pchar.char._flp:
    mov bl, [rsi]
    cmp bl, 0
    mov [rdi], bl
    jnz _void_strcpy_pchar.char._flp
    
    
    
    "}
}


function size_t strlen(char *str){

    __asm{"
    mov rax, -1
    _size_t_strlen_pchar._flp:
    mov bl, [rdi]
    inc rax
    inc rdi
    cmp bl, 0
    jnz _size_t_strlen_pchar._flp
    
    "}

}

#endif