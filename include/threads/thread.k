#ifndef __THREAD
#   error "thread.k should only be included through thread.cb"
#endif

long clone_threadflags = (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SYSVSEM
                       | CLONE_SIGHAND | CLONE_THREAD
                       | CLONE_SETTLS | CLONE_PARENT_SETTID
                       | CLONE_CHILD_CLEARTID
                       | SIGCHLD);



void __thrdext(long ext){
    __asm{"mov rdi, rsp
    call _void_free_pvoid.
    "}
    exit(ext);
}


#define __threadstacksize 65536


long thrdcrt(void* fn, thread_t* dest, void* arg){

    __asm{"
    mov r15, rdi
    mov r14, rsi
    mov r13, rdx
    call _void.___crtstack_p
    lea rsi, [rax + 65536 - 8]
    mov rdi, [clone_threadflags]
    mov rax, 56
    syscall
    
    test rax, rax
    jnz %L__end



    mov rdi, r15
    mov rsi, r14
    mov rdx, r13
    call _long___enterthread_p__threadcallablethread_t.void.
    mov rdi, rax
    call _void___thrdext_plong

    %L__end:
    "}

}



void* __crtstack(){
    
    return mmap(0, __threadstacksize, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|PROT_GROWSDOWN, 0, 0);

}

long __enterthread(__threadcallable fn, thread_t* t, void* arg){
    long retval = fn(arg);
    munlock(&t->mut);
    return retval;
}



void thread_create(thread_t* dest,__threadcallable fn, void *arg){

    mlock(&dest->mut);
    dest->tid = thrdcrt(fn,dest,arg);
    dest->callback = fn;

} 

void thread_join(thread_t* thread){
    mlock(&thread->mut);
}