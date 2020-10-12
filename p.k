#include "include/std.k"


function int main(int argc, char** argv){

    String str;
    createString(&str, "This is a string. ");
    appendString(&str, "This has been appended. ");
    appendString(&str, "This too.");

    print(str.value);

    


    print((argc*64)/64);

    return 0;
}