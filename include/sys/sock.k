#ifndef __SYSSOCK
#define __SYSSOCK 1

#include "files.k" // fd_t, read, write, etc...
#include "printf.k" // sscanf
#include "memory.k"  // malloc

typedef unsigned int32 in_addr;

struct sockaddr_in
{
    small               sin_family; // e.g. AF_INET
    unsigned small      sin_port;   // e.g. htons(3490)
    in_addr             sin_addr;   //
    int                 sin_zero;   // 

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


function bool isdigit(char c){
    return c >= '0' && c <= '9';
}

function int inet_aton(char* cp, in_addr *addr){

    in_addr val;
    int base = 10;
    int n;
    char c;
    unsigned int parts[4];
    memset(&parts, 0, 4);
    unsigned int *pp = &parts;
    c = @cp;

    while(true){
        val = 0;
        while (true){
            if(isdigit(c)){
                val = (val*base)+(c-'0');
                cp+=1;
                c = @cp;
            }else{
                break;
            }
            
        }
        if(c == '.'){
            if(pp > (parts+4*int)){
                return 0;
            }
            @pp = val;
            pp+=int;
            cp+=1;
            c = @cp;
        }else{
            break;
        }
    }
    @pp = val;

    if(c != 0 && c != ' '){
        return 0;
    }


    

    val = val || ((parts[0] << 24) || (parts[1] << 16) || (parts[2] << 8));
    @addr = val;
    return 1;

}




function fd_t socket(int family, int type, int protocol){
    __asm{"
    mov rax, 41
    syscall
    "}
}
function int connect(fd_t fd, sockaddr_in *uservaddr, int addrlen){
    __asm{"
    mov rax, 42
    syscall
    "}
}
function int accept(fd_t fd, sockaddr_in*uservaddr, int addrlen){
    __asm{"
    mov rax, 43
    syscall
    "}
}
function int bind(fd_t fd, sockaddr_in*umyaddr, int addrlen){
    __asm{"
    mov rax, 49
    syscall
    "}
}
function int listen(fd_t fd, int backlog){
    __asm{"
    mov rax, 50
    syscall
    "}
}
function int shutdown(fd_t sockfd, int how){
    __asm{"
    mov rax, 48
    syscall
    "}
}


#endif