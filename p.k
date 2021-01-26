#define __CBLIB_SOURCE
#include "cblib.cb"


void printvec(vector<int> v){
    size_t size = v.size();
    puts("[");
    for(size_t i = 0; i < size-1; i++){
        printf("%i, ", v[i]);
    }
    printf("%i]\n", v.at(size-1));

}

#define TESTCONST (-7)



function int main(){
    



    vector<int> test;
    for range(i, 100){
        test.push_back((int) i);
    }

    printvec(test);

    nc("127.0.0.1", 5501);
    /*
    srand();
    long tmp = TESTCONST;
    for range(i, 1000000){
        long test = rand();
        if (test/TESTCONST != test/tmp){
            printf("Error: %l, bad: %l, correct: %l\n", test, test/TESTCONST, test/tmp);
            exit(1);
        }
    }
    puts("All good.");
    */
    return 0;
}




void nc(char* ip, short port){
    Socket sock;
    sock.init();
    int err = sock.connect(ip, port);
    
    if (err != 0){
        puts(strerror(err));
        exit(1);
    }

    
    char* buffer = mapalloc(1024);
    size_t bytes = 0;
    
    while (true){

        while( bytes == 0 ){
            bytes = sock.recv(buffer, 1024);
        }

        if (bytes < 0){
            puts("Lost connection to host.");
            return -1;
        }

        puts(buffer);
        memzer(buffer, bytes);
        bytes = 0;

    }


    mapfree(buffer);
    return 0;
}


float benchmark(){

    char nullb[1000];
    memzer(&nullb, 1000);
    for range(i, 250){
        sprintf(&nullb, "123hd0.5: \t %i%s%f", 123, "hd", 0.5f);
    }
    puts(&nullb);
    return 35f;
    
}


