#include "include/stddef.k"
typedef unsigned int fd_t;  /* file descriptor datatype */
typedef int mode_t;

/* open flags */
const int O_RDONLY      = 0x0000;    /* open for read only  */
const int O_WRONLY      = 0x0001;    /* open for write only */
const int O_RDWR        = 0x0002;    /* open for reading and writing */
const int O_ACCMODE     = 0x0003;    /* mask for above codes */

/* Kernel encoding of open mode */
const int FREAD         = 0x0001;
const int FWRITE        = 0x0002;
const int O_NONBLOCK    = 0x0004;
const int O_APPEND      = 0x0008;
const int O_SHLOCK      = 0x0010;
const int O_EXLOCK      = 0x0020;
const int O_ASYNC       = 0x0040;
const int O_FSYNC       = 0x0080;

const int O_CREAT       = 0x0200;
const int O_TRUNC       = 0x0400;
const int O_EXCL        = 0x0800;







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