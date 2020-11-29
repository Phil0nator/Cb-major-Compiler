#ifndef __STD
#define __STD 1
#include "sys/syscall.k"            /* easy syscall macro */
#include "sys/errlist.k"            /* Error handling */
#include "bits/endian.k"            /* endian conversion */
#include "limits.k"                 /* limits of datatypes */
#include "stddef.k"                 /* commonly used definitions */
#include "functions/variardic.k"    /* used in variardic functions */
#include "memory.k"                 /* memory operations */
#include "io/printf.k"              /* output */
#include "math.k"                   /* math functions */
#include "random.k"                 /* fast psudo random number generator */

#include "algorithm/algorithm.k"    /* high level algorithm macros */

#include "assert/assert.k"          /* debug assertions */
#include "chrono.k"                 /* high level time operations */
#include "sys/files.k"              /* low level file interaction */
#include "sys/sock.k"               /* low level socket interaction */
#include "sys/pth.k"                /* low level thread interaction */

#include "structure/structure.ch"   /* standard data structures */

#include "string.k"                 /* high level string functions */
#include "io/input.k"               /* input functions */
#include "io/filesystem.k"          /* high level file interaction */

#include "sys/pth.k"                /* low level threading */
#include "threads/thread.k"         /* high level threading */


#endif