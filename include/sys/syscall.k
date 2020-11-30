#ifndef __SYSCALL
#define __SYSCALL


#define syscall(code) __asm{__STRINGIFY__(  \
mov rax, code"\n"                           \
mov r10, rcx"\n"                            \
syscall"\n"                                 \
"\n"                                        \
)}

#endif