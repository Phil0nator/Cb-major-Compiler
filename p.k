#include "include/std.k"



function void test(int* value){
    @value = 26;
}


function int main(int argc, char** argv){

    int something=35;
    test(&something);
    print(something);


    return 0;
}