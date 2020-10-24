
#include "std.k"




function int main(int argc, char** argv){


    
    for(register char i = 0; i < 255; i++){

        for(register char j = 0; j < 255; j++){

            printf("%i, %i, %i     \r", i, j, i*j);

        }

    }


    return 5;
}
