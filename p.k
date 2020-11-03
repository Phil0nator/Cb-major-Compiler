#include "std.k"

function void test(void arg){

    printf("This was a test.");

}


function int main(){
     
    thread_t t = thread(test, 1);

}
