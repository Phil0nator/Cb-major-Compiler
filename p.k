
#include "std.k"


function int main(int argc, char** argv){

    char* stuff = mlc(100);
    strcpy(stuff, "THINGS");
    printf(stuff);

    return 5;
}
