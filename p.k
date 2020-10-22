
#include "std.k"

function int main(int argc, char** argv){

    char* fmt = "The int: %i , the double: %f, a string: %s, and a bool %b.";

    printf("Hello World!\n");
    int a = getInt("Number? :");
    printf("%i\n",a);

    return;
}
