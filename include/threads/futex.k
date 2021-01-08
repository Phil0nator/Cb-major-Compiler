/**
 * futex.k provides low level access to os-level futexes.
 */
#ifndef __FUTEX__
#define __FUTEX__ 1

#include "sys/time.k"
#include "util/stddef.k"

/* FUTEX operations  */
#define FUTEX_WAIT                      0       
#define FUTEX_WAKE                      1       
#define FUTEX_FD                        2       
#define FUTEX_REQUEUE                   3       
#define FUTEX_CMP_REQUEUE               4       
#define FUTEX_WAKE_OP                   5       
#define FUTEX_LOCK_PI                   6
#define FUTEX_UNLOCK_PI                 7
#define FUTEX_TRYLOCK_PI                8
#define FUTEX_WAIT_BITSET               9
#define FUTEX_WAKE_BITSET               10
#define FUTEX_WAIT_REQUEUE_PI           11
#define FUTEX_CMP_REQUEUE_PI            12
#define FUTEX_PRIVATE_FLAG              128
#define FUTEX_CLOCK_REALTIME            256
#define FUTEX_CMD_MASK                ~(FUTEX_PRIVATE_FLAG | FUTEX_CLOCK_REALTIME)
#define FUTEX_WAIT_PRIVATE              (FUTEX_WAIT | FUTEX_PRIVATE_FLAG)
#define FUTEX_WAKE_PRIVATE              (FUTEX_WAKE | FUTEX_PRIVATE_FLAG)
#define FUTEX_REQUEUE_PRIVATE           (FUTEX_REQUEUE | FUTEX_PRIVATE_FLAG)
#define FUTEX_CMP_REQUEUE_PRIVATE       (FUTEX_CMP_REQUEUE | FUTEX_PRIVATE_FLAG)
#define FUTEX_WAKE_OP_PRIVATE           (FUTEX_WAKE_OP | FUTEX_PRIVATE_FLAG)
#define FUTEX_LOCK_PI_PRIVATE           (FUTEX_LOCK_PI | FUTEX_PRIVATE_FLAG)
#define FUTEX_UNLOCK_PI_PRIVATE         (FUTEX_UNLOCK_PI | FUTEX_PRIVATE_FLAG)
#define FUTEX_TRYLOCK_PI_PRIVATE        (FUTEX_TRYLOCK_PI | FUTEX_PRIVATE_FLAG)
#define FUTEX_WAIT_BITSET_PRIVATE       (FUTEX_WAIT_BITSET | FUTEX_PRIVATE_FLAG)
#define FUTEX_WAKE_BITSET_PRIVATE       (FUTEX_WAKE_BITSET | FUTEX_PRIVATE_FLAG)
#define FUTEX_WAIT_REQUEUE_PI_PRIVATE   (FUTEX_WAIT_REQUEUE_PI | FUTEX_PRIVATE_FLAG)
#define FUTEX_CMP_REQUEUE_PI_PRIVATE    (FUTEX_CMP_REQUEUE_PI | FUTEX_PRIVATE_FLAG)

/**
 * https://man7.org/linux/man-pages/man2/futex.2.html
 */
inline long futex(int* uaddr, long op, int val, timeval_t *utime, int* uaddr2, int val3){
    syscall(SYS_futex);
}
/**
 * nfutex is a simple wrapper for the most common usage of futex
 * @see futex
 */
inline long nfutex(int* uaddr, long op, int val){
    return futex(uaddr, op, val,NULL,NULL,NULL);
}


#endif