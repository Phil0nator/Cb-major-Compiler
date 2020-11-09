/**
 * chrono.k provides higher level time access
 */

#ifndef __CHRONO
#define __CHRONO 1
#include "sys/time.k"
#include "stddef.k"
#include "math.k"

typedef unsigned long clock_t;

struct tm{

    int tm_sec = 0;     /* seconds after the minute */
    int tm_min = 0;     /* minutes after the hour */
    int tm_hour = 0;    /* hours since midnight */
    int tm_mday = 0;    /* day of the month */
    int tm_mon = 0;     /* months since January */
    int tm_year = 0;    /* years since 1900 */
    int tm_wday = 0;    /* days since Sunday */
    int tm_yday = 0;    /* days since January 1st */
    int tm_isdst = 0;   /* Daylight savings time flag */
    /** 
    * tm_isdst > 0 if daylight savings else tm_isdst == 0. When no information
    * is available, tm_isdst < 0
    */
};



/**
 * Get number of clock ticks elapsed. Use clockdif() to determine the amount of time between two
 * calls to clock(). 
 * @warning the return value of the first call to clock() is undefined in the C standard
 * @returns number of clock ticks elapsed
 */
global clock_t clock()
{
	timespec ts;

	if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts))
    {
		return -1;
    }

	if (ts.tv_sec > LONG_MAX/1000000
	|| ts.tv_usec/1000 > LONG_MAX-1000000*ts.tv_sec)
    {
		return -1;
    }

	return ts.tv_sec*1000000 + ts.tv_usec/1000;
}

/**
 * Get the difference between two clock values in seconds as a double.
 */
#define clockdif(end, beginning) ((($double end-beginning)/CLOCKS_PER_SEC))

tm __tmbuf;
timezone_t __internaltime;

global tm* localtime(time_t timer){
    tm* timedest = &__tmbuf;
    
    int seconds;
    timer = divmod(timer, 60, &seconds);

    timedest->tm_sec = seconds; 

    printf("%i\n", timedest->tm_sec);

    return timedest;
}


#endif