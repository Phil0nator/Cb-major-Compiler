#ifndef __SYSTIME
#define __SYSTIME 1

#include "stddef.k"


struct timeval_t{
    int tv_sec;         /* seconds */
    int tv_usec;        /* and microseconds */
};

struct itimerval_t{

    timeval_t it_interval;  /* timer interval */
    timeval_t it_value;     /* current value */

};

struct timezone_t{

    int32 tz_minuteswest; /* minutes west of Greenwich */
    int32 tz_dsttime;     /* type of dst correction */

};

#define DST_NONE  0   /* not on dst */
#define DST_USA   1   /* USA style dst */
#define DST_AUST  2   /* Australian style dst */
#define DST_WET   3   /* Western European dst */
#define DST_MET   4   /* Middle European dst */
#define DST_EET   5   /* Eastern European dst */
#define DST_CAN   6   /* Canada */

#define ITIMER_REAL     0
#define ITIMER_VIRTUAL  1
#define ITIMER_PROF     2


function int adjtime(timeval_t *t1, timeval_t t2){

}
function int getitimer(int which, itimerval_t* value){
    __asm{
        "
        mov rax, 36
        syscall
        "
    }
}
function int gettimeofday(timeval_t *tv, timezone_t *tz){
    __asm{"
    mov rax, 96
    syscall
    "}
}
function int setitimer(int which, itimerval_t* value, itimerval_t* ovalue){
    __asm{"
    mov rax, 38
    syscall
    "}
}
function int settimeofday(timeval_t* tv, timezone_t* tz){
    __asm{"
    mov rax, 164
    syscall
    "}
}
function int utimes(char* filename, timeval_t*utimes){
    __asm{"
    mov rax, 235
    syscall
    "}
}
function time_t time(time_t *tloc){
    __asm{"
    mov rax, 201
    syscall
    "}
}


#endif