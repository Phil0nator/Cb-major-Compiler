#include "include/std.k"



function int main(int argc, char** argv){



    int bruh = 256;

    if(bruh == 256){

        print("Hello World");

    }
    
    char * buffer = malloc(100*char);
    memcpy(buffer, "Stinky", 6);
    print(buffer);

    //this is a one line comment

    /*
    this is a multiline comment
    */


    return 0;
}