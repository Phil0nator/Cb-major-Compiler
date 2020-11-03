#ifndef __FUTEX__
#define __FUTEX__ 1

#include "time.k"


inline long futex(int* uaddr, long op, int val, timeval_t *utime, int* uaddr2, int val3){
    __asm{"
    mov rax, 202
    mov r10, rcx
    syscall
    "}
}

inline long nfutex(int* uaddr, long op){
    return futex(uaddr, op, NULL,NULL,NULL,NULL);
}


#endif