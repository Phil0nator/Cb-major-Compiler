#include "include/stddef.k"
#include "include/memory.k"
#include "include/printf.k"
#include "include/string.k"

struct Vec3i{
    int x;
    int y;
    int z;
    int padd;
}

function void Vec3i(Vec3i *this, int x, int y, int z){
    this->x = x;
    this->y = y;
    this->z = z;
}

function void print(Vec3i *this){

    printf("[ %i, %i, %i ]\n", this->x, this->y, this->z);

}



function int main(int argc, char** argv){

    int* arr1 = malloc(100*int);
    int* arr2 = malloc(100*int);
    int* arr3 = malloc(100*int);

    Vec3i test;
    Vec3i(&test, 1,2,3);

    for(int i = 0 ; i < 100; i++){
        arr1[i] = i;
        arr2[i] = i;
    }

    

    free(arr1);
    free(arr2);
    free(arr3);
    return 0;
}