#include "include/stddef.k"


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

const int32 DST_NONE = 0;   /* not on dst */
const int32 DST_USA  = 1;   /* USA style dst */
const int32 DST_AUST = 2;   /* Australian style dst */
const int32 DST_WET  = 3;   /* Western European dst */
const int32 DST_MET  = 4;   /* Middle European dst */
const int32 DST_EET  = 5;   /* Eastern European dst */
const int32 DST_CAN  = 6;   /* Canada */

const int32 ITIMER_REAL = 0;
const int32 ITIMER_VIRTUAL = 1;
const int32 ITIMER_PROF = 2;


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