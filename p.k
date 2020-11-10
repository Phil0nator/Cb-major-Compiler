#include "std.k"


function int main(long argc){
    

    int *a = new(int);
    @a = 4;
    
    printf("0x%x\n",a);

    return NULL;
}
