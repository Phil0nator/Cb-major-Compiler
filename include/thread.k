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

long clone_threadflags = (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SYSVSEM
                       | CLONE_SIGHAND | CLONE_THREAD
                       | CLONE_SETTLS | CLONE_PARENT_SETTID
                       | CLONE_CHILD_CLEARTID
                       | SIGCHLD);



__cdecl void __thrdext(){
    __asm{"mov rdi, rsp
    call _void_free_pvoid.
    "}



    exit(0);
}


#define __threadstacksize 65536
/*
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

*/

global long thrdcrt(void* fn){

    __asm{"
    mov r15, rdi
    call __crtstack
    lea rsi, [rax + 65536 - 8]
    mov rdi, [clone_threadflags]
    mov rax, 56
    syscall
    
    test rax, rax
    jnz %L__end
    call r15
    mov rdi, rax
    mov rax, 60
    syscall

    %L__end:
    "}

}



__cdecl void* __crtstack(){
    
    return mmap(0, __threadstacksize, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|PROT_GROWSDOWN, 0, 0);

}






global thread_t thread_create(__threadcallable fn, void *arg){

    

    thread_t out = thrdcrt(fn);    
    return out;


} 

global void thread_join(thread_t thread){
    int status = 0;
    void raw[100];
    long err = waitid(P_ALL, 1, &raw, WUNTRACED, 0);
    printf("Error: %s\n", strerror(err));
    
    
}


inline long thread_self(){
    return gettid();
}





#endif