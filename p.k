//#define __CBLIB_SOURCE
#include "cblib.cb"



function int main(){


    puts("Hello World!");
    fflush();
    printf("Hello World!");

    return 0;
    //return benchmark();
}


/*
float benchmark(){

    char nullb[1000];
    memzer(&nullb, 1000);
    for range(i, 25000000){
        sprintf(&nullb, "123hd0.5: \t %i%s%f", 123, "hd", 0.5f);
    }
    puts(&nullb);
    return 35f;
    
}

*/