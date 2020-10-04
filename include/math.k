/*
  * <math.k> includes some commonly used math functions and constants
*/

#define MAX_INT 9223372036854775807

const double EPSILON        = 1.192092896e-32;          /* smallest respresentable double value greater than 0  */
const double M_PI           = 3.14159265358979323846;   /* PI                                                   */
const double M_E            = 2.71828182845904523536;   /* e                                                    */
const double M_LOG2E        = 1.44269504088896340736;   /* log2(e)                                              */
const double M_LOG10E       = 0.434294481903251827651;  /* log10(e)                                             */
const double M_LN2          = 0.693147180559945309417;  /* ln(2)                                                */
const double M_PI_2         = 1.57079632679489661923;   /* PI/2                                                 */
const double M_PI_4         = 0.785398163397448309616;  /* PI/4                                                 */
const double M_1_PI         = 0.318309886183790671538;  /* 1/PI                                                 */
const double M_2_PI         = 0.636619772367581343076;  /* 2/PI                                                 */
const double M_2_SQRTPI     = 1.12837916709551257390;   /* 2 / sqrt( PI )                                       */
const double M_SQRT2        = 1.41421356237309504880;   /* sqrt( 2 )                                            */
const double M_SQRT1_2      = 0.707106781186547524401;  /* 1 / sqrt(2)                                          */




function double sqrt(double a){

    __asm{"
    
    sqrtsd xmm0, xmm0
    
    "}

}