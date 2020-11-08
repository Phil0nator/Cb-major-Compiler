/**
 * thread.k provides higher level threading access.
 */
#ifndef __THREAD
#define __THREAD 1

#include "memory.k"
#include "sys/pth.k"
#include "stddef.k"
#include "sys/time.k"
#include "sys/signal.k"
#include "futex.k"
#include "mutex.k"

typedef void* __threadcallable;



struct thread_t{

    mutex mut = false;
    __threadcallable callback = nullptr;
    pid_t tid = NULL;

};






long clone_threadflags = (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SYSVSEM
                       | CLONE_SIGHAND | CLONE_THREAD
                       | CLONE_SETTLS | CLONE_PARENT_SETTID
                       | CLONE_CHILD_CLEARTID
                       | SIGCHLD);



__cdecl void __thrdext(long ext){
    __asm{"mov rdi, rsp
    call _void_free_pvoid.
    "}
    exit(ext);
}


#define __threadstacksize 65536


global long thrdcrt(void* fn, thread_t* dest, void* arg){

    __asm{"
    mov r15, rdi
    mov r14, rsi
    mov r13, rdx
    call __crtstack
    lea rsi, [rax + 65536 - 8]
    mov rdi, [clone_threadflags]
    mov rax, 56
    syscall
    
    test rax, rax
    jnz %L__end



    mov rdi, r15
    mov rsi, r14
    mov rdx, r13
    call __enterthread
    mov rdi, rax
    call __thrdext

    %L__end:
    "}

}



__cdecl void* __crtstack(){
    
    return mmap(0, __threadstacksize, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|PROT_GROWSDOWN, 0, 0);

}

__cdecl long __enterthread(__threadcallable fn, thread_t* t, void* arg){
    long retval = fn(arg);
    munlock(&t->mut);
    printf("unlocked thread: %i\n", t->mut);
    return retval;
}





global void thread_create(thread_t* dest,__threadcallable fn, void *arg){

    mlock(&dest->mut);
    dest->tid = thrdcrt(fn,dest,arg);
    dest->callback = fn;

} 

global void thread_join(thread_t* thread){
    mlock(&thread->mut);
}


inline long thread_self(){
    return gettid();
}





#endif