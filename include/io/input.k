#ifndef __INPUT
#define __INPUT 1

#include "stddef.k"
#include "printf.k"
#include "memory.k"
#include "filesystem.k"
#include "sprintf.k"

#define MAX_INT64LEN 40
function int getInt(char* msg){
    
    printf(msg);
    char buff[MAX_INT64LEN];
    memset(&buff, 0, MAX_INT64LEN);
    fgets(STDIN, &buff, MAX_INT64LEN);
    return toInteger(&buff, true);

}
function unsigned int getUint(char* msg){

    printf(msg);
    char buff[MAX_INT64LEN];
    memset(&buff, 0, MAX_INT64LEN);
    fgets(STDIN, &buff, MAX_INT64LEN);
    return toInteger(&buff, true);

}

function char getchar(){
    char c;
    fgets(STDIN, &c, 1);
    return c;
}

function int getHex(char* msg){
    /*TODO*/
    return 0;
}
function void getString(char* buffer, int maxlen, char* msg){
    
    printf(msg);
    fgets(STDIN, buffer, maxlen);

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


function int toInteger(char* str, bool signed){

    while(@str == ' '){
        str+=1;
    }
    char c = $char (@str);
    int val = 0;
    bool negative = false;
    if(c == '-' && signed){
        negative = true;
        str+=1;
        c = $char(@str);
    }
    while(c != 0 && c != 10 && c != ' '){
        val = (val*10)+(c-'0');
        str+=1;
        c = $char (@str);
    }

    if(negative){
        return 0-val;
    }
    return val;


}



#endif