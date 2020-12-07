#define __CBLIB_SOURCE
#include "cblib.cb"

template<typename T>
struct Test{

    T* a;
    int b;
    T c;
    

    function T* getA(){
        return this->a;
    }

};



int main(long argc, char** argv){
    printf("Hello World!\n");
    
    Test<double> test;

    Test<double> t2;


    return 0;
}
