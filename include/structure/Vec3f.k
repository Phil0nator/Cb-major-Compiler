#ifndef __VEC3F
#   error "Vec3f.k should only be included through Vec3f.cb"
#endif


/**
 * AVX flag optimized instructions:
 */
#define VEC3F_AVX_LOADYMM0 __asm{"vmovdqu ymm0, [rdi]"}
#define VEC3F_AVX_DEPOSITYMM1 __asm{"vmovdqu [rdi], ymm1"}


#define VEC3F_AVX_ADD   __asm{"vaddpd ymm1, ymm0, [rsi]"}
#define VEC3F_AVX_SUB   __asm{"vsubpd ymm1, ymm0, [rsi]"}
#define VEC3F_AVX_MUL   __asm{"vmulpd ymm1, ymm0, [rsi]"}
#define VEC3F_AVX_DIV   __asm{"vdivpd ymm1, ymm0, [rsi]"}


/**
 * AVX optimizations will only be used if available on the compiling CPU
 */
#ifdef __AVX

#   define VEC3F_LOAD VEC3F_AVX_LOADYMM0
#   define VEC3F_DEPOSIT VEC3F_AVX_DEPOSITYMM1
#   define VEC3F_ADD VEC3F_AVX_ADD
#   define VEC3F_SUB VEC3F_AVX_SUB
#   define VEC3F_MUL VEC3F_AVX_MUL
#   define VEC3F_DIV VEC3F_AVX_DIV

#endif
/**
 * For CPU's without AVX:
 */
#ifndef __AVX

#   define VEC3F_LOAD __asm{"                           \
                            movsd xmm0, [rdi]           \
                            movsd xmm1, [rdi+8]         \
                            movsd xmm2, [rdi+16]        \
                            "}

#   define VEC3F_DEPOSIT __asm{"                    \
                            movsd [rdi], xmm0       \
                            movsd [rdi+8], xmm1     \
                            movsd [rdi+16], xmm2    \
                            "}

#   define VEC3F_ADD    __asm{"\
                            addsd xmm0, [rsi]       \
                            addsd xmm1, [rsi+8]     \
                            addsd xmm2, [rsi+16]    \
                            "}

#   define VEC3F_SUB    __asm{"\
                            subsd xmm0, [rsi]       \
                            subsd xmm1, [rsi+8]     \
                            subsd xmm2, [rsi+16]    \
                            "}

#   define VEC3F_MUL    __asm{"\
                            mulsd xmm0, [rsi]       \
                            mulsd xmm1, [rsi+8]     \
                            mulsd xmm2, [rsi+16]    \
                            "}

#   define VEC3F_DIV    __asm{"\
                            divsd xmm0, [rsi]       \
                            divsd xmm1, [rsi+8]     \
                            divsd xmm2, [rsi+16]    \
                            "}

#endif

/**
 * Universal definitions:
 * (Reguardless of AVX)
 */

#define VEC3F_SQRT      __asm{"                         \
                                sqrtsd xmm0, [rdi]      \
                                sqrtsd xmm1, [rdi+8]    \
                                sqrtsd xmm2, [rdi+16]   \
                                movsd [rdi], xmm0       \
                                movsd [rdi+8], xmm1     \
                                movsd [rdi+16], xmm2    \
                            "}

#define VEC3F_DOT       __asm{"                         \
                            movsd xmm0, [rdi]           \
                            movsd xmm1, [rdi+8]         \
                            mulsd xmm0, [rsi]           \
                            movsd xmm2, [rdi+16]        \
                            mulsd xmm1, [rsi+8]         \
                            mulsd xmm2, [rsi+16]        \
                            addsd xmm0, xmm1            \
                            addsd xmm0, xmm2            \
                            "}



void Vec3f::set(double nx, double ny, double nz){
    x=nx;
    y=ny;
    z=nz;
}

void Vec3f::add(Vec3f* other){
    VEC3F_LOAD
    VEC3F_ADD
    VEC3F_DEPOSIT
}


void Vec3f::sub(Vec3f* other){
    VEC3F_LOAD
    VEC3F_SUB
    VEC3F_DEPOSIT
}

void Vec3f::mul(Vec3f* other){
    VEC3F_LOAD
    VEC3F_MUL
    VEC3F_DEPOSIT
}

void Vec3f::div(Vec3f* other){
    VEC3F_LOAD
    VEC3F_DIV
    VEC3F_DEPOSIT
}

void Vec3f::sqrt(){
    VEC3F_SQRT
}

double Vec3f::dot(Vec3f* other){
    VEC3F_DOT
}