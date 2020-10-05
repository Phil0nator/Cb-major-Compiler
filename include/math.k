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
const double M_MINZERO      = -0.0;                     /* double precision -0.0                                */



function double sqrt(double a){

    __asm{"
    
    sqrtsd xmm0, xmm0
    
    "}

}

function double sqrt(int a){

  __asm{"
  
    cvtsi2sd xmm0, rdi
    sqrtsd xmm0, xmm0
  
  "}


}

function int sqrt(int a){

  __asm{"
  
  cvtsi2sd xmm0, rdi
  sqrtsd xmm0, xmm0
  cvttsd2si rax, xmm0
  
  
  "}


}

function int pow(int base, int exp){

  __asm{"
  
  mov rax, rdi
  dec rsi
  _int_pow_pintint_flp:
  mul rdi
  dec rsi
  jnz _int_pow_pintint_flp

  "}


}

function double pow(int base, int exp){

  pow(base, exp);
  __asm{"cvtsi2sd xmm0, rax"}

}












function int round(double x){
  __asm{"cvtsd2si rax, xmm0"}
}
function int ceil(double x){
  __asm{"
  cvttsd2si rax, xmm0
  inc rax
  "}
}
function int floor(double x){
  __asm{"cvttsd2si rax, xmm0"}
}









function int abs(int x){

  __asm{"
  
  mov rax, rdi
  sar rdi, 63
  xor rax, rdi
  sub rax, rdi
  
  "}

}

function double abs(double x){

  __asm{"
  movsd xmm1, xmm0
  xorpd xmm1, [M_MINZERO]
  andpd xmm0, xmm1
  "}

}