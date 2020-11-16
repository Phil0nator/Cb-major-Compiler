#include "std.k"



int main(long argc, char** argv){

    do {
    
    
    
    char* test = mlc(100);
    strcpy(test, "This is a test.\n");
    printf(test);

    char* test2 = mlc(100);
    strcpy(test2, "This is test #2.\n");
    printf(test2);
    
    
    fr(test);
    fr(test2);



    } while(1);


    return 0;
}
