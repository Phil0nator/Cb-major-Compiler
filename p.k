#include "std.k"



mutex m = NULL;

function int test(long arg){
    
    mlock(&m);
    for(int i =0;i < 10; i++){

        printf("This is a testing thread. %i \n", i);
    }
    munlock(&m);
    return 0;
}


function int main(long argc){
    

    thread_t t1;
    thread_t t2;
    thread_create(&t1, test, 0);
    thread_join(&t1);
    thread_create(&t2, test, 0);

    thread_join(&t2);

    printf("Threads done!\n");


    return NULL;

}
