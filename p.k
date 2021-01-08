#define __CBLIB_SOURCE
#include "cblib.cb"



function int main(){
    //sockConfirm("127.0.0.1", 5501);
    //benchmark();
    
    
    return 0;
}


/*
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

/*
function void sockConfirm(char* ip, short port){

    int err;
    fd_t sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0){
        puts(strerror(err));
        printf(" %i", err);
        exit(1);
    }
    
    sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_port = hton16(port);
    inet_aton(ip, &addr.sin_addr);
    

    err = connect(sock, &addr, sizeof(sockaddr_in));
    
    
    if (err < 0){
        puts(strerror(err));
        printf(" %i", err);
        exit(1);
    }

    err = write(sock, "test123",7);
    if (err < 0){
        puts(strerror(err));
        printf(" %i", err);
        exit(1);
    }

    printf(" [ %i Bytes sent successfuly. ] \n", err);

}

*/