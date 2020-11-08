/**
 * files.k provides low-level access to files and file descriptors.
 */
#ifndef __SYSFILE
#define __SYSFILE 1



#include "stddef.k"
typedef unsigned long fd_t;  /* file descriptor datatype */
typedef long mode_t;         /* file openmode datatype   */

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


/**
 * read count bytes from file fd into buf.
 * @param fd file descriptor
 * @param buf char buffer
 * @param count bytes to read
 * @returns number of bytes read
 */
inline ssize_t read(fd_t fd, char* buf, size_t count){
    __asm{"
    xor rax, rax
    syscall
    "}
}
/**
 * write count bytes from buf into file fd.
 * @param fd file descriptor
 * @param buf source of data
 * @param count number of bytes to write
 * @returns number of bytes written
 */
inline ssize_t write(fd_t fd, char* buf, size_t count){
    __asm{"
        mov rax, 1
        syscall"
    }
}
/**
 * open a file at path fname with flags/mode.
 * @param fname file path (relative or absolute)
 * @param flags valid open flags: https://man7.org/linux/man-pages/man2/open.2.html
 * @param mode value open mode:   https://man7.org/linux/man-pages/man2/open.2.html
 * @returns the new file descriptor, or an error code if unsuccessful.
 */
inline fd_t open(char *fname, int flags, mode_t mode){
    __asm{"
        mov rax, 2
        syscall
    "}
}
/**
 * Close a file.
 * @param fd file to close
 * @returns success / or error code
 */
inline int close(fd_t fd){
    __asm{"
    mov rax, 3
    syscall
    "}
}
/**
 * Create a new directory pathname with mode
 * @param pathname location+name of new directory
 * @param mode the access mode for the directory
 * @returns success / error code
 */
inline int mkdir(char* pathname, mode_t mode){
    __asm{"
    mov rax, 83
    syscall
    "}
}
/**
 * Remove a directory at pathname
 * @param pathname path to remove
 * @returns success / error code
 */
inline int rmdir(char* pathname){
    __asm{"
    mov rax, 84
    syscall
    "}
}
/**
 * Create a file pathname with mode
 * @param pathname path+name of file
 * @param mode access mode for new file
 * @returns success / error code
 */
inline int creat(char* pathname, mode_t mode){
    __asm{"
    mov rax, 85
    syscall
    "}
}
/**
 * Change the working directory of the program to pathname.
 * @param pathname path to new working directory
 * @returns success / error code
 */
inline int chdir(char* pathname){
    __asm{"
    mov rax, 80
    syscall
    "}
}
/**
 * seek the file offset for file fd by offset from whence.
 * whence can be:
 *  - SEEK_SET
 *      + set the file offset to offset
 *  - SEEK_CUR
 *      + change the file offset by offset
 *  - SEEK_END
 *      + sets the file offset to the end of the file, and offsets it by offset.
 * 
 * @param fd file
 * @param offset bytes of offset
 * @param whence Starting point
 */
inline int lseek(fd_t fd, int offset, int whence){
    __asm{"
    mov rax, 8
    syscall
    "
    }
}


#endif