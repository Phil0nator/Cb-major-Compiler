#ifndef __MUTEX
#define __MUTEX 1


#include "stddef.k"
#include "sys/atomic.k"


typedef int mutex;

global void mutex_cmpxchg(mutex* mut, int expect, int desire){
    int* ep = &expect;
    _atomic_cmpxchg(mut,ep,desire);
    return @ep;
}

global void mlock(mutex* mut){

    int c = mutex_cmpxchg(mut,0,1);
    if(c != 0){

        while(true){

            if(c == 2 || mutex_cmpxchg(mut, 1, 2) != 0){
                nfutex(mut, FUTEX_WAIT, 2);
            }
            c = mutex_cmpxchg(mut, 0, 2);
            if(c == 0 ){
                printf("LOCKED");
                break;
            }
        }
    }

}

global void munlock(mutex* mut){
    if(_atomic_sub(mut, 1) != 1){
        _atomic_store(mut, 0);
        nfutex(mut, FUTEX_WAIT, 2);
    }
}


#endif