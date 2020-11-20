#include "std.k"

size_t memrand(){
    return (rand() % 1000) + 43;
}

void fillblock(mblock* block, size_t i){
    block->size=i;
}


#define MAX 1000

int main(long argc, char** argv){



    char* c1 = malloc(206);
    char* c2 = malloc(58);


    strcpy(c1, "This should be fine         \n");
    strcpy(c2, "This is gud?\n");

    printf(c1);
    printf(c2);
    printstate();

    free(c2);
    free(c1);
    printstate();


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
