#include "include/std.k"



function int main(int argc, char** argv){


    int* aptr = &argc;
    print("test");
    print(@aptr+2);
    print("after");
    


    return 0;
}