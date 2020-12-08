#define __CBLIB_SOURCE
#include "cblib.cb"

template <typename T>
struct Test{

    T bruh;

};



int main(long argc, char** argv){
    printf("Hello World!\n");
    

    Test<Test<int> > test;
    test.bruh.bruh = 69;
    printf("%i\n", test.bruh.bruh);


    return 0;
}
