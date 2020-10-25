
#include "std.k"

function int call25times(void* fn, void arg1, void arg2){

    for(register int i =0; i < 25; i++){
        fn(arg1, arg2);
    }

    return 0;

}

function int main(int argc, char** argv){

    call25times(printf, "This is a thing %i\n", argc);

    return 5;
}
