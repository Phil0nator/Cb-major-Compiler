
#ifndef __PRINTF
#define __PRINTF

#include "sprintf.k"
#include "sys/files.k"
#include "filesystem.k"
#include "stddef.k"
#include "memory.k"

#define __PRINTF_MAXNORMUSE 10000
void __printf__space;
// printf is just a __sprintf wrapper
global void __printf(char* fmt, void* args, fd_t ostream){

    if(!__printf__space){
        __printf__space = qmmap(__PRINTF_MAXNORMUSE);
    }
    int l = __sprintf(__printf__space,fmt,args);
    write(ostream, __printf__space, l);
}
/**
 * Printf will print fmt into stdout, formatting it with the additional arguments.
 * (for formats, @see __SPRINTF)
 * @param fmt format
 * @returns None
 */
__cdecl void printf(char* fmt, void arg1, void arg2, void arg3, void arg4, void arg5){

    void args[6];
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    args[4]=arg5;
    __printf(fmt,&args, STDOUT);
    

}



cextern void printf(char* fmt, void arg1, void arg2, void arg3, void arg4);
cextern void printf(char* fmt, void arg1, void arg2, void arg3);
cextern void printf(char* fmt, void arg1, void arg2);
cextern void printf(char* fmt, void arg1);
inline void printf(char* fmt){
    fputs(STDOUT, fmt);
}

/**
 * eprintf provides a way to use the standard printf function for the STDERR
 * output stream. The output of eprintf will go to STDERR instead of STDOUT.
 * for format information @see __SPRINTF
 * @param fmt format
 * @returns None
 */
__cdecl void eprintf(char* fmt, void arg1, void arg2, void arg3, void arg4, void arg5){
    void args[6];
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    args[4]=arg5;
    __printf(fmt,&args, STDERR);
}

cextern void eprintf(char* fmt, void arg1, void arg2, void arg3, void arg4);
cextern void eprintf(char* fmt, void arg1, void arg2, void arg3);
cextern void eprintf(char* fmt, void arg1, void arg2);
cextern void eprintf(char* fmt, void arg1);
inline void eprintf(char* fmt){
    fputs(STDERR, fmt);
}

/**
 * fprintf provides the functionality of printf but for an output file or stream of your choice.
 * @param file output file / stream
 * @param fmt format
 * @returns None
 */
__cdecl void fprintf(fd_t file, char* fmt, void arg1, void arg2, void arg3, void arg4){
    void args[4];
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    __printf(fmt,&args, file);
}
cextern void fprintf(fd_t file, char* fmt, void arg1, void arg2, void arg3);
cextern void fprintf(fd_t file, char* fmt, void arg1, void arg2);
cextern void fprintf(fd_t file, char* fmt, void arg1);
inline void fprintf(fd_t file,char* fmt){
    fputs(file, fmt);
}

#endif