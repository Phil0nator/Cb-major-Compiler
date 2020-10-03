#include <stdio.h>
#include <unistd.h>
#include <memory.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <threads.h>

#ifndef __WIN32__

    #include <arpa/inet.h>

#endif

FILE *get_stdin(void) { return stdin; }
FILE *get_stdout(void) { return stdout; }

