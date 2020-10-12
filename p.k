#include "include/std.k"



function int main(int argc, char** argv){

    String str;
    createString(&str, "Smellyman");
    print(str.value);

    return 0;
}