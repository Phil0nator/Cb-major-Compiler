
#include "std.k"

struct Test{

    int a = -1;
    char* name = "EMPTY";
    Test* o;

};



function int main(int argc, char** argv){


    Test test;

    printf("%x\n",  test.a);

    printf(@(&test.name));

    return 5;
}
