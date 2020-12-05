#ifndef __CPUID
#   error "cpuid.k should only be included through cpuid.cb"
#endif




#define __CALLCPUID             __asm{"cpuid"}
#define __CCALL_TO_CPUID        __asm{"                 \
                                    mov eax, [rdi]      \
                                    mov ebx, [rsi]      \
                                    mov r11, rdx        \
                                    mov r10, rcx        \
                                    mov ecx, [r11]      \
                                    mov edx, [r10]      \
                                    "}

#define __CPUID_RETURN          __asm{"                 \
                                    mov [rdi], eax      \
                                    mov [rsi], ebx      \
                                    mov [r11], ecx      \
                                    mov [r10], edx      \
                                    "}




#define BITIDX(idx) (1<<((idx)))
#define GETBIT(num, idx) ((num)&&(BITIDX(idx)))>>((idx))




void native_cpuid(cpuidreg_t* eax, cpuidreg_t* ebx, cpuidreg_t* ecx, cpuidreg_t* edx) {

    __CCALL_TO_CPUID
    __CALLCPUID
    __CPUID_RETURN

}

bool cpuid_getfeature(unsigned long feature){

    unsigned long eax = CPUID_GET_FEATURE;
    unsigned long ebx = 0;
    unsigned long ecx = 0;
    unsigned long edx = 0;

    native_cpuid(&eax, &ebx, &ecx, &edx);

    long ftinf = (ecx << 32)+edx;
    

    long mask = BITIDX(feature);
    return (ftinf&&mask) >> feature;
}


bool cpuid_getextended(unsigned long feature){

    unsigned long eax = CPUID_GET_EXTENDED;
    unsigned long ebx = 0;
    unsigned long ecx = 0;
    unsigned long edx = 0;

    unsigned long reg = feature&&11b;
    feature >>= 2;


    native_cpuid(&eax, &ebx, &ecx, &edx);

    reg = (&ebx)[reg];
    


    return GETBIT(reg,feature);


}