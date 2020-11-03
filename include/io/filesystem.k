
#ifndef __FSYSTEM
#define __FSYSTEM 1


#include "include/stddef.k"
#include "include/memory.k"
#include "sys/files.k"
#include "sys/stat.k"

typedef fd_t FILE;

#define _fopen_readonly 114
#define _fopen_writeonly 119
#define _fopen_append 97
#define _fopen_rw 157
#define _fopen_wc 162
#define _fopen_ac 140

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
    long modehash = mode[0]+mode[1];
    long m = DEFFILEMODE;
    long f = 0;

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
            //m = O_USRPERM;
            f = O_RDWR||O_CREAT||O_TRUNC;
            break;
        }
        case _fopen_ac{
            //m = O_USRPERM;
            f =  O_RDWR||O_APPEND||O_CREAT;
            break;
        }

    }

    FILE out = open(fname, f, m);
    if(modehash == _fopen_ac || modehash == _fopen_append){
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
    long l = strlen(text);
    long out = write(fd, text, l);
    return out;
}

/*
*   fgets will read the number of bytes specified by size_t amt into the buffer given,
*       and will lseek the file by an offset of amt.
*
*
*/

function long fgets(fd_t fd, char* buffer, size_t amt){
    long out = read(fd, buffer, amt);
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