#ifndef __MATH
#error "This file should only be included through math.cb"
#endif


long pow(long base, long exp){

  __asm{"
  
  mov rax, rdi
  dec rsi
  jz _int_pow_pintint_end
  _int_pow_pintint_flp:
  mul rdi
  dec rsi
  jnz _int_pow_pintint_flp
  _int_pow_pintint_end:
  "}


}

double pow(long base, long exp){

  pow(base, exp);
  __MATHBASE_CVTSI2SD;

}


double pow(double base, long exp){

  __asm{"
  
    
    dec rdi
    _double_pow_pdoubleint_flp:
    mulsd xmm0, xmm0
    dec rdi
    jnz _int_pow_pintint_flp
  
  
  "}

}



long floor(double x){
  return round(x-0.5);
}




long abs(long x){

  __asm{"
  
  mov rax, rdi
  sar rdi, 63
  xor rax, rdi
  sub rax, rdi
  
  "}

}


long ceil(double x){
  return 0-floor(0-x);
}



double abs(double x){

  __asm{"



  movq rax, xmm0
  shl rax, 1
  shr rax, 1
  movq xmm0, rax 


  "}

}


long log(long x){
  
  return log2(x) / M_LOG2_10;

}


long log(long base, long n){
  
  return log2(n) / log2(base);
  
}


long log2(long n){
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


double fmod(double x, double n){
  return (0-n)*(floor(x/n))+x;
}

long divmod(long dividend, long divisor, long* modulus ){

  __asm{"
  mov rbx, rdx
  xor rdx, rdx
  mov rax, rdi
  prefetchw [rbx]
  div rsi
  mov [rbx], rdx
  "}

}

long divmods(long dividend, long divisor, long* modulus){
  __asm{"
  mov rbx, rdx
  xor rdx, rdx
  mov rax, rdi
  prefetchw [rbx]
  idiv rsi
  mov [rbx], rdx
  "}
}