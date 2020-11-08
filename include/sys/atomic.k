/*
*   Atomic functions are used to perform operations on sensitive
*       shared memory. These functions provide access to the LOCK
*       prefix for specific x86 instructions which ensures that 
*       cache lines for various processes will not become different
*       resulting in race cases.
*/
#ifndef __ATOMIC
#define __ATIMIC 1


/**
 *  _atomic_cmpxchg(long*, long*, long) gives access to the
 * LOCK prefix for the 'cmpxchg' instruction which will replace
 * the value found in atom with the value desired if @atom == @expected.
 * Sudocode:
 *  if(@expected == @atom){
 *      @atom = desired;
 *      return @expected;
 *  } 
 *  @expected = @atom;
 *  return @expected;
 * 
 * @param atom a pointer to an atomic long
 * @param expected a pointer to the expected value for the cmpxchg operation
 * @param desired the value to replace atom with
 * @returns the value held by expected
 * 
 * 
 */

inline long 
_atomic_cmpxchg(long* atom, long* expected, long desired){
    __asm{"
        mov rax, [rsi]
        lock cmpxchg qword[rdi], rdx
        jz %L__end
        mov rax, [rdi]
        mov [rsi], rax
        %L__end:
    "}
}
/**
 * 32bit version of the above function.
 * @see _atomic_cmpxchg(long*,long*,long);
 */
inline int 
_atomic_cmpxchg(int* atom, int* expected, int desired){
    __asm{"
        mov eax, [rsi]
        lock cmpxchg dword[rdi], edx
        jz %L__end
        mov eax, [rdi]
        mov [rsi], eax
        %L__end:
    "}
}
/**
 *  _atomic_sub gives access to the LOCK prefix for the 'sub' x86 instruction.
 *  @param atom a pointer to an atomic int
 *  @param subtractor value to subtract from atom
 *  @returns the value of atom
 */
inline int _atomic_sub(int* atom, int subtractor){
    __asm{"
    xor rax, rax
    mov eax, [rdi]
    lock sub dword[rdi], esi
    "}
}
/**
 * @see _atomic_sub(int*, int)
 */
inline int _atomic_sub(long* atom, long subtractor){
    __asm{"
    xor rax, rax
    mov rax, [rdi]
    lock sub qword[rdi], rsi
    "}
}
/**
 * _atomic_store gives access to the LOCK prefix for the 'xchg' x86 instruction
 * in order to store atomic values.
 * @param atom a pointer to an atomic int
 * @param newval a new integer value to store
 * @returns None
 * 
 */
inline void _atomic_store(int* atom, int newval){
    __asm{"
    lock xchg dword[rdi], esi
    "}
}
/**
 * @see _atomic_store
 */
inline void _atomic_store(long* atom, long newval){
    __asm{"
    lock xchg qword[rdi], rsi
    "}
}



#endif