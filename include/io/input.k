#ifndef __INPUT
#define __INPUT 1

#include "stddef.k"
#include "printf.k"
#include "memory.k"
#include "filesystem.k"
#include "sprintf.k"
#include "sscanf.k"

#define MAX_INT64LEN 40
/*

    Printf msg, and return an integer value from stdin

*/
function int getInt(char* msg){
    
    printf(msg);
    char buff[MAX_INT64LEN];
    memset(&buff, 0, MAX_INT64LEN);
    fgets(STDIN, &buff, MAX_INT64LEN);
    return toInteger(&buff, true);

}

/*
    Printf msg, and return an unsigned integer value from stdin

*/
function unsigned int getUint(char* msg){

    printf(msg);
    char buff[MAX_INT64LEN];
    memset(&buff, 0, MAX_INT64LEN);
    fgets(STDIN, &buff, MAX_INT64LEN);
    return toInteger(&buff, true);

}
/* get last char in stdin */
function char getchar(){
    char c;
    fgets(STDIN, &c, 1);
    return c;
}

function int getHex(char* msg){
    /*TODO*/
    return 0;
}
/* printf msg, and copy a string from stdin into buffer of length no greater than maxlen */
function void getString(char* buffer, int maxlen, char* msg){
    
    printf(msg);
    fgets(STDIN, buffer, maxlen);

}




// String to integer
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

// scanf wrappers
__cdecl int __scanf(char* format, void** args){
    register char* inp = floads(STDIN);
    register int retval = __SSCANF(format, inp, args);
    free(inp);
    return retval;
}
/**
 * scanf will scan stdin using format, and deposit the found values in the other arguments given.
 * @param format the format to use
 * @returns number of tokens found
 */
__cdecl int scanf(char* format, void* a, void* b, void* c, void* d, void* e){
    void* args[5];
    args[0]=a;
    args[1]=b;
    args[2]=c;
    args[3]=d;
    args[4]=e;
    return __scanf(format, &args);
}
cextern int scanf(char* format, void* a, void* b, void* c, void*d);
cextern int scanf(char* format, void* a, void* b, void* c);
cextern int scanf(char* format, void* a, void* b);
cextern int scanf(char* format, void* a);
cextern int scanf(char* format);










#endif