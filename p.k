//#define __CBLIB_SOURCE
#include "cblib.cb"

template<typename T>
struct Test{

    T inner;

};

Test<int>* bruh(int a){
    Test<int> test;
    test.inner = a;
    return &test;
}

Test<double>* bruh(double a){
    Test<double> test;
    test.inner=a;
    return &test;
}


int main(int argc, char** argv){
    printf("Hello World!\n");
    
    Test<double>* test = bruh(2.0);
    


    return 0;
}
