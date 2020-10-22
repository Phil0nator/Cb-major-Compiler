
#include "memory.k"
#include "io/io.k"
#include "io/sprintf.k"
#include "printf.k"

function int main(int argc, char** argv){

    char* fmt = "The int: %i, the other int: %i, a string: %s, and a bool %b. Also, a double %f";
    char* dest = malloc(1000);
    
    bool val = true;
    int second = -27;

    void* args = malloc(6*int);

    args[0] = argc;
    args[1] = second;
    args[2] = "abc";
    args[3] = val;
    args[4] = 2.45;


    __sprintf(dest, fmt, args);


    print(dest);


    return;
}
