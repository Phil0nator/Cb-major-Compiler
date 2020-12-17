#define __CBLIB_SOURCE
#include "cblib.cb"

template<typename T>
struct Test{

    T* pointer;

};


int main(int argc){
    
    Test<double> test;
    printf("test123: %s%i\n", "test", 123);

    return 0;
}
