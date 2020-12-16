#ifndef __CHRONO
#   error "chrono.k should always be included through chrono.cb"
#endif

/* locally used definitions */
tm __tmbuf;
timezone_t __internaltime;
int* mdays = {31,28,31,30,31,30,31,31,30,31,30,31};


/* Locally used definitions */
char** wday_name = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
char** mon_name = {
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
};
// buffer
char* asctime__result_buf = {' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', NULL};



clock_t clock()
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


tm* gmtime(time_t timer){
    tzset(); // POSIX standard 
    time_t ogt = timer;
    tm* tmd = &__tmbuf;

    int seconds;
    int minutes;
    int hours;
    int yday;
    int years;
    int wday;
    int month = 0;
    int mday = 0;


    seconds = timer%60;
    timer /= 60;
    minutes = timer % 60;
    timer /= 60;
    hours = timer%60;
    timer /= 60;
    //timer = divmod(timer, 60, &seconds);
    //timer = divmod(timer, 60, &minutes);
    //timer = divmod(timer, 24, &hours);
    
    yday  = ((ogt / 60) / 60) / 24;
    years = floor(yday / 365.25);
    yday = yday - floor((years*365.25));

    wday = (yday + 4) % 7;


    mday = yday;
    int mi;
    for(mi = 0 ; true; mi++){
        if(mday > mdays[mi]){
            mday = mday - mdays[mi];
        }else{
            break;
        }
    }

    month = mi++;

    tmd->tm_sec = seconds; 
    tmd->tm_min = minutes;
    tmd->tm_hour = hours;
    tmd->tm_yday = yday;
    tmd->tm_year = years+70; /* years since 1900, not 1970 */
    tmd->tm_wday = wday;
    tmd->tm_mday = mday;
    tmd->tm_mon = month;
    return tmd;
}



char* asctime(tm* timeptr){

    memset(asctime__result_buf, ' ', 28);
    strcpy(asctime__result_buf, wday_name[timeptr->tm_wday]);
    asctime__result_buf[3] = ' ';
    strcpy(asctime__result_buf+4, mon_name[timeptr->tm_mon]);
    asctime__result_buf[7] = ' ';
    sprintf(asctime__result_buf+7, "%i ", timeptr->tm_mday, NULL, NULL, NULL);
    sprintf(asctime__result_buf+10, "%i:%i:%i %i",timeptr->tm_hour,timeptr->tm_min, timeptr->tm_sec, 1900+(timeptr->tm_year));
    return asctime__result_buf;
}


tm* localtime(time_t timer){
    tzset(); // POSIX standard
    return gmtime(timer-timezone);


}

char* ctime(time_t timer){
    return asctime(localtime(timer));
}


void usleep(long nanoseconds){
    timeval_t req;
    req.tv_sec = 0;
    req.tv_usec = nanoseconds;
    nanosleep(&req, nullptr);
}