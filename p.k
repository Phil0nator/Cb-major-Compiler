#include "include/std.k"


function int main(int argc, char** argv){

    
    for(int i = 0 ; i < argc;i++){
        print(argv[i]);
    }

    double a = 2.5;
    double b = 2.5;
    bool e = a==b;

    print(e);

    print(a>=b);
    

    return 0;
}