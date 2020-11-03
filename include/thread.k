#ifndef __THREAD
#define __THREAD 1

#include "memory.k"
#include "bits.k"
#include "sys/pth.k"
#include "stddef.k"
#include "sys/time.k"
#include "sys/signal.k"
#include "sys/futex.k"

typedef void* __threadcallable;


typedef unsigned long thread_t;

long clone_threadflags = (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SYSVSEM | CLONE_SIGHAND | CLONE_THREAD | CLONE_SETTLS | CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID | 0);

int __tsigfutex = 0;


__cdecl void __thrdext(){
    __tsigfutex = thread_self();
    exit(0);
}


#define __threadstacksize 65536

inline long thrdcrt(void*fn, void arg, void*ptid, void*childtid){
    __asm{"
    
    call %Lthrdcrtsubfnc
    jmp %Lthrdcrtend
    
    ; nested function without stack frame for use of clone'd stack

    %Lthrdcrtsubfnc:
    push rdi
    call __crtstack                 ; build stack
    lea rsi, [rax + 65536 - 16] ; get top of stack
    pop qword [rsi]                 ; place function at the top of stack
    mov qword[rsi+0x8], __thrdext   ; place exit function for clean exit
    mov rdi, [clone_threadflags]    ; flags
    mov rax, 56                     ; syscall
    syscall
    ret
    %Lthrdcrtend:


    "}
}

__cdecl void* __crtstack(){
    
    return mmap(0, __threadstacksize, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|PROT_GROWSDOWN, 0, 0);

}


inline long __thrdgetrbp(){
    __asm{
    "mov rax, rbp"
    }
}




global thread_t thread(__threadcallable fn, void *arg){

    
    pid_t ppid;
    pid_t cpid;
    thread_t out = thrdcrt(fn, arg, ppid, cpid);    
    return out;


} 

global long thread_join(thread_t thread){
    long err= waitpid(getpid(), nullptr, __WCLONE);
    printf(strerror(err));
}


inline long thread_self(){
    return gettid();
}





#endif