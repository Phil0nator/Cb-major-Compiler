#define __CBLIB_SOURCE
#include "cblib.cb"

template <typename T>
struct unique_ptr{

    T* raw;

    unique_ptr(T* data){
        raw=data;
    }

    ~unique_ptr(){
        free(raw);
    }

};


int main(int argc){

    

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

