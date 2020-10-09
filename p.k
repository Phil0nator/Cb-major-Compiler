#include "include/stddef.k"
#include "include/memory.k"
#include "include/printf.k"
#include "include/string.k"


function int main(int argc, char** argv){

    String str;
    createString(&str, "Test");
    appendString(&str, " things");

    print(str.value);


    freeString(&str);
    return 0;
}