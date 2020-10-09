#include "include/std.k"




function int main(int argc, char** argv){

    fd_t sock = socket(AF_INET, SOCK_STREAM, 0);
    
    print(get_inaddr("127.0.0.1"));


    return 0;
}