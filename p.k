#include "include/stddef.k"
#include "include/memory.k"
#include "include/printf.k"

struct Alex{

    int age;
    bool stupid;

};


function int main(int argc, char** argv){

    Alex* dumb = malloc(10*Alex);
    

    bool isdumb = dumb[0].stupid;

    return 0;
}