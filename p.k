#include "include/std.k"

struct Test{
    int a;
    int b;
}


function int main(int argc, char** argv){

    Test *tester = malloc(Test);
    tester->a = 6;
    tester->b = 10;

    print(tester->a+tester->b);



    return 0;
}