#ifndef __SOCKET_CLASS
#   error "Socket.k should only be included through Socket.cb"
#endif

CBLIBENTRY err_t Socket::init(){
    sock = socket(AF_INET, SOCK_STREAM, 0);
    return sock;
}

CBLIBENTRY err_t Socket::init(int family, int type, int protocal){
    sock = socket(family,type,protocal);
    return sock;
}

CBLIBENTRY err_t Socket::connect(char* ip, int port){
    int err;
    sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_port = hton16((short) port);
    
    inet_aton(ip, &addr.sin_addr);
    
    err = connect(sock, &addr, sizeof(sockaddr_in));

    return err;

}

CBLIBENTRY ssize_t Socket::send(char* data){
    return fputs(sock, data);
}

CBLIBENTRY ssize_t Socket::send(char* data, size_t bytes){
    return write(sock, data, bytes);
}

CBLIBENTRY err_t Socket::close(){
    return shutdown(sock, 1);
}


CBLIBENTRY ssize_t Socket::recv(char* buffer, size_t bytes){
    return read(sock, buffer, bytes);
}