#include "std.k"


double testfn(long argc){
    double test = (argc-(argc++ / (argc++ * (argc+4))));
    return test;
}


int main(long argc, char** argv){
    printf("Test... %f\n", testfn(argc));
    printf("Val: %i\n", argc);

    return 0;
}
