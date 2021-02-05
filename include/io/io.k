#ifndef __IO
#define __IO


#ifdef __LINUX
#define STDIN 0
#define STDOUT 1
#define STDERR 2
#define endl '\n'
#endif

#ifndef __LINUX
#ifndef __DARWIN
#error "Cb IO is only set up for linux / darwin at the moment."
#endif
#endif

#ifdef __DARWIN
#define STDIN 0
#define STDOUT 1
#define STDERR 2
#define endl '\n'
#endif







#endif