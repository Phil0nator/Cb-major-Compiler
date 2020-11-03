
#define SIGHUP   1
#define SIGINT   2
#define SIGQUIT   3
#define SIGILL   4
#define SIGTRAP   5
#define SIGABRT   6
#define SIGIOT   6
#define SIGBUS   7
#define SIGFPE   8
#define SIGKILL   9
#define SIGUSR1  10
#define SIGSEGV  11
#define SIGUSR2  12
#define SIGPIPE  13
#define SIGALRM  14
#define SIGTERM  15
#define SIGSTKFLT 16
#define SIGCHLD  17
#define SIGCONT  18
#define SIGSTOP  19
#define SIGTSTP  20
#define SIGTTIN  21
#define SIGTTOU  22
#define SIGURG  23
#define SIGXCPU  24
#define SIGXFSZ  25
#define SIGVTALRM 26
#define SIGPROF  27
#define SIGWINCH 28
#define SIGIO  29
#define SIGPOLL  SIGIO


/* Definitions of flag bits for `waitpid' et al.
   Copyright (C) 1992-2019 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.
   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.
   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */

/* Bits in the third argument to `waitpid'.  */
#define        WNOHANG                1        /* Don't block waiting.  */
#define        WUNTRACED        2        /* Report status of stopped children.  */
/* Bits in the fourth argument to `waitid'.  */
#define WSTOPPED        2        /* Report stopped child (same as WUNTRACED). */
#define WEXITED        4        /* Report dead child.  */
#define WCONTINUED        8        /* Report continued child.  */
#define WNOWAIT        0x01000000 /* Don't reap, just poll status.  */
#define __WNOTHREAD     0x20000000 /* Don't wait on children of other threads in this group */
#define __WALL                0x40000000 /* Wait for any child.  */
#define __WCLONE        0x80000000 /* Wait for cloned process.  */
