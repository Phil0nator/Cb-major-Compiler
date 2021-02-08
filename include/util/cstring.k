#ifndef __STRING
#   error   "cstring.k should only be included through cstring.cb"
#endif


long strcpy(char* dest, char* source){
    __asm{"
    mov rax, -1
    _void_strcpy_pchar.char._flp:
    inc rax
    mov bl, [rsi]
    mov [rdi], bl
    inc rdi
    inc rsi
    test bl, bl
    jnz _void_strcpy_pchar.char._flp
    
    
    
    "}
}

size_t strlen(char *str){

    __asm{"
    mov rax, -1
    _size_t_strlen_pchar._flp:
    mov bl, [rdi]
    inc rax
    inc rdi
    test bl, bl
    jnz _size_t_strlen_pchar._flp
    
    "}

}


char* memchr(char* str, char c, size_t n){
    register size_t finalptr = ((size_t) str)+n;
    while((size_t)str < finalptr){
        if(@str == c){
            return str;
        }
        str++;
    }
    return nullptr;   
}


int memcmp(char* str1, char* str2, size_t n){
    
    register int value = 0;
    register char* maxstr = str1+ (char*) n;
    while(str1 < maxstr){
        
        if(@str1 < @str2){
            value--;
        }else{
            value++;
        }
        str1++;
        str2++;
    }

    return value;

}


char* strchr(char* str, char c){

    while(@str != 0){
        if(@str == c){
            return str;
        }
        str++;
    }
    return nullptr;

}


char* strerror(void errnum){
    if(errnum >= 0){
        return get_errstr(errnum);
    }else{
        return get_errstr(0-errnum);
    }
    return nullptr;
}