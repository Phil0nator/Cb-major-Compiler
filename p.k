#include "include/std.k"


function int main(int argc, char** argv){

    for(int i = 0; i < 10; i++ ){
        for(int j = 0; j < 10; j++){
            print("Hello World!");
            printf("AT: %i, %i\n", i, j);
        }
    }

    return 0;
}