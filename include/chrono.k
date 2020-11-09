/**
 * chrono.k provides higher level time access
 */

#ifndef __CHRONO
#define __CHRONO 1
#include "sys/time.k"
#include "stddef.k"

typedef unsigned long clock_t;


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
#endif