
#include "std.k"

struct Test{

    int a;
    Test* o;

};



function int main(int argc, char** argv){


    Test test;
    test.a = 26;

    printf("%i\n", test.a);

    test.o = malloc(Test);
    test.o->a = 28;

    printf("%i\n", test.o->a);

    test.o->o = malloc(Test);
    test.o->o->a = 30;

    printf("%i\n", test.o->o->a);



    return 5;
}
