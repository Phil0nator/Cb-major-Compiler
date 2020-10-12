#include "include/std.k"


function int main(int argc, char** argv){
    srand();
    int* data = malloc(100*int);
    int* data2 = malloc(100*int);
    int* data3 = malloc(100*int);
    int* final = malloc(100*int);
    for(int i = 0 ; i < 100; i ++){
        data[i] = i;
        data2[i] = i;
        data3[i] = i%10;
    }

    for(int i =0;i<100;i=i+4){

        __simd 4 int (data, i) {(+, data2, i)( + , data3, i)} (final, i);

    }

    print(final, 100);
    free(data);
    free(data2);
    free(data3);
    free(final);
    return 0;
}