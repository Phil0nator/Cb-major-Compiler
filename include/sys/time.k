/**
 * sys/time gives low level time-related function access.
 */
#ifndef __SYSTIME
#define __SYSTIME 1

#include "stddef.k"

typedef long time_t;
struct timeval_t{
    long tv_sec;         /* seconds */
    long tv_usec;        /* and microseconds */
};

struct itimerval_t{

    timeval_t it_interval;  /* timer interval */
    timeval_t it_value;     /* current value */

};

struct timezone_t{

    int tz_minuteswest; /* minutes west of Greenwich */
    int tz_dsttime;     /* type of dst correction */

};

#define DST_NONE  0   /* not on dst */
#define DST_USA   1   /* USA style dst */
#define DST_AUST  2   /* Australian style dst */
#define DST_WET   3   /* Western European dst */
#define DST_MET   4   /* Middle European dst */
#define DST_EET   5   /* Eastern European dst */
#define DST_CAN   6   /* Canada */

/* timer types */
#define ITIMER_REAL     0
#define ITIMER_VIRTUAL  1
#define ITIMER_PROF     2

/**
 * https://man7.org/linux/man-pages/man2/getitimer.2.html
 */
inline int getitimer(int which, itimerval_t* value){
    __asm{
        "
        mov rax, 36
        syscall
        "
    }
}
/**
 * https://man7.org/linux/man-pages/man2/gettimeofday.2.html
 */
inline int gettimeofday(timeval_t *tv, timezone_t *tz){
    __asm{"
    mov rax, 96
    syscall
    "}
}
/**
 * https://man7.org/linux/man-pages/man2/setitimer.2.html
 */
inline int setitimer(int which, itimerval_t* value, itimerval_t* ovalue){
    __asm{"
    mov rax, 38
    syscall
    "}
}
/**
 * https://man7.org/linux/man-pages/man2/settimeofday.2.html
 */
inline int settimeofday(timeval_t* tv, timezone_t* tz){
    __asm{"
    mov rax, 164
    syscall
    "}
}
/**
 * https://man7.org/linux/man-pages/man2/utimes.2.html
 */
inline int utimes(char* filename, timeval_t*utimes){
    __asm{"
    mov rax, 235
    syscall
    "}
}
/**
 * https://man7.org/linux/man-pages/man2/time.2.html
 */
inline time_t time(time_t *tloc){
    __asm{"
    mov rax, 201
    syscall
    "}
}
/**
 * Halt execution of the calling thread for at least the amount of time specified by req.
 * The resolution of the time will be in nanoseconds.
 * @param req least time to sleep
 * @param rem timeval (optional)
 * @returns None (cannot fail)
 */
inline void nanosleep(timeval_t*req, timeval_t*rem){
    __asm{"
    mov rax, 35
    syscall
    "}
}
/**
 * Halt execution of the calling thread for at least the specified nanoseconds.
 * @param nanoseconds least sleep time
 * @returns None (cannot fail)
 */
global void usleep(long nanoseconds){
    timeval_t req;
    req.tv_sec = 0;
    req.tv_usec = nanoseconds;
    nanosleep(&req, nullptr);
}


#endif