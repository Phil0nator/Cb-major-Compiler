/**
 * sock.k contains low level system socket access.
 */
#ifndef __SYSSOCK
#define __SYSSOCK 1

#include "files.k" // fd_t, read, write, etc...
#include "sscanf.cb" // sscanf
#include "memory.k"  // malloc

/** 32bit ip address type */
typedef int in_addr;

struct sockaddr_in
{
    short                   sin_family;     // e.g. AF_INET
    short                   sin_port;       // e.g. htons(3490)
    in_addr                 sin_addr;       // address (big endian 32 bit)
    long                    sin_zero = 0;   // 

};

struct sockaddr_un{
    short sun_family;
    char sun_path[108];
};



struct sockproto
{
    short data;
};

struct linger_t {

    int32 l_onoff;
    int32 l_linger;

};

/* socket types */
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

/* macro for most common use */
#define NORMAL_SOCKET socket(AF_INET, SOCK_STREAM, 0)

/**
 * isdigit returns if c is between '0' and '9'.
 * @param c char
 * @returns if c is a decimal number
 */
inline bool isdigit(char c){
    return c >= '0' && c <= '9';
}

/**
 * inet_aton will convert a normal cstring ip address e.g: "127.0.0.1"
 * into a properly formatted in_addr (big endian 32 bit).
 * @param cp ip address
 * @param in_addr destination for new 32 bit value
 * @returns 1
 * 
 */
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



/**
 * socket promts the os to create a socket based on parameters.
 * @param family socket family, e.g AF_INET
 * @param type socket type, e.g SOCK_STREAM
 * @param protocal (optional), e.g SO_LINGER
 * @returns a new socket file descriptor, or a negative error
 */
inline fd_t socket(int family, int type, int protocol){
    syscall(41)
}
/**
 * connect a socket held by fd to an address.
 * @param fd socket
 * @param uservaddr address to connect to
 * @param addrlen size of the structure used in uservaddr (simply use sizeof struct sockaddr_in)
 * @returns 0 on success, negative error on failure
 */
inline int connect(fd_t fd, sockaddr_in *uservaddr, int addrlen){
    syscall(42)
}
/**
 * Accept an incoming connection to socket fd.
 * @param fd socket 
 * @param uservaddr pointer to location to be filled with the incoming connection information
 * @param addrlen size of uservaddr
 * @returns a new file descriptor for a socket connected with the incoming connection
 */
inline int accept(fd_t fd, sockaddr_in*uservaddr, int addrlen){
    syscall(43)
}
/**
 * bind a socket to an address and port
 * @param fd socket
 * @param umyaddr address/port to bind to
 * @param addrlen sizeof umyaddr
 * @returns 0 on success, negative error
 */
inline int bind(fd_t fd, sockaddr_in*umyaddr, int addrlen){
    syscall(49)
}
/**
 * Set a socket to listen for incoming connections:
 * https://man7.org/linux/man-pages/man2/listen.2.html
 */
inline int listen(fd_t fd, int backlog){
    syscall(50)
}
/**
 * Shutdown socket sockfd with code how.
 * https://man7.org/linux/man-pages/man2/shutdown.2.html
 */
inline int shutdown(fd_t sockfd, int how){
    syscall(48)
}
/**
 * https://man7.org/linux/man-pages/man2/recvfrom.2.html
 */
inline int recvfrom(fd_t sockfd, char* buff, size_t len, int flags, sockaddr_in* addr, size_t addrsize){
    syscall(45)
}
/**
 * https://www.man7.org/linux/man-pages/man2/sendto.2.html
 */
inline int sendto(fd_t fd, void* buff, size_t len, int flags, sockaddr_in* addr, size_t addrsize){
    syscall(44)
}

/**
 * Attempt to recieve len bytes from sock into buff, using flags.
 * @param sockfd socket
 * @param buff buffer to write to
 * @param len bytes to recv
 * @param flags additional flags
 * @returns the number of bytes recieved / error code. 
 */
function int recv(fd_t sockfd, char* buff, size_t len, int flags){

    return recvfrom(sockfd, buff, len, flags, NULL, NULL);

}

/**
 * Attempt to send len bytes of buff to sockfd with flags
 * @param sockfd socket
 * @param buff buffer to read from
 * @param len bytes to send
 * @param flags additional flags
 * @returns bytes sent / error code
 */
function int send(fd_t sockfd, char* buff, size_t len, int flags){

    return sendto(sockfd, buff, len,flags, NULL, NULL);

}



#endif