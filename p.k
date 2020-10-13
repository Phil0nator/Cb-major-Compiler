#include "include/std.k"

function int main(int argc, char** argv){
    srand();
    
    String sa("This is a mf string");
    print(find(&sa, " is"));

    return 0;
}