#ifndef __PTH
#define __PTH 1

#include "stddef.k"
#include "filesystem.k"
#include "memory.k"
#include "string.k"
typedef long pid_t;

inline long fork(){
    __asm{"
    mov rax, 57
    syscall
    "}
}
inline long vfork(){
    __asm{"
    mov rax, 58
    syscall
    "}
}
inline long execve(char* pathname, char** args, char** env){
    __asm{"
    mov rax, 59
    syscall
    "}
}

inline long pause(){
    __asm{"
    mov rax, 34
    syscall
    "}
}

inline long waitpid(pid_t pid, int *wstatus, int options){

    __asm{"
    mov rax, 61
    xor r8, r8
    syscall
    "}

}

inline long clone(unsigned long clone_flags, unsigned long newsp, void* parent_tid, void* child_tid, unsigned int tid){
    __asm{"
    mov rax, 56
    mov r10, rcx
    syscall
    "}
}



char* __systembashpath = "/bin/bash";

char** __emptyenv = {"PATH=/bin:/usr/bin:/sbin:/usr/sbin",nullptr};

global long execl(char* path, char** args){

    return execve(path,args,__emptyenv);

}

char** __systemcallargvconst = {"sudo", "-c", nullptr};

global long system(char* command){

    
    pid_t pid = fork();
    if(pid == 0 ){
        
        __systemcallargvconst[2] = command;

        
        long err = execl(__systembashpath, __systemcallargvconst);
        printf(strerror(err));
        
    } // if child, execute bash
    waitpid(pid, nullptr, nullptr);
    return 0;
}








#endif