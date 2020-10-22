
#include "memory.k"
#include "io/io.k"
#include "io/sprintf.k"
#include "printf.k"

function int main(int argc, char** argv){

    char* fmt = "The int: %i, the double: %f, a string: %s, and a bool %b.";
    char* dest = malloc(1000);
    
    bool val = true;
    int second = -27;

    void* args = malloc(6*int);

    args[0] = argc;
    args[1] = 2.45;
    args[2] = "abc";
    args[3] = val;


    int len = __sprintf(dest, fmt, args);
    print(len);
    print(dest);


    return;
}
