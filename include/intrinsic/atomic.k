/*
    Contents: Functions designed to give access to the LOCK instruction prefix.
    
    MIT License
    Copyright (c) 2020 Philo Kaulkin

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
    DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
    OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
    OR OTHER DEALINGS IN THE SOFTWARE.
*/



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
    xchg eax, [rdi]
    lock sub dword[rdi], esi
    "}
}
/**
 * @see _atomic_sub(int*, int)
 */
inline long _atomic_sub(long* atom, long subtractor){
    __asm{"
    xor rax, rax
    xchg rax, [rdi]
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
/**
 *  _atomic_sub gives access to the LOCK prefix for the 'add' x86 instruction.
 *  @param atom a pointer to an atomic int
 *  @param subtractor value to add to atom
 *  @returns the value of atom
 */
inline int _atomic_add(int* atom, int adder){
    __asm{"
    xchg eax, [rdi]
    lock add dword[rdi], esi
    "}
}
/**
 * @see _atomic_add
 */
inline long _atomic_add(long* atom, long adder){
    __asm{"
    xchg rax, [rdi]
    lock add qword[rdi], rsi
    "}
}

/**
 * _atomic_read uses the LOCK prefix to safely read the atomic value.
 * @param atom value to read
 * @returns value of atom
 */
inline int _atomic_read(int* atom){
    __asm{"
    xchg eax, [rdi]
    "}
}
/**
 * @see _atomic_read
 */
inline long _atomic_read(int* atom){
    __asm{"
    xchg rax, [rdi]
    "}
}



#endif