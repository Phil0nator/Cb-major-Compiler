//#define __CBLIB_SOURCE
#include "cblib.cb"





int main(long argc, char** argv){
    printf("Hello World!\n");
    

    register auto test = sqrt(2.0);
    printf("%d\n", test);

    long wrong = static_cast<long, double>(test);
    printf("%d\n", wrong);


    return 0;
}
