#ifndef __THREAD
#define __THREAD 1

#include "memory.k"
#include "sys/pth.k"
#include "stddef.k"


typedef void* __threadcallable;


typedef unsigned long thread_t;

global thread_t thread(__threadcallable fn, void *arg){

    void* stack = mmap(0, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);

    return NULL;

} 







#endif