#include "include/std.k"

struct Test{
    int a;
    int b;
}


function int main(int argc, char** argv){

    Test *tester = malloc(Test);
    tester->a = 6;
    tester->b = 10;

    Test test2;
    test2.a= 6;
    test2.b= 10;


    return 0;
}