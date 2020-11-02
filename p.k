#include "std.k"


function int main(int argc, char** argv){

    system("python3 compile.py -i p.k -o test.bin -r -nasm -O3 -g");
    printf("This is after because it is blocking");

}




