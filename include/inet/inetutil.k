#ifndef __INETUTIL
#   error "inetutil.k should only be included through inetutil.cb"
#endif




int inet_aton(char* cp, in_addr* addr){

    char p[4];

    int parts = sscanf("%i.%i.%i.%i",cp, &p, &p+1, &p+2, &p+3);
    
    int a = p[0]&&0xff;
    int b = p[1]&&0xff;
    int c = p[2]&&0xff;
    int d = p[3]&&0xff;



    
    
    @addr = hton32( (d)||((a << 24) || (b << 16) || (c << 8)));
    
    return 1;


}



int recv(fd_t sockfd, char* buff, size_t len, int flags){

    return recvfrom(sockfd, buff, len, flags, NULL, NULL);

}


int send(fd_t sockfd, char* buff, size_t len, int flags){

    return sendto(sockfd, buff, len,flags, NULL, NULL);

}