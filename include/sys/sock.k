#ifndef __SYSSOCK
#define __SYSSOCK 1

#include "files.k" // fd_t, read, write, etc...
#include "printf.k" // sscanf
#include "memory.k"  // malloc

typedef int in_addr;

struct sockaddr_in
{
    short                   sin_family; // e.g. AF_INET
    short                   sin_port;   // e.g. htons(3490)
    in_addr                 sin_addr;   //
    long                    sin_zero = 0;   // 

};

struct sockproto
{
    short data;
};

struct linger_t {

    int32 l_onoff;
    int32 l_linger;

};

#define SOCK_STREAM       1
#define SOCK_DGRAM        2
#define SOCK_RAW          3
#define SOCK_SEQPACKET    5

#define SO_DEBUG          0x0001
#define SO_ACCEPTCONN     0x0002
#define SO_REUSEADDR      0x0004
#define SO_KEEPALIVE      0x0008
#define SO_DONTROUTE      0x0010
#define SO_BROADCAST      0x0020
#define SO_USELOOPBACK    0x0040
#define SO_LINGER         0x0080
#define SO_OOBINLINE      0x0100

#define SO_SNDBUF         0x1001
#define SO_RCVBUF         0x1002
#define SO_SNDLOWAT       0x1003
#define SO_RCVLOWAT       0x1004
#define SO_SNDTIMEO       0x1005
#define SO_RECVTIMEO      0x1006
#define SO_ERROR          0x1007
#define SO_TYPE           0x1008

#define SOL_SOCKET        0xffff

#define AF_UNSPEC  0
#define AF_UNIX  1
#define AF_INET 2
#define AF_AX25 3
#define AF_IPX 4
#define AF_APPLETALK 5
#define AF_NETROM 6 
#define AF_BRIDGE 7 
#define AF_AAL5 8 
#define AF_X25 9 
#define AF_INET6 10 
#define AF_MAX   12 


#define NORMAL_SOCKET socket(AF_INET, SOCK_STREAM, 0)


inline bool isdigit(char c){
    return c >= '0' && c <= '9';
}


function int inet_aton(char* cp, in_addr* addr){

    char p[4];

    int parts = sscanf("%i.%i.%i.%i",cp, &p, &p+1, &p+2, &p+3);
    
    int a = p[0]&&0xff;
    int b = p[1]&&0xff;
    int c = p[2]&&0xff;
    int d = p[3]&&0xff;



    
    
    @addr = hton32( (d)||((a << 24) || (b << 16) || (c << 8)));
    
    return 1;


}




inline fd_t socket(int family, int type, int protocol){
    __asm{"
    mov rax, 41
    syscall
    "}
}
inline int connect(fd_t fd, sockaddr_in *uservaddr, int addrlen){
    __asm{"
    mov rax, 42
    syscall
    "}
}
inline int accept(fd_t fd, sockaddr_in*uservaddr, int addrlen){
    __asm{"
    mov rax, 43
    syscall
    "}
}
inline int bind(fd_t fd, sockaddr_in*umyaddr, int addrlen){
    __asm{"
    mov rax, 49
    syscall
    "}
}
inline int listen(fd_t fd, int backlog){
    __asm{"
    mov rax, 50
    syscall
    "}
}
inline int shutdown(fd_t sockfd, int how){
    __asm{"
    mov rax, 48
    syscall
    "}
}
inline int recvfrom(fd_t sockfd, char* buff, size_t len, int flags, sockaddr_in* addr, size_t addrsize){
    __asm{"
    mov rax, 45
    syscall
    "}
}

inline int sendto(fd_t fd, void* buff, size_t len, int flags, sockaddr_in* addr, size_t addrsize){
    __asm{"
    mov rax, 44
    syscall
    "}
}


function int recv(fd_t sockfd, char* buff, size_t len, int flags){

    return recvfrom(sockfd, buff, len, flags, NULL, NULL);

}


function int send(fd_t sockfd, char* buff, size_t len, int flags){

    return sendto(sockfd, buff, len,flags, NULL, NULL);

}



#endif