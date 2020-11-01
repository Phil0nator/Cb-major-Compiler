#include "std.k"




function int main(int argc, char** argv){

    fd_t sock = NORMAL_SOCKET;

    printf("sockfd: %i\n", sock);

    in_addr addr;
    int addrsuccess = inet_aton("68.123.14.86", &addr);

    printf("addr: %x\n", addr);

    sockaddr_in addrin;
    addrin.sin_family = AF_INET;
    addrin.sin_addr = addr;
    addrin.sin_port = hton16(2001);

    printf("sockarddr: %x, %x, %x, %x\n", addrin.sin_family&&0xffff, addrin.sin_addr, addrin.sin_port&&0xffff, addrin.sin_zero);


    long conn = connect(sock, &addrin, sockaddr_in);
    
    char* msg = "This is my message to you.\n";
    size_t msglen = strlen(msg);

    send(sock, msg, msglen, NULL);
    printf("sent\n");
    recv(sock, msg, msglen, NULL);

    shutdown(sock, 0);
    
    



}




