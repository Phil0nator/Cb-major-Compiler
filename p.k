
#include "std.k"


function bool isPrime(unsigned int x){

    if ( x%2 == 0) { return false;} 

    int maxsmall = sqrt(x);

    for (int i = 3; i < maxsmall; i+=1){

        if( x % i == 0 ){ return false; }

    }

    return true;


}


function int main(int argc, char** argv){

    char* fmt = "The int: %i , the double: %f, a string: %s, and a bool %b.";


    /*
    for (int num = 1; num < 100; num+=1){
        bool q =  isPrime(num);
        printf("Prime for %u = %b\n",num,q);
    }
    */




    int b = isPrime(1);



    printf("%i\n", b);
    





    return;
}
