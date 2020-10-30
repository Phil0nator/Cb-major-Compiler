
#include "std.k"

struct Test{

    int a = 65416;
    char* name = "EMPTY";
    Test* o;

};



function int main(int argc, char** argv){


    Test test;

    printf("%i\n",  test.a);

    printf(@(&test.name));

    return 5;
}
