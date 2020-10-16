#include "include/std.k"




function int main(int argc, char** argv){

    int** datalayer = malloc(10*int);
    for(int i = 0 ; i  < 10;i+=1){
        datalayer[i] = malloc(10*int);
        for(int j = 0; j < 10; j+=1){
            datalayer[i][j] = j;
        }
    }
    

    for(int k = 0 ; k < 10; k+=1){
        print(datalayer[k], 10);
        free(datalayer[k]);
    }
    free(datalayer);

    return 0;
}