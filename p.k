#include "std.k"

size_t memrand(){
    return (rand() % 1000) + 43;
}

void fillblock(mblock* block, size_t i){
    block->size=i;
}


#define MAX 1000

int main(long argc, char** argv){


    while(true){

        char* c1 = malloc(206);
        char* c2 = malloc(302);

        char* c3 = malloc(50);

        strcpy(c1, "This should be fine         \r");
        strcpy(c2, "This too should be fine     \r");
        strcpy(c3, "Why not this too...         \r");
        printf("%s%s%s",c1,c2,c3);

        free(c1);
        free(c3);
        free(c2);

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
