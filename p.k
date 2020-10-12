#include "include/std.k"

function int main(int argc, char** argv){
    int count = 40000000;
    srand();
    
    int* data = malloc(count*int);
    int* data2 = malloc(count*int);
    int* final = malloc(count*int);
    for(int i = 0 ; i < count; i ++){
        data[i] = i;
        data2[i] = i;
    }

    for(int i =0;i<count;i++){

        final[i] = data[i]+data2[i];

    }

    /*print(final, count);
    free(data);
    free(data2);
    free(final);*/
    return 0;
}