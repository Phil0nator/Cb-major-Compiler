#include "std.k"

function int main(long argc){
    tm* time = localtime(time(NULL));
    printf("TIME: %i s\n", time->tm_sec);

    return NULL;
}
