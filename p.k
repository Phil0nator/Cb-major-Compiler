#include "std.k"

function void test(void a){

    for(int i = 0 ; i < 100; i ++){
        printf("i: %i\n", i);
    }
    
    double x = 6*5;

}


function int main(long argc){
    thread_t t = thread(test, 1);
    thread_join(t);
}
