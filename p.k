
#include "std.k"

function int test(){
    return 02342;
}


function int main(int argc, char** argv){

    print("Hellow");
    print(test());
    print(__TIME__);
    fd_t sock = NORMAL_SOCKET;
    if(sock < 0){
        print("Could not open socket");
    }



    in_addr test = 0;
    inet_aton("127.0.0.1",&test);
    
    
    sockaddr_in *addr = malloc(sockaddr_in);
    addr->sin_family =  AF_INET;
    addr->sin_port   =  3682;
    addr->sin_addr   =  test;
    addr->sin_zero   =  0;

    //int err = connect(sock, addr, sockaddr_in);
    //print(err);
    //if(err){
    //    print("Could not connect:");
    //}




    return;
}

