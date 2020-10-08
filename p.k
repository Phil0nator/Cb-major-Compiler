#include "include/std.k"



function int main(int argc, char** argv){

    bool a = $bool argc;
    argc = $int a;
    
    double ab = $double argc;

    float bruh = 2.25+$double argc;

    print($float argc-5);


    return 0;
}