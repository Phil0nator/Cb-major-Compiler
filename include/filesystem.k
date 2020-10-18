
#ifndef __FSYSTEM
#define __FSYSTEM 1


#include "include/stddef.k"
#include "include/memory.k"


typedef fd_t FILE;

#define _fopen_readonly 114;
#define _fopen_writeonly 119;
#define _fopen_append 97;
#define _fopen_rw 157;
#define _fopen_wc 162;
#define _fopen_ac 140;

/*
*   fopen will open a file of name fname with the given mode and return a file descriptor.
*       Mode can be one of the following cstrings:
*           -"r": open for read only
*           -"w": open for write only
*           -"a": open for appending write
*           -"r+": open for read or write
*           -"w+": open for read/write and create the file if it doesn't yet exist
*           -"a+": open for read/append and create the file if it doesn't yet exist
*       fopen will return a negative integer if the open failed.
*/

function FILE fopen(char* fname, char* mode){
    int modehash = mode[0]+mode[1];
    int m = 0;
    int f = 0;
    if(modehash == _fopen_readonly){
        f = O_RDONLY;

    }else if(modehash == _fopen_writeonly){
        f = O_WRONLY;

    }else if (modehash == _fopen_append){
        f = O_WRONLY||O_APPEND;
        
    }else if (modehash == _fopen_rw){
        f = O_RDWR;
    }else if (modehash == _fopen_wc){
        m = O_USRPERM;
        f = O_RDWR||O_CREAT;
    }else{
        m = O_USRPERM;
        f =  O_RDWR||O_APPEND||O_CREAT;
    }

    FILE out = open(fname, f, m);
    if(modehash == 140 || modehash == 87){
        lseek(out,0, SEEK_END);
    }
    return out;

}


/*
*
*   fputs will directly write the cstring given by text to the file given by fd
*       and will lseek the file to the correct offset.
*
*/


function int fputs(fd_t fd, char* text){
    int l = strlen(text);
    int out = write(fd, text, l);
    lseek(fd,l,SEEK_CUR);
    return out;
}

/*
*   fgets will read the number of bytes specified by size_t amt into the buffer given,
*       and will lseek the file by an offset of amt.
*
*
*/

function bool fgets(fd_t fd, char* buffer, size_t amt){
    bool out = read(fd, buffer, amt) > 0;
    lseek(fd, amt, SEEK_CUR);
    return out;
}


/*
*   floads will load an entire file into a buffer, and place the pointer in dest.
*   upon failure, floads will return true;
*   (The buffer created by floads must be freed using free() reguardless of success / failure)
*/

function void* floads(fd_t fd){

    int fsize = lseek(fd, 0, SEEK_END);
    lseek(fd, 0-fsize, SEEK_END);
    char* buffer = malloc(fsize);
    bool out = read(fd,buffer,fsize) < 0;
    if(out){
        return 0;
    }
    return buffer;
}



#endif