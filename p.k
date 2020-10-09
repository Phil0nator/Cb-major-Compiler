#include "include/std.k"



function int main(int argc, char** argv){

    timezone_t test;
    test.tz_dsttime = DST_NONE;
    test.tz_minuteswest = 100;

    print(test.tz_dsttime);
    

    return 0;
}