//#define __CBLIB_SOURCE
#include "cblib.cb"


template<typename T>
struct Test{

    T a;
    
    function T getA(){
        return a;
    }

};




int main(int argc) {

    Test<double> t;
    t.a = 3;
    auto b = t.getA();
    printf("%s\n", typeid(b));
    printf("%f\n", t.a);
    
    
}
