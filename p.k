#include "include/stddef.k"
#include "include/memory.k"
#include "include/printf.k"
#include "include/string.k"


function int main(int argc, char** argv){

    int* arr1 = malloc(100*int);
    int* arr2 = malloc(100*int);
    int* arr3 = malloc(100*int);

    for(int i = 0 ; i < 100; i++){
        arr1[i] = i;
        arr2[i] = i;
    }


    for(int i = 0 ; i < 100;i=i+4){

        __simd 4 int (arr1, i) { 
        
        (+, arr2, i) 

        } (arr3, i);


    }



    print(arr3, 100);


    free(arr1);
    free(arr2);
    free(arr3);
    return 0;
}