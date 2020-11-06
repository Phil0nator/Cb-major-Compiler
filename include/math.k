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
#define M_LOG2_10       3
double M_MINZERO_MEM = M_MINZERO;


inline double sqrt(double a){

    __asm{"
    
    sqrtsd xmm0, xmm0
    
    "}

}

inline double sqrt(int a){

  __asm{"
  
    cvtsi2sd xmm0, rdi
    sqrtsd xmm0, xmm0
  
  "}


}

inline long sqrt(long a){

  __asm{"
  
  cvtsi2sd xmm0, rdi
  sqrtsd xmm0, xmm0
  cvttsd2si rax, xmm0
  
  
  "}


}



inline long pow(long base, long exp){

  __asm{"
  
  mov rax, rdi
  dec rsi
  jz %L_int_pow_pintint_end
  %L_int_pow_pintint_flp:
  mul rdi
  dec rsi
  jnz %L_int_pow_pintint_flp
  %L_int_pow_pintint_end:
  "}


}

inline double pow(long base, long exp){

  pow(base, exp);
  __asm{"cvtsi2sd xmm0, rax"}

}
inline double pow(double base, long exp){

  __asm{"
  
    
    dec rdi
    %L_double_pow_pdoubleint_flp:
    mulsd xmm0, xmm0
    dec rdi
    jnz %L_int_pow_pintint_flp
  
  
  "}

}



inline long round(double x){
  __asm{"cvtsd2si rax, xmm0"}
}


inline long ceil(double x){
  return 0-floor(0-x);
}


inline long trunc(double x){
  __asm{"cvttsd2si rax, xmm0"}
}

inline long floor(double x){
  return round(x-0.5);
}


inline long abs(long x){

  __asm{"
  
  mov rax, rdi
  sar rdi, 63
  xor rax, rdi
  sub rax, rdi
  
  "}

}


inline double abs(double x){

  __asm{"


  movq rax, xmm0
  shl rax, 1
  shr rax, 1
  movq xmm0, rax 


  "}

}



inline long log(long x){
  
  return log2(x) / M_LOG2_10;

}

inline long log(long base, long n){
  
  return log2(n) / log2(base);
  
}

inline long log2(long n){
  __asm{"
  
  xor rax, rax
  %L_long_lop2_plong_flp:
  sar rdi, 1
  inc rax
  test rdi, rdi
  jnz %L_long_lop2_plong_flp
  dec rax
  "}
}


inline double fmod(double x, double n){
  return (0-n)*(floor(x/n))+x;
}




inline long divmod(long dividend, long divisor, long* modulus ){

  __asm{"
  mov rbx, rdx
  xor rdx, rdx
  mov rax, rdi
  div rsi
  mov [rbx], rdx
  "}

}


#endif