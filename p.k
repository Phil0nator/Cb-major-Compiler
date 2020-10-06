#include "include/stddef.k"

function int bruh(){
    return 1;
}

function int main(int argc, char** argv){

    int test = (argc*32)/26.25;

    if(true){
        __asm{"PRINT_DEC 8, rax "}
    }


    return 0;
}