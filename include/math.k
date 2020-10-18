/*
  * <math.k> includes some commonly used math functions and constants
*/

#ifndef __MATH
#define __MATH 1



#define MAXUINT -1


#define EPSILON         1.192092896e-32          /* smallest respresentable double value greater than 0  */
#define M_PI            3.14159265358979323846   /* PI                                                   */
#define M_E             2.71828182845904523536   /* e                                                    */
#define M_LOG2E         1.44269504088896340736   /* log2(e)                                              */
#define M_LOG10E        0.434294481903251827651  /* log10(e)                                             */
#define M_LN2           0.693147180559945309417  /* ln(2)                                                */
#define M_PI_2          1.57079632679489661923   /* PI/2                                                 */
#define M_PI_4          0.785398163397448309616  /* PI/4                                                 */
#define M_1_PI          0.318309886183790671538  /* 1/PI                                                 */
#define M_2_PI          0.636619772367581343076  /* 2/PI                                                 */
#define M_2_SQRTPI      1.12837916709551257390   /* 2 / sqrt( PI )                                       */
#define M_SQRT2         1.41421356237309504880   /* sqrt( 2 )                                            */
#define M_SQRT1_2       0.707106781186547524401  /* 1 / sqrt(2)                                          */
#define M_MINZERO       -0.0                     /* double precision -0.0                                */
double M_MINZERO_MEM = M_MINZERO;


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
function double pow(double base, int exp){

  __asm{"
  
    
    dec rdi
    _double_pow_pdoubleint_flp:
    mulsd xmm0, xmm0
    dec rdi
    jnz _int_pow_pintint_flp
  
  
  "}

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
  movsd xmm2, [M_MINZERO_MEM]
  xorpd xmm1, xmm2
  andpd xmm0, xmm1
  "}

}



#endif