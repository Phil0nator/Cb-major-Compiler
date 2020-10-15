#include "include/sys/files.k" // fd_t, read, write, etc...

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

const int32 SOCK_STREAM      = 1;
const int32 SOCK_DGRAM       = 2;
const int32 SOCK_RAW         = 3;
const int32 SOCK_SEQPACKET   = 5;

const int32 SO_DEBUG         = 0x0001;
const int32 SO_ACCEPTCONN    = 0x0002;
const int32 SO_REUSEADDR     = 0x0004;
const int32 SO_KEEPALIVE     = 0x0008;
const int32 SO_DONTROUTE     = 0x0010;
const int32 SO_BROADCAST     = 0x0020;
const int32 SO_USELOOPBACK   = 0x0040;
const int32 SO_LINGER        = 0x0080;
const int32 SO_OOBINLINE     = 0x0100;

const int32 SO_SNDBUF        = 0x1001;
const int32 SO_RCVBUF        = 0x1002;
const int32 SO_SNDLOWAT      = 0x1003;
const int32 SO_RCVLOWAT      = 0x1004;
const int32 SO_SNDTIMEO      = 0x1005;
const int32 SO_RECVTIMEO     = 0x1006;
const int32 SO_ERROR         = 0x1007;
const int32 SO_TYPE          = 0x1008;

const int32 SOL_SOCKET       = 0xffff;

const char AF_UNSPEC = 0;
const char AF_UNIX = 1;
const char AF_INET=2;
const char AF_AX25=3;
const char AF_IPX=4;
const char AF_APPLETALK=5;
const char AF_NETROM=6; 
const char AF_BRIDGE=7; 
const char AF_AAL5=8; 
const char AF_X25=9; 
const char AF_INET6=10; 
const char AF_MAX = 12; 

function bool isdigit(char c){
    return c > '0' && c < '9';
}

function in_addr get_inaddr(char* address){

    char c;
    c = address[0];
    in_addr integer;
    int val;

    for(int j = 0; j < 4; j++){
        if(!isdigit(c)){
            val = (val*10)+(c-'0');
            c = @(address+1);
        }
        val=0;
        for(int i = 0;i<3;i++){
            if(isdigit(c)){
                val = (val*10)+(c-'0');
                c = @(address+1);
            }else{
                break;
            }
        }
        if(val<0||val>255){
            return 0;
        }
        if(c == '.'){
            integer=(integer<<8)|val;
            c = @(address+1);
        }else{
            if(j==3 && c == 0){
                integer = (integer<<8)||val;
                break;
            }
        }
        
    }
    if(c != 0){
        return 0;
    }
    return integer;
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