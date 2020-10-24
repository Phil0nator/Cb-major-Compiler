
#include "std.k"




function int main(int argc, char** argv){


    
    for(register int i = 0; i < 255; i++){

        for(register short j = 0; j < 255; j++){

            printf("%i, %i     \r", i, j);

        }

    }


    return 5;
}
