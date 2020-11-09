#include "std.k"

function int main(long argc){
    tm* time = gmtime(time(NULL));
    printf("TIME: %i m\n", time->tm_mon);

    return NULL;
}
