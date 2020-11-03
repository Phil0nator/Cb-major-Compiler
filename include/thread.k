#ifndef __THREAD
#define __THREAD 1

#include "memory.k"
#include "bits.k"
#include "sys/pth.k"
#include "stddef.k"


typedef void* __threadcallable;


typedef unsigned long thread_t;

#define clone_threadflags (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SYSVSEM | CLONE_SIGHAND | CLONE_THREAD | CLONE_SETTLS | CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID | 0)
#define __threadstacksize (1024*4096)


global thread_t thread(__threadcallable fn, void *arg){

    //void* newsp = mmap(0, __threadstacksize, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|PROT_GROWSDOWN, 0, 0);
    //void* stacktop = newsp+__threadstacksize-8;
    printf("%i", 46545465468546548);
    
    
    //return clone(clone_threadflags,stacktop, 0, 0, NULL);




} 







#endif