#define __CBLIB_SOURCE
#include "cblib.cb"

struct Test{
    long a;

    function int getA(){
        return this->a;
    }

};

int main(long argc, char** argv){

    Test *test = new(Test);
    test->a = 26;
    test->getA();

    return 0;
}
