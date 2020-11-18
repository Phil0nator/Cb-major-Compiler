#include "std.k"

size_t memrand(){
    return rand() % 1000;
}

void fillblock(mblock* block, size_t i){
    block->size=i;
}


#define MAX 1000

int main(long argc, char** argv){


    srand();
    for range(i, 50){
        char* test = malloc(memrand());
        free(test);
    }




    // void* testing_area = qmmap(10000);
    // for range(i, 50){
    //     fillblock(testing_area, i);
    //     add_block(testing_area);
    //     printstate();
        
    //     if(i%2==0){
    //         remove_block(testing_area);
    //     }
        
    //     testing_area += sizeof(mblock);
    // }

    return 0;
}
