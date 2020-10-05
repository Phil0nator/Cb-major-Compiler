#include "include/std.k"

const double val = 2.5;




function int main(int argc, char** argv){


    char* test = "this is a test of the type casting";
    print(test);
    print($char @test);
    double b = 5.6;
    print($int b);
    int five = 5;
    print($double five);

    return 0;
}