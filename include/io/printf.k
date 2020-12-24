#define __PRINTF_MAXNORMUSE 10000


// printf is just a __sprintf wrapper
void __printf(char* fmt, void* args, fd_t ostream){

    char* tmp = qmmap(__PRINTF_MAXNORMUSE);
    int l = __sprintf(tmp+1,fmt,args);
    write(ostream, tmp,$size_t l);
    munmap(tmp, __PRINTF_MAXNORMUSE);
    
}

__cdecl void printf(char* fmt, void arg1, void arg2, void arg3, void arg4, void arg5){

    void args[6];
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    args[4]=arg5;
    __printf(fmt,&args, STDOUT);
    

}

__cdecl void eprintf(char* fmt, void arg1, void arg2, void arg3, void arg4, void arg5){
    void args[6];
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    args[4]=arg5;
    __printf(fmt,&args, STDERR);
}

__cdecl void fprintf(fd_t file, char* fmt, void arg1, void arg2, void arg3, void arg4){
    void args[4];
    args[0]=arg1;
    args[1]=arg2;
    args[2]=arg3;
    args[3]=arg4;
    __printf(fmt,&args, file);
}