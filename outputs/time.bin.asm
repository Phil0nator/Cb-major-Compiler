
%ifndef IO_SYS
%define IO_SYS
%assign sasmMacroCount 0

%macro sasmMacroFunc 0.nolist ;func for debug
    %push sasmMacroFunc
    call %$sasmMacro
    jmp %$sasmMacroE
    %$sasmMacro:
    jmp %%after_data
section .data
    %$sasmRetAddr dq 0
section .text
    %%after_data:
    push rbx
    mov rbx, qword[rsp + 8]
    mov qword[%$sasmRetAddr], rbx
    mov rbx, qword[rsp]
    mov qword[rsp + 8], rbx
    pop rbx
    pop rbx
%endmacro

%macro sasmMacroFuncE 0.nolist ;exit
    push qword[%$sasmRetAddr]
    ret
    %$sasmMacroE:
    %pop
%endmacro

%macro CEXTERN 1.nolist
    extern %1
%endmacro
%define CMAIN main

CEXTERN printf
CEXTERN scanf
CEXTERN putchar
CEXTERN fgets
CEXTERN puts
CEXTERN fputs
CEXTERN fflush

CEXTERN get_stdin
CEXTERN get_stdout


CEXTERN malloc
CEXTERN strcat
CEXTERN realloc
CEXTERN calloc
CEXTERN free

CEXTERN fabsf

; Make stack be 16 bytes aligned
%macro ALIGN_STACK 0.nolist
    enter 0, 0
    and rsp, 0xfffffffffffffff0
%endmacro

%macro UNALIGN_STACK 0.nolist
    leave
%endmacro

%macro FFLUSH_STDOUT 0.nolist
    ALIGN_STACK
    call get_stdout
    mov rdi, rax
    call fflush
    UNALIGN_STACK
%endmacro

%macro IS_GPR 1.nolist
    %push IS_GPR
    %assign %$is_reg 0
    %assign %$reg_size 1
    %ifidni %1, ah
        %assign %$is_reg 1
    %elifidni %1, al
        %assign %$is_reg 1
    %elifidni %1, bl
        %assign %$is_reg 1
    %elifidni %1, bh
        %assign %$is_reg 1
    %elifidni %1, cl
        %assign %$is_reg 1
    %elifidni %1, ch
        %assign %$is_reg 1
    %elifidni %1, dl
        %assign %$is_reg 1
    %elifidni %1, dh
        %assign %$is_reg 1
    %elifidni %1, spl
        %assign %$is_reg 1
    %elifidni %1, bpl
        %assign %$is_reg 1
    %elifidni %1, dil
        %assign %$is_reg 1
    %elifidni %1, sil
        %assign %$is_reg 1
    %elifidni %1, ax
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, bx
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, cx
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, dx
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, sp
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, bp
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, si
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, di
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, eax
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, ebx
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, ecx
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, edx
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, esp
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, ebp
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, esi
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, edi
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, rax
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rbx
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rcx
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rdx
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rsp
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rbp
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rsi
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, rdi
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r8
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r9
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r10
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r11
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r12
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r13
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r14
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r15
        %assign %$is_reg 1
        %assign %$reg_size 8
    %elifidni %1, r8d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r9d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r10d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r11d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r12d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r13d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r14d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r15d
        %assign %$is_reg 1
        %assign %$reg_size 4
    %elifidni %1, r8w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r9w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r10w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r11w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r12w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r13w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r14w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r15w
        %assign %$is_reg 1
        %assign %$reg_size 2
    %elifidni %1, r8b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r9b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r10b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r11b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r12b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r13b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r14b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %elifidni %1, r15b
        %assign %$is_reg 1
        %assign %$reg_size 1
    %endif
%endmacro

%macro PRINT_STRING 1.nolist
    sasmMacroFunc
    IS_GPR %1
    %if %$is_reg = 1
        %error "Register as parameter is not supported"
    %endif
    %pop
%ifid %1
; variable
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    call get_stdout
    mov rdi, %1
    mov rsi, rax
%elifstr %1
; string literal
    jmp %%after_str
section .data
    %%str db %1, 0
section .text
    %%after_str:
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    call get_stdout
    mov rdi, %%str
    mov rsi, rax
%else
; address expression
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rbx
    lea rbx, %1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    call get_stdout
    mov rdi, rbx
    mov rsi, rax
    mov rbx, qword[%%tmp]
%endif
    call fputs
    UNALIGN_STACK
    FFLUSH_STDOUT
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
    sasmMacroFuncE
%endmacro

%macro NEWLINE 0.nolist
    PRINT_STRING `\n`
%endmacro

; size baseformatletter ("d", "u", "x") varname (%%fmt)
%macro ___MAKE_FORMAT_STR 3.nolist
    jmp %%after_fmt
    %if %1 = 1
        %strcat fmts "%hh" %2
    %elif %1 = 2
        %strcat fmts "%h" %2
    %elif %1 = 4
        %strcat fmts "%" %2
    %elif %1 = 8
        %strcat fmts "%ll" %2
    %else
        %error "Expected numeric constant 1, 2, 4 or 8 as 1st argument"
    %endif
    %3 db fmts, 0
    %%after_fmt:
%endmacro

; size data baseformatletter ("d", "u", "x") signextendinst (movzx, movsx)
%macro ___PRINT_NUM_COMMON 4.nolist
    ___MAKE_FORMAT_STR %1, %3, %%fmt
    IS_GPR %2
%if %$is_reg = 1
; register
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax    
    %if %$reg_size = 1
        %4 rax, %2
    %elif %$reg_size = 2
        %4 rax, %2
    %elif %$reg_size = 4
        movsx rax, %2
        %ifidni %4, movzx
            pushfq
            shl rax, 32
            shr rax, 32
            popfq
        %endif
    %else ; %$reg_size = 8
        mov rax, %2
    %endif
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%elifid %2
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    %if %1 = 1
        %4 rax, byte [%2]
    %elif %1 = 2
        %4 rax, word [%2]
    %elif %1 = 4
        movsx rax, dword [%2]
        %ifidni %4, movzx
            pushfq
            shl rax, 32
            shr rax, 32
            popfq
        %endif
    %else ; %1 = 8
        mov rax, qword [%2]
    %endif
    mov rsi, rax
    ALIGN_STACK
%elifnum %2
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %2
    ALIGN_STACK
%elifstr %2
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %2
    ALIGN_STACK
%else
; may be, address expression?
jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax
    %if %1 = 1
        %4 rax, byte %2
    %elif %1 = 2
        %4 rax, word %2
    %elif %1 = 4
        movsx rax, dword %2
        %ifidni %4, movzx
            pushfq
            shl rax, 32
            shr rax, 32
            popfq
        %endif
    %else ; %1 = 8
        mov rax, qword %2
    %endif
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%endif
    mov rdi, %%fmt
    call printf
    UNALIGN_STACK
    FFLUSH_STDOUT
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq 
    %pop ; IS_REG    
%endmacro

%macro PRINT_DEC 2.nolist
    sasmMacroFunc
    ___PRINT_NUM_COMMON %1, %2, "d", movsx
    sasmMacroFuncE
%endmacro

%macro PRINT_UDEC 2.nolist
    sasmMacroFunc
    ___PRINT_NUM_COMMON %1, %2, "u", movzx
    sasmMacroFuncE
%endmacro

%macro PRINT_HEX 2.nolist
    sasmMacroFunc
    ___PRINT_NUM_COMMON %1, %2, "x", movzx
    sasmMacroFuncE
%endmacro

%macro PRINT_CHAR 1.nolist
    sasmMacroFunc
    IS_GPR %1
%if %$is_reg = 1
; register
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax    
    %if %$reg_size = 1
        movzx rax, %1
    %elif %$reg_size = 2
        movzx rax, %1
    %elif %$reg_size = 4
        movsx rax, %1
        pushfq
        shl rax, 32
        shr rax, 32
        popfq
    %else ; %$reg_size = 8
        mov rax, %1
    %endif
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    and rax, 0xff
    mov rdi, rax
    ALIGN_STACK
%elifid %1
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    movzx rax, byte [%1]
    mov rdi, rax
    ALIGN_STACK
%elifnum %1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rdi, %1
    and rdi, 0xff
    ALIGN_STACK
%elifstr %1
; string select only 1st byte
%substr tstr %1 1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rdi, tstr
    ALIGN_STACK
%else
; may be, address expression?
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
    %%after_data:
    mov qword[%%tmp], rax
    movzx rax, byte %1
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rdi, rax
    ALIGN_STACK
%endif
    call putchar
    UNALIGN_STACK
    FFLUSH_STDOUT
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
    %pop ; IS_REG
    sasmMacroFuncE
%endmacro

; size data baseformatletter ("d", "u", "x") signextendinst (movzx, movsx)
%macro ___GET_NUM_COMMON 4.nolist
    ___MAKE_FORMAT_STR %1, %3, %%fmt        
    jmp %%after_data
section .data
    %%read_tmp dq 0
    %%tmp dq 0
section .text
    %%after_data:
    IS_GPR %2
%if %$is_reg = 1
; register
    %ifidni %2, rsp
        %error "Won't read to rsp!" 
    %elifidni %2, esp
        %error "Won't read to esp!" 
    %elifidni %2, sp
        %error "Won't read to sp!"
    %elifidni %2, spl
        %error "Won't read to sp!" 
    %endif
    %if %$reg_size < %1
        %error "Too small register for requested data"
    %endif
; we will have to do postprocessing after scanf
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %%read_tmp
    ALIGN_STACK
%elifid %2
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %2
    ALIGN_STACK
%elifnum %2
    %error "Incorrect parameter (number)"
%elifstr %2
    %error "Incorrect parameter (string)"
%else
; may be, address expression?
    mov qword[%%tmp], rax
    lea rax, %2
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%endif
    mov rdi, %%fmt
    call scanf
    UNALIGN_STACK
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
%if %$is_reg = 1
    ; register postprocessing
    %if %$reg_size = %1
        mov %2, [%%read_tmp]
    %else ; extend bytes 1 -> 2, 1 -> 4, 1 -> 8, 2 -> 4, 2 -> 8, 4 -> 8
        %if %1 = 1
            %4 %2, byte [%%read_tmp]
        %elif %1 = 2
            %4 %2, word [%%read_tmp]
        %else ; 4
            movsx %2, dword [%%read_tmp]
            %ifidni %4, movzx
                pushfq
                shl %2, 32
                shr %2, 32
                popfq
            %endif
        %endif
    %endif
%endif
    %pop ; IS_REG
%endmacro

%macro GET_HEX 2.nolist
    sasmMacroFunc
    ___GET_NUM_COMMON %1, %2, "x", movzx
    sasmMacroFuncE
%endmacro

%macro GET_DEC 2.nolist
    sasmMacroFunc
    ___GET_NUM_COMMON %1, %2, "d", movsx
    sasmMacroFuncE
%endmacro

%macro GET_UDEC 2.nolist
    sasmMacroFunc
    ___GET_NUM_COMMON %1, %2, "u", movzx
    sasmMacroFuncE
%endmacro


%macro GET_CHAR 1.nolist
    sasmMacroFunc
    jmp %%after_data
section .data
    %%fmt db "%c", 0
    %%read_tmp db 0
    %%tmp dq 0
section .text
%%after_data:
    IS_GPR %1
%if %$is_reg = 1
; register
    %ifidni %1, rsp
        %error "Won't read to rsp!" 
    %elifidni %1, esp
        %error "Won't read to esp!" 
    %elifidni %1, sp
        %error "Won't read to sp!" 
    %elifidni %1, spl
        %error "Won't read to spl!" 
    %endif
; we will have to do postprocessing after scanf
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %%read_tmp
    ALIGN_STACK
%elifid %1
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    mov rsi, %1
    ALIGN_STACK    
%elifnum %1
    %error "Incorrect parameter (number)"
%elifstr %1
    %error "Incorrect parameter (string)"
%else
; may be, address expression?
    mov qword[%%tmp], rax
    lea rax, %1
    pushfq
    push qword[%%tmp] ;rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ALIGN_STACK
    mov rsi, rax
%endif
    mov rdi, %%fmt
    call scanf
    UNALIGN_STACK
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
%if %$is_reg = 1
    ; register postprocessing
    %if %$reg_size = 1
        mov %1, byte [%%read_tmp]
    %else ; zero extend bytes 1 -> 2, 1 -> 4, 1 -> 8
        movzx %1, byte [%%read_tmp]
    %endif
%endif
    %pop ; IS_REG
    sasmMacroFuncE
%endmacro

%macro GET_STRING 2.nolist
    sasmMacroFunc
    IS_GPR %1
    %if %$is_reg = 1
        %error "Incorrect 1st parameter (register)"
    %endif    
    %pop ;IS_GPR
    IS_GPR %2    
    %if %$is_reg = 1
        ;
    %elifnum %2
        %if %2 <= 0
            %error "Second parameter must be positive"
        %endif
    %else
        %error "Second parameter must be numeric constant or register"
    %endif
    %pop ;IS_GPR
%ifid %1
; variable (hope so)
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ;count
    IS_GPR %2
    %if %$is_reg = 1 
        %if %$reg_size = 1
            movzx rsi, %2
        %elif %$reg_size = 2
            movzx rsi, %2
        %elif %$reg_size = 4
            movsx rsi, %2
            pushfq
            shl rsi, 32
            shr rsi, 32
            popfq
        %else ; %$reg_size = 8
            mov rsi, %2
        %endif
    %else
        mov rsi, %2
    %endif
    %pop
    mov rdi, %1
    ALIGN_STACK
    call get_stdin
    mov rdx, rax
%elifnum %1
    %error "Incorrect 1st parameter (number)"
%elifstr %1
    %error "Incorrect 1st parameter (string)"
%else
; may be, address expression?
    jmp %%after_data
section .data
    %%tmp dq 0
section .text
%%after_data:
    mov qword[%%tmp], rbx
    lea rbx, %1
    pushfq
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    push rsi
    push rdi
    ;count
    IS_GPR %2
    %if %$is_reg = 1 
        %if %$reg_size = 1
            movzx rsi, %2
        %elif %$reg_size = 2
            movzx rsi, %2
        %elif %$reg_size = 4
            movsx rsi, %2
            pushfq
            shl rsi, 32
            shr rsi, 32
            popfq
        %else ; %$reg_size = 8
            mov rsi, %2
        %endif
    %else
        mov rsi, %2
    %endif
    %pop
    mov rdi, rbx
    ALIGN_STACK
    call get_stdin
    mov rdx, rax
    mov rbx, qword[%%tmp]
%endif
    call fgets
    UNALIGN_STACK
    pop rdi
    pop rsi
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
    popfq
    sasmMacroFuncE
%endmacro
%endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;PROGRAM START
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


section .data
FLT_CONSTANT_0: dq __float32__(-1.0)
FLT_CONSTANT_1: dq __float32__(1.0)
FLT_CONSTANT_2: dq __float32__(1.192092896e-32)
FLT_CONSTANT_3: dq __float32__(3.141592653589793)
FLT_CONSTANT_4: dq __float32__(2.718281828459045)
FLT_CONSTANT_5: dq __float32__(1.4426950408889634)
FLT_CONSTANT_6: dq __float32__(0.4342944819032518)
FLT_CONSTANT_7: dq __float32__(0.6931471805599453)
FLT_CONSTANT_8: dq __float32__(1.5707963267948966)
FLT_CONSTANT_9: dq __float32__(0.7853981633974483)
FLT_CONSTANT_10: dq __float32__(0.3183098861837907)
FLT_CONSTANT_11: dq __float32__(0.6366197723675814)
FLT_CONSTANT_12: dq __float32__(1.1283791670955126)
FLT_CONSTANT_13: dq __float32__(1.4142135623730951)
FLT_CONSTANT_14: dq __float32__(0.7071067811865476)
FLT_CONSTANT_15: dq __float32__(2147483646.0)
STRING_CONSTANT_0: db `Memory error encountered`, 0
STRING_CONSTANT_1: db `%g`, 0
STRING_CONSTANT_2: db ``, 0
STRING_CONSTANT_3: db `logic.txt`, 0
STRING_CONSTANT_4: db `This is an extra line that has been written!\n`, 0
__FLT_STANDARD_1: dq __float32__(1.0)
INF: dq 0x7fffffffffffffff
FLT_NEGATIVE1: dq __float32__(-1.0)
FLT_ONE: dq __float32__(1.0)
EPSILON: dq __float32__(1.192092896e-32)
M_PI: dq __float32__(3.141592653589793)
M_E: dq __float32__(2.718281828459045)
M_LOG2E: dq __float32__(1.4426950408889634)
M_LOG10E: dq __float32__(0.4342944819032518)
M_LN2: dq __float32__(0.6931471805599453)
M_PI_2: dq __float32__(1.5707963267948966)
M_PI_4: dq __float32__(0.7853981633974483)
M_1_PI: dq __float32__(0.3183098861837907)
M_2_PI: dq __float32__(0.6366197723675814)
M_2_SQRTPI: dq __float32__(1.1283791670955126)
M_SQRT2: dq __float32__(1.4142135623730951)
M_SQRT1_2: dq __float32__(0.7071067811865476)
FLT_MAX: dq __float32__(2147483646.0)
INTMAX: dq 0x7fffffffffffffff
__isincluded__MEMORY_: dq 0x96c6
__PRINTFFLOAT: db `%g`, 0
CLOCK_MONOTONIC: dq 0x1
O_RDONLY: dq 0x0
O_WRONLY: dq 0x1
O_RDWR: dq 0x2
WMODE_WRITE: dq 0x0
WMODE_APPEND: dq 0x400
WMODE_WPLUS: dq 0x41
WMODE_WPLUSA: dq 0x441
O_CREATE: dq 0x40
SEEK_CUR: dq 0x1
FLT_STANDARD_ZERO: dq __float32__(0.0)
isFloat: dq 0x1



section .bss
current_filereader: resb 0x8



section .text
global CMAIN



String:

push rbp
mov rbp, rsp
sub rsp, 0x8

mov rdi, 0x20
call malloc
add rsp, 4
test rax, rax ; check for error
mov byte[rax+0x20], 0x0
mov r8, rax
leave
ret

        
FileReader:

push rbp
mov rbp, rsp
sub rsp, 0x8

mov rdi, 0x38
call malloc
add rsp, 4
test rax, rax ; check for error
mov byte[rax+0x38], 0x0
mov r8, rax
leave
ret

        
FileWriter:

push rbp
mov rbp, rsp
sub rsp, 0x8

mov rdi, 0x20
call malloc
add rsp, 4
test rax, rax ; check for error
mov byte[rax+0x20], 0x0
mov r8, rax
leave
ret

        sqrtint:

push rbp
mov rbp, rsp
sub rsp, 0x8

    mov r8, r9 ; copy initial value
    xor r10, r10; count
    xor r11, r11; sqrt
    __sqrtint_flp_0x0:
    sub r8, r10
    inc r10
    inc r10
    inc r11
    cmp r8, 0
    js __sqrtint_flp_0x0_end
    jnz __sqrtint_flp_0x0
    __sqrtint_flp_0x0_end:
    dec r11
    mov r8, r11
    

__sqrtint__leave_ret_:
leave
ret

powint:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
        mov rax, r9
        dec r10
        __powint__flp_0x0:
        mul r9
        dec r10
        cmp r10, 0
        jne __powint__flp_0x0
        mov r8, rax
    
    

__powint__leave_ret_:
leave
ret

floor:

push rbp
mov rbp, rsp
sub rsp, 0x8


        cvttss2si r8, xmm0
    
    

__floor__leave_ret_:
leave
ret

round:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
        cvtss2si r8, xmm0

    

__round__leave_ret_:
leave
ret

toFloat:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
        cvtsi2ss xmm8, r9
    
    

__toFloat__leave_ret_:
leave
ret

ceil:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
        roundss xmm1, xmm0, 10B
        cvttss2si r8, xmm1

    

__ceil__leave_ret_:
leave
ret

sqrtflt:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
        sqrtss xmm8, xmm0

    

__sqrtflt__leave_ret_:
leave
ret

__fmod:

push rbp
mov rbp, rsp
sub rsp, 0x30
movss [rbp-0x8], xmm0
movss [rbp-0x10], xmm1
movss xmm15, [rbp-0x8]
movss xmm14,  [rbp-0x10]
divss xmm15, xmm14
movss [rbp-0x18], xmm15
mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

movss xmm0,  [rbp-0x18]
call floor
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov rax, QWORD [rbp-0x20]
movss xmm14,  [rbp-0x10]
cvtsi2ss xmm15, rax
mulss xmm15, xmm14
movss xmm10, xmm15
movss xmm15, [rbp-0x8]
movss xmm14, xmm10
subss xmm15, xmm14
movss [rbp-0x28], xmm15
movss xmm8,  [rbp-0x28]
cvttss2si r8, xmm8
jmp ____fmod__leave_ret_

____fmod__leave_ret_:
leave
ret

fmod:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    movss xmm15, xmm0
    divss xmm15, xmm1
    cvttss2si rax, xmm15
    cvtsi2ss xmm15, rax
    mulss xmm15, xmm1
    subss xmm0, xmm15
    movss xmm8, xmm0

    
    

__fmod__leave_ret_:
leave
ret

absint:

push rbp
mov rbp, rsp
sub rsp, 0x8

        mov rax, r9
        sar rax, 63
        xor r9, rax
        sub r9, rax
        mov r8, r9

       
    

__absint__leave_ret_:
leave
ret

fabs:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    mov rax, 1
    call fabsf
    movss xmm8, xmm0
    
    

__fabs__leave_ret_:
leave
ret

exit:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    
    mov rax, 1  ; 1 = exit system call
    mov rdi, r9 ; r9 = exit code given in parameter
    int 0x80    ; interrupt
    
    

__exit__leave_ret_:
leave
ret

doInterrupt:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
        mov rax, r9;
        mov rdi, r10;
        int 0x80

    

__doInterrupt__leave_ret_:
leave
ret

Array:

push rbp
mov rbp, rsp
sub rsp, 0x18
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx

mov rax, QWORD [rbp-0x8]
mov rcx, 0x8
imul rcx
mov r9,rax
call alloc
mov rcx, r8
mov QWORD [rbp-0x10], rcx

mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Array__leave_ret_

__Array__leave_ret_:
leave
ret

putValue:

push rbp
mov rbp, rsp
sub rsp, 0x8

    mov rax, r11
    mov QWORD [r9+r10], rax  
    

__putValue__leave_ret_:
leave
ret

getValue:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    mov rax, QWORD [r9+r10]
    mov r8, rax
    
    

__getValue__leave_ret_:
leave
ret

alloc:

push rbp
mov rbp, rsp
sub rsp, 0x8

   ALIGN_STACK
   xor r11, r11
   xor r12, r12
   mov rdi, r9
   call malloc
   xor r11, r11
   xor r12, r12
   add rsp, 4
   test rax, rax ; check for error

   mov byte[rax+rdi], 0x0

   mov r8, rax
   UNALIGN_STACK



__alloc__leave_ret_:
leave
ret

memerror:

push rbp
mov rbp, rsp
sub rsp, 0x10
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov r9, STRING_CONSTANT_0
call print_string
mov r9, QWORD [rbp-0x8]
call exit

__memerror__leave_ret_:
leave
ret

destroy:

push rbp
mov rbp, rsp
sub rsp, 0x8


    mov rdi, r9
    call free
    xor r10, r10
    xor r11, r11 ;gc
    xor r12, r12
    sub rsp,4



__destroy__leave_ret_:
leave
ret

reallocate:

push rbp
mov rbp, rsp
sub rsp, 0x8

        

        mov rdi, r9
        mov rsi, r10
        xor r10, r10
        xor r11, r11 ;gc
        xor r12, r12
        call realloc

        test rax, rax
        xor r10, r10
        xor r11, r11 ;gc
        xor r12, r12
        mov r8, rax
        
        
        

__reallocate__leave_ret_:
leave
ret

print_char:

push rbp
mov rbp, rsp
sub rsp, 0x8

    PRINT_CHAR r9
    NEWLINE
    

__print_char__leave_ret_:
leave
ret

print_string:

push rbp
mov rbp, rsp
sub rsp, 0x8

    PRINT_STRING [r9]
    NEWLINE
    

__print_string__leave_ret_:
leave
ret

print_integer:

push rbp
mov rbp, rsp
sub rsp, 0x8

    PRINT_DEC 8, r9
    NEWLINE
    

__print_integer__leave_ret_:
leave
ret

print_uint:

push rbp
mov rbp, rsp
sub rsp, 0x8

    PRINT_UDEC 8, r9
    NEWLINE
    

__print_uint__leave_ret_:
leave
ret

printformat:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    push rax
    push rcx
    mov     rdi, r9                ; set 1st parameter (format)
    mov     rsi, r10                 ; set 2nd parameter (current_number)
    xor     rax, rax                ; because printf is varargs

    ; Stack is already aligned because we pushed three 8 byte registers
    call    printf                  ; printf(format, current_number)

    pop     rcx                     ; restore caller-save register
    pop     rax                     ; restore caller-save register
    FFLUSH_STDOUT
    

__printformat__leave_ret_:
leave
ret

print_two_formats:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    push rax
    push rcx
    mov     rdi, r9                ; set 1st parameter (value)
    mov     rsi, r10                 ; set 2nd parameter (fa)
    mov     rdx, r11                ; set 3rd parameter (fb)
    xor     rax, rax                ; because printf is varargs

    ; Stack is already aligned because we pushed three 8 byte registers
    call    printf                  ; printf(format, current_number)

    pop     rcx                     ; restore caller-save register
    pop     rax                     ; restore caller-save register
    FFLUSH_STDOUT
    

__print_two_formats__leave_ret_:
leave
ret

print_formatfloat:

push rbp
mov rbp, rsp
sub rsp, 0x10
mov rcx, 0x0
mov QWORD [rbp-0x8], rcx


    ALIGN_STACK
    mov     rdi, r9                ; set 1st parameter (format)
    cvtps2pd xmm0, xmm1
    mov rax, 1

    call    printf                  ; printf(format, current_number)

    FFLUSH_STDOUT
    ;add rsp, 12
    UNALIGN_STACK
    

__print_formatfloat__leave_ret_:
leave
ret

print_floatln:

push rbp
mov rbp, rsp
sub rsp, 0x10
mov rcx, 0x0
mov QWORD [rbp-0x8], rcx




        ALIGN_STACK
        mov     rdi, __PRINTFFLOAT                ; set 1st parameter (format)
        cvtps2pd xmm0, xmm0
        mov rax, 1

        call    printf                  ; printf(format, current_number)

        NEWLINE
        ;add rsp, 12
        UNALIGN_STACK

    

__print_floatln__leave_ret_:
leave
ret

print_float:

push rbp
mov rbp, rsp
sub rsp, 0x10
mov rcx, 0x0
mov QWORD [rbp-0x8], rcx



        ALIGN_STACK
        mov     rdi, __PRINTFFLOAT                ; set 1st parameter (format)
        cvtps2pd xmm0, xmm0
        mov rax, 1

        call    printf                  ; printf(format, current_number)

        FFLUSH_STDOUT
        ;add rsp, 12
        UNALIGN_STACK
    

__print_float__leave_ret_:
leave
ret

newline:

push rbp
mov rbp, rsp
sub rsp, 0x8

    NEWLINE
    

__newline__leave_ret_:
leave
ret

systime:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
        mov rax, 201 ;sys_time
        xor rdi, rdi
        syscall
        mov r8, rax

    
    

__systime__leave_ret_:
leave
ret

epochmillis:

push rbp
mov rbp, rsp
sub rsp, 0x8


__epochmillis__leave_ret_:
leave
ret

delay:

push rbp
mov rbp, rsp
sub rsp, 0x30
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx

call systime
mov rcx, r8
mov QWORD [rbp-0x10], rcx

mov rbx, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x8]
add rbx, rcx
mov QWORD [rbp-0x10], rbx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

__delay__flp0x20:
call systime
mov rcx, r8
mov QWORD [rbp-0x18], rcx

mov r14, QWORD [rbp-0x18]
mov r15, QWORD [rbp-0x10]
cmp r14, r15
push __cmpblock__delay__0x1ca
jge __delay__leave_ret_
add rsp, 0x8
__cmpblock__delay__0x1ca:
__delay__flp_end_0x20:
mov rbx, 0x1
mov QWORD [rbp-0x28], rbx
mov rbx, 0x0
mov QWORD [rbp-0x20], rbx

mov rdi, QWORD [rbp-0x28]

    

mov rsi, QWORD [rbp-0x20]

    
cmp rsi, rdi
jl __delay__flp0x20


__delay__leave_ret_:
leave
ret

String.init:

push rbp
mov rbp, rsp
sub rsp, 0x28
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x10]
call strlen
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x20]
call alloc
mov rcx, r8
mov QWORD [rbp-0x18], rcx

mov r14, QWORD [rbp-0x18]
mov r15, 0x0
cmp r14, r15
push __cmpblock__String.init__0x17f
je memerror
add rsp, 0x8
__cmpblock__String.init__0x17f:
mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
call strcpy

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x18]
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rax, QWORD [rbp-0x20]
mov [rbx], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __String.init__leave_ret_

__String.init__leave_ret_:
leave
ret

String.charAt:

push rbp
mov rbp, rsp
sub rsp, 0x28
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov rax, QWORD [rbp-0x10]

mov rbx, QWORD [rbp-0x18]

    
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __String.charAt__leave_ret_

__String.charAt__leave_ret_:
leave
ret

String.printable:

push rbp
mov rbp, rsp
sub rsp, 0x18
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __String.printable__leave_ret_

__String.printable__leave_ret_:
leave
ret

String.append_string:

push rbp
mov rbp, rsp
sub rsp, 0x28
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx


mov rbx, QWORD [rbp-0x10]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x20]
call strAppend
mov rcx, r8
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x18]
mov [rbx], rax
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __String.append_string__leave_ret_

__String.append_string__leave_ret_:
leave
ret

String.append_chars:

push rbp
mov rbp, rsp
sub rsp, 0x20
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
call strAppend
mov rcx, r8
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x18]
mov [rbx], rax
mov r8, QWORD [rbp-0x18]
cvtsi2ss xmm8,r8
jmp __String.append_chars__leave_ret_

__String.append_chars__leave_ret_:
leave
ret

String.destroy:

push rbp
mov rbp, rsp
sub rsp, 0x18
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov r9, QWORD [rbp-0x10]
call destroy
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __String.destroy__leave_ret_

__String.destroy__leave_ret_:
leave
ret

String.length:

push rbp
mov rbp, rsp
sub rsp, 0x18
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __String.length__leave_ret_

__String.length__leave_ret_:
leave
ret

stringcat:

push rbp
mov rbp, rsp
sub rsp, 0x8

    mov rdi, r9 ;reallocated
    mov rsi, r10;strb
    call strcat 
    xor r10, r10
    xor r11, r11 ;gc
    xor r12, r12
    add rsp, 4
    mov r8, rax
    

__stringcat__leave_ret_:
leave
ret

strcpy:

push rbp
mov rbp, rsp
sub rsp, 0x8

        
        xor r8, r8
        xor rax, rax
        _strcpy_top_loop:
        mov ax, word [r10 + r8]
        cmp ax, 0
        je _strcpy_end_loop
        mov word [r9+r8],ax
        inc r8
        jmp _strcpy_top_loop
        _strcpy_end_loop  :
    
    
    

__strcpy__leave_ret_:
leave
ret

strlen:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    xor r8,r8
    _strlen_top_loop:
    mov ax, word[r9+r8]
    cmp ax,0
    je _strlen_end_loop
    inc r8
    jmp _strlen_top_loop
    
    _strlen_end_loop:
    

__strlen__leave_ret_:
leave
ret

strAppend:

push rbp
mov rbp, rsp
sub rsp, 0x38
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x8]
call strlen
mov rcx, r8
mov QWORD [rbp-0x18], rcx

mov r9, QWORD [rbp-0x10]
call strlen
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov rbx, QWORD [rbp-0x18]
mov rcx, QWORD [rbp-0x20]
add rbx, rcx
cvtsi2ss xmm10,rbx
movss xmm15, xmm10
mov rcx, 0x1
cvtsi2ss xmm14, rcx
addss xmm15, xmm14
cvttss2si rax, xmm15
mov QWORD [rbp-0x28], rax
mov rcx, 0x0
mov QWORD [rbp-0x30], rcx

mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x28]
call reallocate
mov rcx, r8
mov QWORD [rbp-0x30], rcx

mov r14, QWORD [rbp-0x30]
mov r15, 0x0
cmp r14, r15
push __cmpblock__strAppend__0x2da
je memerror
add rsp, 0x8
__cmpblock__strAppend__0x2da:
mov r9, QWORD [rbp-0x30]
mov r10, QWORD [rbp-0x10]
call stringcat
mov rcx, r8
mov QWORD [rbp-0x30], rcx

mov r8, QWORD [rbp-0x30]
cvtsi2ss xmm8,r8
jmp __strAppend__leave_ret_

__strAppend__leave_ret_:
leave
ret

openFile:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    mov rax, 2
    mov rdi, r9
    mov rsi, r11
    mov rdx, r10
    or rdx, 64
    syscall
    mov r8, rax
    
    

__openFile__leave_ret_:
leave
ret

readFile:

push rbp
mov rbp, rsp
sub rsp, 0x8


    xor rax, rax
    mov rdi, r9
    mov rsi, r10
    mov rdx, r11
    syscall
    mov r8, rax


    

__readFile__leave_ret_:
leave
ret

writeFile:

push rbp
mov rbp, rsp
sub rsp, 0x8

    
    mov rax, 1
    mov rdi, r9
    mov rsi, r10
    mov rdx, r11
    syscall
    mov r8, rax
    

__writeFile__leave_ret_:
leave
ret

closeFile:

push rbp
mov rbp, rsp
sub rsp, 0x8

    mov rax, 3
    mov rdi, r9
    syscall
    

__closeFile__leave_ret_:
leave
ret

lseek:

push rbp
mov rbp, rsp
sub rsp, 0x20
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, r11
mov QWORD [rbp-0x18], rcx

    
    mov rax, 8
    mov rdi, r9
    mov rsi, r10
    mov rdx, r11
    syscall
    mov r8, r9
    
    
    

__lseek__leave_ret_:
leave
ret

FileReader.init:

push rbp
mov rbp, rsp
sub rsp, 0x38
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, r11
mov QWORD [rbp-0x18], rcx
call FileReader
mov rcx, r8
mov QWORD [rbp-0x8], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x10]
mov r10, [O_RDONLY]
mov r11, 0x0
call openFile
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov rcx, 0x0
mov QWORD [rbp-0x28], rcx

mov r9, QWORD [rbp-0x18]
call alloc
mov rcx, r8
mov QWORD [rbp-0x28], rcx

mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x28]
mov rbx, QWORD [rbp-0x18]
mov r11,rbx
call readFile
mov rcx, 0x0
mov QWORD [rbp-0x30], rcx

mov r9, QWORD [rbp-0x28]
call strlen
mov rcx, r8
mov QWORD [rbp-0x30], rcx

mov r9, QWORD [rbp-0x28]
mov r10, QWORD [rbp-0x30]
call reallocate
mov rcx, r8
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rax, QWORD [rbp-0x20]
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x28]
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rax, 0x0
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rax, 0x0
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x38
mov rax, QWORD [rbp-0x30]
mov [rbx], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __FileReader.init__leave_ret_

__FileReader.init__leave_ret_:
leave
ret

FileReader.destroy:

push rbp
mov rbp, rsp
sub rsp, 0x20
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov r9, QWORD [rbp-0x10]
call closeFile
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov r9, QWORD [rbp-0x18]
call destroy
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __FileReader.destroy__leave_ret_

__FileReader.destroy__leave_ret_:
leave
ret

FileReader.incline:

push rbp
mov rbp, rsp
sub rsp, 0x10
mov rcx, 0x0
mov QWORD [rbp-0x8], rcx

mov rbx, [current_filereader]
add rbx, 0x20
mov rcx, [rbx]
mov QWORD [rbp-0x8], rcx

mov rbx, QWORD [rbp-0x8]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x8], rbx
mov rbx, [current_filereader]
add rbx, 0x20
mov rax, QWORD [rbp-0x8]
mov [rbx], rax

__FileReader.incline__leave_ret_:
leave
ret

FileReader.nextChar:

push rbp
mov rbp, rsp
sub rsp, 0x28
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rbx, QWORD [rbp-0x8]
mov [current_filereader], rbx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov rax, QWORD [rbp-0x10]

mov rbx, QWORD [rbp-0x18]

    
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov rbx, QWORD [rbp-0x10]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x10], rbx

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rax, QWORD [rbp-0x10]
mov [rbx], rax
mov r14, QWORD [rbp-0x20]
mov r15, 0xa
cmp r14, r15
push __cmpblock__FileReader.nextChar__0x2e2
je FileReader.incline
add rsp, 0x8
__cmpblock__FileReader.nextChar__0x2e2:
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __FileReader.nextChar__leave_ret_

__FileReader.nextChar__leave_ret_:
leave
ret

FileReader.asString:

push rbp
mov rbp, rsp
sub rsp, 0x20
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx

call String
mov rcx, r8
mov QWORD [rbp-0x10], rcx

mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov r9, QWORD [rbp-0x10]
mov r10, QWORD [rbp-0x18]
call String.init
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __FileReader.asString__leave_ret_

__FileReader.asString__leave_ret_:
leave
ret

FileWriter.init:

push rbp
mov rbp, rsp
sub rsp, 0x30
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, r11
mov QWORD [rbp-0x18], rcx
call FileWriter
mov rcx, r8
mov QWORD [rbp-0x8], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x10]
mov r10, 0x1a4
mov r11, [WMODE_WPLUSA]
call openFile
mov rcx, r8
mov QWORD [rbp-0x20], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x20]
mov [rbx], rax
mov rcx, 0x0
mov QWORD [rbp-0x28], rcx

call String
mov rcx, r8
mov QWORD [rbp-0x28], rcx

mov r9, QWORD [rbp-0x28]
mov r10, STRING_CONSTANT_2
call String.init
mov rcx, r8
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rax, QWORD [rbp-0x28]
mov [rbx], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __FileWriter.init__leave_ret_

__FileWriter.init__leave_ret_:
leave
ret

FileWriter.write:

push rbp
mov rbp, rsp
sub rsp, 0x28
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov r9, QWORD [rbp-0x10]
call strlen
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x18]
mov r10, QWORD [rbp-0x10]
mov r11, QWORD [rbp-0x20]
call writeFile

__FileWriter.write__leave_ret_:
leave
ret

FileWriter.destroy:

push rbp
mov rbp, rsp
sub rsp, 0x20
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov r9, QWORD [rbp-0x10]
call String.destroy
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov r9, QWORD [rbp-0x18]
call closeFile
mov r9, QWORD [rbp-0x8]
call destroy
mov r8, 0x0
cvtsi2ss xmm8,r8
jmp __FileWriter.destroy__leave_ret_

__FileWriter.destroy__leave_ret_:
leave
ret

getChar:

push rbp
mov rbp, rsp
sub rsp, 0x8

    GET_CHAR r8
    

__getChar__leave_ret_:
leave
ret

getInt:

push rbp
mov rbp, rsp
sub rsp, 0x8

    GET_DEC 8, r8
    

__getInt__leave_ret_:
leave
ret

getString:

push rbp
mov rbp, rsp
sub rsp, 0x10
mov rcx, r9
mov QWORD [rbp-0x8], rcx

    call alloc
    GET_STRING [r8], r9
    

__getString__leave_ret_:
leave
ret

input_int:

push rbp
mov rbp, rsp
sub rsp, 0x10
mov rcx, r9
mov QWORD [rbp-0x8], rcx

    PRINT_STRING [r9]
    GET_DEC 8, r8
    NEWLINE
    

__input_int__leave_ret_:
leave
ret

m:

push rbp
mov rbp, rsp
sub rsp, 0x40
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x20]
mov r10, STRING_CONSTANT_3
mov r11, [WMODE_APPEND]
call FileWriter.init
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov r9, QWORD [rbp-0x20]
mov r10, STRING_CONSTANT_4
call FileWriter.write
mov rcx, 0x0
mov QWORD [rbp-0x28], rcx

mov rcx, 0x0
mov QWORD [rbp-0x30], rcx

__m__flp0x30:
mov r9, 0x3e8
call getString
mov rcx, r8
mov QWORD [rbp-0x28], rcx

mov r9, QWORD [rbp-0x20]
mov r10, QWORD [rbp-0x28]
call FileWriter.write
call newline
__m__flp_end_0x30:
mov rbx, 0x1
mov QWORD [rbp-0x38], rbx
mov rbx, QWORD [rbp-0x30]
mov QWORD [rbp-0x30], rbx

mov rdi, QWORD [rbp-0x38]

    

mov rsi, QWORD [rbp-0x30]

    
cmp rsi, rdi
jl __m__flp0x30

mov r9, QWORD [rbp-0x20]
call FileWriter.destroy

__m__leave_ret_:
leave
ret







CMAIN:
mov rbp, rsp
xor rax, rax


mov r9, rsi     ;commandline args
mov r10, rdi
align 16
mov QWORD [current_filereader], 0x0
call m
NEWLINE
ret


