
#include "std.k"


function int main(int argc, char** argv){

    char num[8];
    memset(&num, 0, 8);
    toStr(125, &num);
    print(&num);


    return;
}
