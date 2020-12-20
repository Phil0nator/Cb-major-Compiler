#define __CBLIB_SOURCE
#include "cblib.cb"

template <typename T>
struct Twoer{

    T value;

    Twoer(T v){
        value = v;
    }

    function T operator+(T a){
        return value += a;
    }

    ~Twoer(){}


};


int main(int argc){

    Twoer<double> x(2.5);
    x+5;

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

