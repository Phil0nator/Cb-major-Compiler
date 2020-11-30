#include "std.k"


int main(long argc, char** argv){


    void* test = alloca(256);
    test[0] = 25;
    test[1] = 26;
    printf("%i\n", test[0]);
    printf("%i\n", test[0]);



    return 0;
}
