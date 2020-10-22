#ifndef __INPUT
#define __INPUT 1

#include "stddef.k"
#include "printf.k"
#include "memory.k"
#include "filesystem.k"


function int getInt(char* msg){
    __asm{"
    PRINT_STRING [rdi]
    GET_DEC 8, rax
    "}
}
function unsigned int getUint(char* msg){
    __asm{"
    PRINT_STRING [rdi]
    GET_UDEC 8, rax
    "}
}

function char getchar(){
    __asm{"call getchar"}
}

function int getHex(char* msg){
    __asm{"
    PRINT_STRING [rdi]
    GET_HEX 8, rax
    "}
}
function void getString(char* buffer, int maxlen, char* msg){
    __asm{"
    PRINT_STRING [rdx]
    GET_STRING [rdi], rsi 
    "}
}


function void get_stdin(){
    __asm{"call get_stdin"}
}

function char* getString(char* msg){
    
    size_t size = 80;
    char *str = malloc(size);
    int c;
    size_t len = 0;
    printf("%s", msg);

    fgets(STDIN, &c, 1);

    while (c != 10) {
        //str[len] = c;
        if(len == size) {
            size = size * 2;
            str = realloc(str, size);
        }
        str[len] = c;
        fgets(STDIN, &c, 1);
        len=len+1;
    }
    str[len+1]=0;
    return realloc(str, len);



}


function int toInteger(char* str){

    int l = strlen(str);
    bool positive = true;
    if(str[0] == '-'){
        positive=false;
        str=str+1;
        l-=1;
    }

    int total = 0;
    for(int i = 0; i < l;i+=1){
        total = (total*10)+(str[i]-'0'); 
    }
    if(!positive){
        return 0-total;
    }
    return total;


}



#endif