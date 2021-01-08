#ifndef __SYSCALL
#define __SYSCALL

/*  OLD definition:
#define syscall(code) __asm{__STRINGIFY__(  \
mov rax, code"\n"                           \
mov r10, rcx"\n"                            \
syscall"\n"                                 \
"\n"                                        \
)}
*/

// new builtin
#define syscall(code)   __syscall(code)

#ifdef __LINUX
#   include "syscallspec/linux.k"
#endif
#ifdef __DARWIN
#   include "syscallspec/darwin.k"
#endif

#endif