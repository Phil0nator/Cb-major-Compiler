#include "std.k"


function int main(){


     fd_t sock = NORMAL_SOCKET;

     printf("sock:%i\n",sock);

     sockaddr_in addr;
     addr.sin_family = AF_INET;
     inet_aton("127.0.0.1", &addr.sin_addr);
     addr.sin_port = hton16(5500);

     long err = connect(sock, &addr, sockaddr_in);
     printf("connect:%s\n",strerror(err));

     send(sock, "Hello World!", 10, NULL);

     shutdown(sock, 0);
     



}
