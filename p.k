#include "cblib.cb"


template <typename T>
struct pointer{

    T* raw;

    pointer(T* initializer){raw = initializer;}
    ~pointer(){free(raw);}
    function T* operator ->(){return raw;}
    function T* operator =(T* initializer){return raw = initializer;}
    function T* operator @(){return raw;}
};

function int test(pointer<int> p){
    return @p;
}


function int main(){

    pointer<int> p = newarray(int, 256);
    int at = test(p);
    return at;
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
    for range(i, 250){
        sprintf(&nullb, "123hd0.5: \t %i%s%f", 123, "hd", 0.5f);
    }
    puts(&nullb);
    return 35f;
    
}


*/