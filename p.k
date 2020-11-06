#include "std.k"


function int test(long arg){
    
    usleep(99999);
    for(int i =0;i < 10; i++){

        printf("This is a testing thread. %i \n", i);
    }
    return 0;
}


function int main(long argc){
    

    thread_t t = thread_create(test, 0);
    thread_join(t);
    printf("The thread has joined.\n");

    return NULL;

}
