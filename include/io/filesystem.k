/**
 * filesystem.k provides higher level file access.
 */
#ifndef __FSYSTEM
#define __FSYSTEM 1


#include "include/stddef.k"
#include "include/memory.k"
#include "sys/files.k"
#include "sys/stat.k"


typedef unsigned long FILE;

#define _fopen_readonly 114
#define _fopen_writeonly 119
#define _fopen_append 97
#define _fopen_rw 157
#define _fopen_wc 162
#define _fopen_ac 140

/**
 *   fopen will open a file of name fname with the given mode and return a file descriptor.
 *       Mode can be one of the following cstrings:
 *           -"r": open for read only
 *           -"w": open for write only
 *           -"a": open for appending write
 *           -"r+": open for read or write
 *           -"w+": open for read/write and create the file if it doesn't yet exist
 *           -"a+": open for read/append and create the file if it doesn't yet exist
 *       fopen will return a negative integer if the open failed.
 * @param fname filepath
 * @param mode the open-mode specifier
 * @returns A file descriptor to the requested file, or the error code
 *                  produced in trying to access it.
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
            f = O_RDWR||O_CREAT||O_TRUNC;
            break;
        }
        case _fopen_ac{
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


/**
 *
 *   fputs will directly write the cstring given by text to the file given by fd
 *       and will lseek the file to the correct offset.
 * @param fd file descriptor
 * @param text data to write
 * @returns number of bytes written
 */


function int fputs(FILE fd, char* text){
    long l = strlen(text);
    long out = write(fd, text, l);
    return out;
}

/**
 * fgets will read the requested number of bytes from a file descriptor into a buffer.
 * @param fd file descriptor
 * @param buffer a buffer for the data to be written to
 * @param amt number of bytes
 * @returns number of bytes read
 */

function long fgets(FILE fd, char* buffer, size_t amt){
    long out = read(fd, buffer, amt);
    return out;
}

/**
 * floads will load an entire file into a char buffer, which is dynamically allocated. 
 * The caller is responsible for freeing the returned buffer.
 * @param fd the file to load from
 * @returns a char buffer containing the file data, or an error code.
 */
function void* floads(FILE fd){

    int fsize = lseek(fd, 0, SEEK_END);
    lseek(fd, 0-fsize, SEEK_END);
    char* buffer = malloc(fsize);
    size_t out = read(fd,buffer,fsize);
    if(out < 0){
        return out;
    }
    return buffer;
}



#endif