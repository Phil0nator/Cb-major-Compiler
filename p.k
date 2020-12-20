#define __CBLIB_SOURCE
#include "cblib.cb"

template<typename T>
void print(T x){

    if(__isflt(T)){
        printf("%f\n", x);
    }else{
        printf("%l\n", x);
    }
}




int main(int argc){

    print<long>(2.5);
    //benchmark();
    return 0;
}




void benchmark(){

    
    char nullb[1000];
    memzer(&nullb, 1000);
    for range(i, 25000000){
        sprintf(&nullb, "123hd0.5: \t %i%s%f", 123, "hd", 0.5);
    }
    puts(&nullb);
    
}

