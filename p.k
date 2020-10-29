
#include "std.k"


function int main(int argc, char** argv){

    char* stuff = mlc(100);
    strcpy(stuff, "THINGS\n");
    printf(stuff);
    fr(stuff);

    char* others = mlc(100);
    printf(others);


    return 5;
}
