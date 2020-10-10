#include "include/stddef.k"
#include "include/memory.k"
#include "include/printf.k"
#include "include/string.k"


function int main(int argc, char** argv){

    int* arr1 = malloc(4*int);
    int* arr2 = malloc(4*int);
    int* arr3 = malloc(4*int);

    arr1[0] = 1;
    arr1[1] = 2;
    arr1[2] = 3;
    arr1[3] = 4;

    arr2[0] = 1;
    arr2[1] = 2;
    arr2[2] = 3;
    arr2[3] = 4;



    __simd 4 int (arr1, 0) { 
        
        (+, arr2, 0) 

    } (arr3, 0);

    print(arr3, 4);


    free(arr1);
    free(arr2);
    free(arr3);
    return 0;
}