
#ifndef __BITS
#define __BITS 1

#include "stddef.k"

typedef unsigned int uint;
typedef unsigned short uint32;
#define DOUBLE_PRECISION_MULTIPLIER 100000000000000
#define FLOAT_PRECISION_MULTIPLIER 10000000
function int bitswap64(int x){
return  ((((x) && $uint 0xff00000000000000) >> 56)
   || (((x) && $uint 0x00ff000000000000) >> 40)
   || (((x) && $uint 0x0000ff0000000000) >> 24)
   || (((x) && $uint 0x000000ff00000000) >> 8)
   || (((x) && $uint 0x00000000ff000000) << 8)
   || (((x) && $uint 0x0000000000ff0000) << 24)
   || (((x) && $uint 0x000000000000ff00) << 40)
   || (((x) && $uint 0x00000000000000ff) << 56));
}

function uint32 bitswap32(uint32 x){
    return ((((x) && $uint32 0xff000000) >> 24) || (((x) && $uint32 0x00ff0000) >> 8)
    || (((x) && $uint32 0x0000ff00) << 8) || (((x) && $uint32 0x000000ff) << 24));
}


#endif