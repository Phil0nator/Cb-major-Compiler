#include "include/std.k"


function int main(int argc, char** argv){

    
    for(int i = 0 ; i < argc;i++){
        print(argv[i]);
    }

    double *bruhs = malloc(80);
    bruhs[0] = 2.5;
    bruhs[1] = sqrt(bruhs[0]);

    print(bruhs[0]);
    print(bruhs[1]);

    return 0;
}