/**
 * Limits provides information about the limits and properties of primitive types.
 */
#ifndef __LIMITS
#define __LIMITS 1

#define _SC_PAGESIZE 4096

#define SCHAR_MIN       (-128)
#define SCHAR_MAX       127

#define UCHAR_MAX       255

#define SHRT_MIN        (-32768)
#define SHRT_MAX        32767

#define USHRT_MAX       65535

#define INT_MAX         2147483647
#define INT_MIN         (0-INT_MAX-1)

#define UINT_MAX        4294967295

#define ULONG_MAX       18446744073709551615

#define LONG_MAX        9223372036854775807
#define LONG_MIN        (0-LONG_MAX-1)

#define sizeof(x) typeof(x)

#define QNAN             ($void 0x7FF8000000000001)
#define SNAN             ($void 0x7FF0000000000001)
#define NAN              ($void 0x7FFFFFFFFFFFFFFF)
#define INF              ($void 0x7FF0000000000000)
#define NINF             ($void 0xFFF0000000000000)



#define isNaN(x)        (($void x) == NAN)
#define isQNaN(x)       (($void x) == QNAN)
#define isSNaN(x)       (($void x) == SNAN)
#define signOf(x)       ($bool (($void x)>>(63)))

#endif