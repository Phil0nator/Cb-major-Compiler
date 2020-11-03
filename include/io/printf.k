
#ifndef __PRINTF
#define __PRINTF

#include "sprintf.k"
#include "sys/files.k"
#include "stddef.k"
#include "memory.k"


#define __PRINTF_MAXNORMUSE 100000

global void __printf(char* fmt, void* args){

    char *normform = qmmap(__PRINTF_MAXNORMUSE);
    int l = __sprintf(normform,fmt,args);
    write(STDOUT, normform, l);

    munmap(normform, __PRINTF_MAXNORMUSE);

}

__cdecl void printf(char* fmt, void arg1, void arg2, void arg3, void arg4, void arg5){

    void args[6];
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    args[4]=arg5;
    __printf(fmt,&args);
    

}



cextern void printf(char* fmt, void arg1, void arg2, void arg3, void arg4);
cextern void printf(char* fmt, void arg1, void arg2, void arg3);
cextern void printf(char* fmt, void arg1, void arg2);
cextern void printf(char* fmt, void arg1);
global void printf(char* fmt){
    fputs(STDOUT, fmt);
}


#endif