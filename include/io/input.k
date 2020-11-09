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

#define __SCANFMAXCHUNK 1000
__cdecl int __scanf(char* format, void** args, fd_t file){
    
    char* inp = nullptr;
    size_t len = 0;
    size_t gotten = 0;
    do {
        len+= __SCANFMAXCHUNK;
        inp = realloc(inp, len);
        gotten = fgets(file,inp+len-__SCANFMAXCHUNK, __SCANFMAXCHUNK);
        inp[len-__SCANFMAXCHUNK+gotten]=0;
    } while (gotten >= __SCANFMAXCHUNK );
    
    
    int retval = __SSCANF(format, inp, args);
    free(inp);
    return retval;
}
/**
 * scanf will scan stdin using format, and deposit the found values in the other arguments given.
 * @param format the format to use
 * @returns number of tokens found
 */
__cdecl size_t scanf(char* format, void* a, void* b, void* c, void* d, void* e){
    void* args[5];
    args[0]=a;
    args[1]=b;
    args[2]=c;
    args[3]=d;
    args[4]=e;
    return __scanf(format, &args, STDIN);
}
cextern size_t scanf(char* format, void* a, void* b, void* c, void*d);
cextern size_t scanf(char* format, void* a, void* b, void* c);
cextern size_t scanf(char* format, void* a, void* b);
cextern size_t scanf(char* format, void* a);
cextern size_t scanf(char* format);

/**
 * fscanf will do the same as scanf, but on a file of your choice.
 * @param file the file descriptor to read from
 * @param format the format of the data
 * @returns the number of arguments satisfied
 */
__cdecl size_t fscanf(fd_t file, char* format, void* a, void* b, void* c, void* d ){
    void* args[4];
    args[0]=a;
    args[1]=b;
    args[2]=c;
    args[3]=d;
    return __scanf(format, &args, file);
}
cextern size_t fscanf(fd_t file, char* format, void* a, void* b, void* c);
cextern size_t fscanf(fd_t file, char* format, void* a, void* b);
cextern size_t fscanf(fd_t file, char* format, void* a);
cextern size_t fscanf(fd_t file, char* format);








#endif