
#include "std.k"


function bool isPrime(unsigned int x){

    if ( x%2 == 0) { return false;} 

    int maxsmall = sqrt(x);

    for (int i = 3; i <= maxsmall; i+=2){

        if( x % i == 0 ){ return false; }

    }

    return true;


}



function int main(int argc, char** argv){

    register int a = 26;

    register float b = 5.335745;

    switch( argc ){



        case 1{
            printf("%d\n",b);
            break;
        }

    }





    return 5;
}
