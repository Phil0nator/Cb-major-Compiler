#include "std.k"

function void forfun(int c){
    printf("%i\n", c);
}
int* vec1 = {1,2,3,4};
int* vec2 = {5,6,7,8};
function int main(long argc){
    

    int* dest = newarray(int, 4);



    foreach(dest, 4, forfun)


    return NULL;
}
