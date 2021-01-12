//#define __CBLIB_SOURCE
#include "cblib.cb"

#define CONSTANT 5

function void verify(int a){
    long b = CONSTANT;
    assert((a/CONSTANT == a/b));
    
}


function int main(int argc){
    //nc("127.0.0.1", 5501);
    for (int i = 1; i < INT_MAX; i++){
        //printf("%i, %i\n", i, i/CONSTANT);
        verify(i);
    }
    
    //benchmark();
    return 0;
}



/*
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
    for range(i, 25000000){
        sprintf(&nullb, "123hd0.5: \t %i%s%f", 123, "hd", 0.5f);
    }
    puts(&nullb);
    return 35f;
    
}


*/