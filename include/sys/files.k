
#ifndef __SYSFILE
#define __SYSFILE 1



#include "include/stddef.k"
typedef unsigned int fd_t;  /* file descriptor datatype */
typedef int mode_t;

/* open flags */
#define O_RDONLY       0x0000    /* open for read only  */
#define O_WRONLY       0x0001    /* open for write only */
#define O_RDWR         0x0002    /* open for reading and writing */
#define O_ACCMODE      0x0003    /* mask for above codes */

/* Kernel encoding of open mode */
#define FREAD          0x0001
#define FWRITE         0x0002
#define O_NONBLOCK     0x0004
#define O_APPEND       0x0008
#define O_SHLOCK       0x0010
#define O_EXLOCK       0x0020
#define O_ASYNC        0x0040
#define O_FSYNC        0x0080

#define O_CREAT        0x0040
#define O_TRUNC        0x0200
#define O_EXCL         0x0800


#define O_USRPERM      0x00700

#define WMODE_WRITE    0
#define WMODE_APPEND   1024
#define WMODE_WPLUS    65
#define WMODE_WPLUSA   1089


#define SEEK_END       2
#define SEEK_CUR       1
#define SEEK_SET       0



function ssize_t read(fd_t fd, char* buf, size_t count){
    __asm{"
    xor rax, rax
    syscall
    "}
}
function ssize_t write(fd_t fd, char* buf, size_t count){
    __asm{"
        mov rax, 1
        syscall"
    }
}
function fd_t open(char *fname, int flags, mode_t mode){
    __asm{"
        mov rax, 2
        syscall
    "}
}
function int close(fd_t fd){
    __asm{"
    mov rax, 3
    syscall
    "}
}
function int mkdir(char* pathname, mode_t mode){
    __asm{"
    mov rax, 83
    syscall
    "}
}
function int rmdir(char* pathname){
    __asm{"
    mov rax, 84
    syscall
    "}
}
function int creat(char* pathname, mode_t mode){
    __asm{"
    mov rax, 85
    syscall
    "}
}
function int chdir(char* pathname){
    __asm{"
    mov rax, 80
    syscall
    "}
}
function int lseek(fd_t fd, int offset, int whence){
    __asm{"
    mov rax, 8
    syscall
    "
    }
}


#endif