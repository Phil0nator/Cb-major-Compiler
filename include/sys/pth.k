#ifndef __PTH
#define __PTH 1

#include "stddef.k"
#include "filesystem.k"
#include "memory.k"
#include "string.k"
typedef long pid_t;

/* Cloning flags.  */
#define CSIGNAL                    0x000000ff /* Signal mask to be sent at exit.  */
#define CLONE_VM                   0x00000100 /* Set if VM shared between processes.  */
#define CLONE_FS                   0x00000200 /* Set if fs info shared between processes.  */
#define CLONE_FILES                0x00000400 /* Set if open files shared between processes.  */
#define CLONE_SIGHAND              0x00000800 /* Set if signal handlers shared.  */
#define CLONE_PTRACE               0x00002000 /* Set if tracing continues on the child.  */
#define CLONE_VFORK                0x00004000 /* Set if the parent wants the child to wake it up on mm_release.  */
#define CLONE_PARENT               0x00008000 /* Set if we want to have the same parent as the cloner.  */
#define CLONE_THREAD               0x00010000 /* Set to add to same thread group.  */
#define CLONE_NEWNS                0x00020000 /* Set to create new namespace.  */
#define CLONE_SYSVSEM              0x00040000 /* Set to shared SVID SEM_UNDO semantics.  */
#define CLONE_SETTLS               0x00080000 /* Set TLS info.  */
#define CLONE_PARENT_SETTID        0x00100000 /* Store TID in userlevel buffer before MM copy.  */
#define CLONE_CHILD_CLEARTID       0x00200000 /* Register exit futex and memory location to clear.  */
#define CLONE_DETACHED             0x00400000 /* Create clone detached.  */
#define CLONE_UNTRACED             0x00800000 /* Set if the tracing process can't force CLONE_PTRACE on this clone.  */
#define CLONE_CHILD_SETTID         0x01000000 /* Store TID in userlevel buffer in the child.  */
#define CLONE_NEWCGROUP            0x02000000        /* New cgroup namespace.  */
#define CLONE_NEWUTS               0x04000000        /* New utsname group.  */
#define CLONE_NEWIPC               0x08000000        /* New ipcs.  */
#define CLONE_NEWUSER              0x10000000        /* New user namespace.  */
#define CLONE_NEWPID               0x20000000        /* New pid namespace.  */
#define CLONE_NEWNET               0x40000000        /* New network namespace.  */
#define CLONE_IO                   0x80000000        /* Clone I/O context.  */



inline long fork(){
    __asm{"
    mov rax, 57
    syscall
    "}
}
inline long vfork(){
    __asm{"
    mov rax, 58
    syscall
    "}
}
inline long execve(char* pathname, char** args, char** env){
    __asm{"
    mov rax, 59
    syscall
    "}
}

inline long pause(){
    __asm{"
    mov rax, 34
    syscall
    "}
}

inline long waitpid(pid_t pid, int *wstatus, int options){

    __asm{"
    mov rax, 61
    xor r8, r8
    syscall
    "}

}

inline long clone(unsigned long clone_flags, unsigned long newsp, void* parent_tid, void* child_tid, unsigned int tid){
    __asm{"
    mov rax, 56
    mov r10, rcx
    syscall
    "}
}

inline void exit(long c){
    __asm{"
    mov rax,60
    syscall
    "}
}


inline long tgkill(pid_t tgid, pid_t pid, long sig){
    __asm{"
    mov rax, 234
    syscall
    "}
}

inline long gettid(){
    __asm{"
    mov rax, 186
    syscall
    "}
}

inline long getpid(){
    __asm{"
    mov rax, 39
    syscall
    "}
}
inline long wait4(pid_t upid, int*stat_addr, long options, void*ru){
    __asm{"
    mov rax, 61
    mov r10, rcx
    syscall
    "}
}


char* __systembashpath = "/bin/bash";

char** __emptyenv = {"PATH=/bin:/usr/bin:/sbin:/usr/sbin",nullptr};

global long execl(char* path, char** args){

    return execve(path,args,__emptyenv);

}

char** __systemcallargvconst = {"sudo", "-c", nullptr};

global long system(char* command){

    
    pid_t pid = fork();
    if(pid == 0 ){
        
        __systemcallargvconst[2] = command;

        
        long err = execl(__systembashpath, __systemcallargvconst);
        printf(strerror(err));
        
    } // if child, execute bash
    waitpid(pid, nullptr, nullptr);
    return 0;
}








#endif