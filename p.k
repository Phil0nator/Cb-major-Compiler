#define __CBLIB_SOURCE
#include "cblib.cb"



int main(int argc){
    


    int a = 123;
    printf("onetwothree %i\n", a);

    char* c = malloc(256);
    
    strcpy(c, "This is a string.\n");
    puts(c);
    free(c);


    /*
    char nullb[1000];
    memzer(&nullb, 1000);
    for range(i, 25000000){
        sprintf(&nullb, "123hd0.5: %i%s%f", 123, "hd", 0.5);
    }
    puts(&nullb);
    */



    return 0;
}
