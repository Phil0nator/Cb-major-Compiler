
typedef fd_t FILE;

const int _fopen_readonly = 114;
const int _fopen_writeonly = 119;
const int _fopen_append = 97;
const int _fopen_rw = 157;
const int _fopen_wc = 162;
const int _fopen_ac = 140;

function FILE fopen(char* fname, char* mode){
    int modehash = mode[0]+mode[1];
    int m;
    int f;

    if(modehash == _fopen_readonly){
        m = O_RDONLY;
        f = 0;
    }else if(modehash == _fopen_writeonly){
        m = O_WRONLY;
        f = 0;
    }else if (modehash == _fopen_append){
        m = O_WRONLY;
        f = O_APPEND;
    }else if (modehash == _fopen_rw){
        m = O_RDWR;
        f = 0;
    }else if (modehash == _fopen_wc){
        m = O_RDWR;
        f = O_CREAT;
    }else{
        m = O_RDWR;
        f = O_CREAT||O_APPEND;
    }

    print(m);
    print(f);


}