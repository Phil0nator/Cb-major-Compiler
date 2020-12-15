//#define __CBLIB_SOURCE
#include "cblib.cb"


int* test(int* a){
    return a;
}


int main(int argc) {

    int number;
    printf("Enter: \n");
    scanf("%i", &number);
    test(&number);
    printf("%i\n", number);
    
}
