#include "std.k"


function int main(long argc){
    
    void* ptra = new(void);
    void* ptrb = new(int);

    int **a = ptra;
    @a = ptrb;

    printf("%i\n", @(@a));

    return NULL;
}
