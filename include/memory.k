/*
  * <memory.k> contains rappers of malloc and its friends for convenience.
*/



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

function void memcpy(void *dest, void* source, int bytes){

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