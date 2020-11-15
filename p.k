#include "std.k"


function void caller(void* func){
    func(5);
}



function int main(long argc, char** argv){

    caller(
        function int(int inp)
{
        printf("%i\n", inp);
}
    );

    return 0;
}
