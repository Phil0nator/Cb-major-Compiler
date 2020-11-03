
#ifndef __PRINTF
#define __PRINTF

#include "sprintf.k"
#include "sys/files.k"
#include "stddef.k"
#include "memory.k"


#define __PRINTF_MAXNORMUSE 100000

global void __printf(char* fmt, void* args){

    char *normform = malloc(__PRINTF_MAXNORMUSE);
    int l = __sprintf(normform,fmt,args);
    write(STDOUT, normform, l);

    free(normform);

}

__cdecl void printf(char* fmt, void arg1, void arg2, void arg3, void arg4, void arg5){

    void* args =malloc(6*void);
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    args[4]=arg5;
    __printf(fmt,args);
    free(args);

}



cextern void printf(char* fmt, void arg1, void arg2, void arg3, void arg4);
cextern void printf(char* fmt, void arg1, void arg2, void arg3);
cextern void printf(char* fmt, void arg1, void arg2);
cextern void printf(char* fmt, void arg1);
global void printf(char* fmt){
    fputs(STDOUT, fmt);
}


#endif