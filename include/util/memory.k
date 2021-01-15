#ifndef __MEMORY
#   error "memory.k should only be included through memory.cb"
#endif



void memcpy(void *dest, void* source, size_t bytes){

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


void avx_memcpy(void* dest, void* source, size_t bytes){

    return memcpy(dest, source, bytes);
    /* TODO:
    int offset = bytes%32;
    size_t avxcount = (bytes-offset)/4;
    for(int i = 0; i < avxcount;i=i+4){
        //__simd 4 char (source, i) {} (dest, i);
    }
    if(offset != 0){
        memcpy(dest+avxcount, source+avxcount, $size_t offset);
    }
    */
}


void avx_memzeraligned(void* dest, size_t qqwords){
    __asm{"
    vxorpd ymm0, ymm0, ymm0
    %Lavxmemzeraligned_lp:
    vmovdqu [rdi], ymm0
    add rdi, 4
    sub rsi, 4
    jnz %Lavxmemzeraligned_lp
    "}
}


void avx_memzer(void* dest, size_t bytes){
    int offset = bytes%32;
    size_t avxcount = (bytes-offset)/4;
    
    
    avx_memzeraligned(dest, avxcount);

    if(offset != 0){
        memset(dest+avxcount, 0, (size_t) offset);
    }
}


void memset(void* dest, unsigned char value, size_t bytes){
    __asm{"
    
    _void_memset_pvoid.ucharsize_t_flp:
    dec rdx
    mov [rdi+rdx], sil
    jnz _void_memset_pvoid.ucharsize_t_flp
    
    "}
}

void memzer(void* dest, size_t bytes){
    __asm{"
    
    xor bl, bl
    %L:
    mov [rdi+rsi], bl
    dec rsi
    jnz %L
    
    "}
}