#ifndef __STRING
#define __STRING 1



function int strcpy(char* dest, char* source){
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


function size_t strlen(char *str){

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

/*
TODO:
Impliment cstring functions
#https://www.tutorialspoint.com/c_standard_library/string_h.htm
*/

/*
* Find the first instance of char c in string str within
*       n bytes.
*/
function char* memchr(char* str, char c, size_t n){
    register size_t finalptr = str+n;
    while(str < finalptr){
        if(@str == c){
            return str;
        }
        str++;
    }
    return nullptr;   
}
/*
*   Compare str1 to str2 within n bytes
*
*/
function int memcmp(char* str1, char* str2, size_t n){
    
    register int value = 0;
    register size_t maxstr = str1+n;
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

function char* strcat(char* dest, char* source);

function char* strncat(char* dest, char* source, size_t n);

/*
*   Find the first instance of char c in string str
*
*/
function char* strchr(char* str, char c){

    while(@str != 0){
        if(@str == c){
            return str;
        }
        str++;
    }
    return nullptr;

}

function int strcmp(char* str1, char str2);
function size_t strcspn(char* str1, char* str2);
function char* strerror(int errnum); //https://code.woboq.org/userspace/glibc/sysdeps/gnu/errlist.c.html#_sys_errlist_internal

function char* strpbrk(char* str1, char* str2);
function char* strrchr(char* str, char c);
function size_t strspn(char* str1, char* str2);
function char* strstr(char* haystack, char* needle);
function char* strtok(char*str, char delim);




#endif