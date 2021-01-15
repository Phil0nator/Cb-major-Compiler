#ifndef __FSYSTEM
#   error   "filesystem.k should only be included through filesystem.cb"
#endif



#define _fopen_readonly 114
#define _fopen_writeonly 119
#define _fopen_append 97
#define _fopen_rw 157
#define _fopen_wc 162
#define _fopen_ac 140


fd_t fopen(char* fname, char* mode){
    long modehash = mode[0]+mode[1];
    long m = DEFFILEMODE;
    int f = 0;

    switch(modehash){

        case _fopen_readonly{
            f = O_RDONLY;
            break;
        }
        case _fopen_writeonly{
            f = O_WRONLY || O_CREAT || O_TRUNC;
            break;
        }
        case _fopen_append{
            f = O_WRONLY||O_CREAT||O_APPEND;
            break;
        }
        case _fopen_rw{
            f = O_RDWR;
            break;
        }case _fopen_wc{
            f = O_RDWR||O_CREAT||O_TRUNC;
            break;
        }
        case _fopen_ac{
            f =  O_RDWR||O_APPEND||O_CREAT;
            break;
        }

    }

    fd_t out = open(fname, f, m);
    if(modehash == _fopen_ac || modehash == _fopen_append){
        lseek(out,0, SEEK_END);
    }
    return out;

}


size_t fputs(fd_t fd, char* text){
    size_t l = strlen(text);
    size_t out = write(fd, text, l);
    return out;
}

size_t puts(char* text){
    size_t l = strlen(text);
    size_t out = write(STDOUT, text, l);
    return out;
}

long fgets(fd_t fd, char* buffer, size_t amt){
    long out = read(fd, buffer, amt);
    return out;
}

void* floads(fd_t fd){

    int fsize = lseek(fd, 0, SEEK_END);
    lseek(fd, 0-fsize, SEEK_END);
    char* buffer = mapalloc((size_t) fsize);
    size_t out = read(fd,buffer,(size_t) fsize);
    if(out < 0){
        return out;
    }
    return buffer;
}