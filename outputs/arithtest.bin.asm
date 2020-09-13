
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
STRING_CONSTANT_0: db `Memory error encountered`, 0
STRING_CONSTANT_1: db `%f`, 0
STRING_CONSTANT_2: db `[ `, 0
STRING_CONSTANT_3: db `%i, `, 0
STRING_CONSTANT_4: db `%i ]\n`, 0
FLT_CONSTANT_0: dq __float32__(0.356)
FLT_CONSTANT_1: dq __float32__(235.2)
STRING_CONSTANT_5: db `Floored: %u\n`, 0
STRING_CONSTANT_6: db `Rounded: %u\n`, 0
STRING_CONSTANT_7: db `Ceiled: %u\n`, 0
STRING_CONSTANT_8: db `SQRTED: %lf\n`, 0
STRING_CONSTANT_9: db `======================`, 0
STRING_CONSTANT_10: db `Vector Tests:`, 0
STRING_CONSTANT_11: db `======================`, 0
STRING_CONSTANT_12: db `I: %i\r`, 0
STRING_CONSTANT_13: db `======================`, 0
STRING_CONSTANT_14: db `String Tests:`, 0
STRING_CONSTANT_15: db `======================`, 0
STRING_CONSTANT_16: db `This is the beggining of a string object. `, 0
STRING_CONSTANT_17: db `And this is a second sentance I just appended.`, 0
__FLT_STANDARD_1: dq __float32__(1.0)
__isincluded__MEMORY_: dq 0x96c6
__PRINTFFLOAT: db `%f`, 0
FLT_STANDARD_ZERO: dq __float32__(0.0)
isFloat: dq 0x1



section .bss
currentVector: resb 0x8
globtest: resb 0x8
globalfloat: resb 0x8



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

        
Vector:

push rbp
mov rbp, rsp
sub rsp, 0x8

mov rdi, 0x30
call malloc
add rsp, 4
test rax, rax ; check for error
mov byte[rax+0x30], 0x0
mov r8, rax
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


   xor r11, r11
   xor r12, r12
   mov rdi, r9
   call malloc
   xor r11, r11
   xor r12, r12
   add rsp, 4
   test rax, rax ; check for error

   mov byte[rax+r9], 0x0

   mov r8, rax




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

Vector.init:

push rbp
mov rbp, rsp
sub rsp, 0x20
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx

mov rax, 0x1
mov rcx, QWORD [rbp-0x10]
imul rcx
mov r9,rax
call alloc
mov rcx, r8
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x18]
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rax, 0x0
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rax, 0x0
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rax, QWORD [rbp-0x10]
mov [rbx], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __Vector.init__leave_ret_

__Vector.init__leave_ret_:
leave
ret

Vector.resize:

push rbp
mov rbp, rsp
sub rsp, 0x30
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

mov rcx, 0x0
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x28], rcx

mov r9, QWORD [rbp-0x18]
mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov r10,rax
call reallocate
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov r14, QWORD [rbp-0x20]
mov r15, 0x0
cmp r14, r15
push __cmpblock__Vector.resize__0x259
je memerror
add rsp, 0x8
__cmpblock__Vector.resize__0x259:

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x20]
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rax, QWORD [rbp-0x10]
mov [rbx], rax
mov r8, QWORD [rbp-0x8]
cvtsi2ss xmm8,r8
jmp __Vector.resize__leave_ret_

__Vector.resize__leave_ret_:
leave
ret

expand_current_vector:

push rbp
mov rbp, rsp
sub rsp, 0x8
mov r9, [currentVector]
call Vector.expand

__expand_current_vector__leave_ret_:
leave
ret

Vector.expand:

push rbp
mov rbp, rsp
sub rsp, 0x30
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov rbx, QWORD [rbp-0x10]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x10], rbx

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rax, QWORD [rbp-0x10]
mov [rbx], rax
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov rcx, 0x0
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x28], rcx

mov r9, QWORD [rbp-0x18]
mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov r10,rax
call reallocate
mov rcx, r8
mov QWORD [rbp-0x20], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rax, QWORD [rbp-0x20]
mov [rbx], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Vector.expand__leave_ret_

__Vector.expand__leave_ret_:
leave
ret

Vector.push:

push rbp
mov rbp, rsp
sub rsp, 0x38
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rbx, QWORD [rbp-0x8]
mov [currentVector], rbx
mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov rcx, 0x0
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x28], rcx

mov rcx, 0x0
mov QWORD [rbp-0x30], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rcx, [rbx]
mov QWORD [rbp-0x20], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rcx, [rbx]
mov QWORD [rbp-0x30], rcx

mov r14, QWORD [rbp-0x20]
mov r15, QWORD [rbp-0x30]
cmp r14, r15
push __cmpblock__Vector.push__0x2d7
jge expand_current_vector
add rsp, 0x8
__cmpblock__Vector.push__0x2d7:
mov rcx, r8
mov QWORD [rbp-0x30], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rax, QWORD [rbp-0x30]
mov [rbx], rax

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov rax, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov rax,rax

mov rbx, QWORD [rbp-0x18]

    
mov r15, QWORD [rbp-0x10]
mov QWORD [rbx+rax], r15
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
add rbx, rcx
mov QWORD [rbp-0x20], rbx

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rax, QWORD [rbp-0x20]
mov [rbx], rax
mov r8, QWORD [rbp-0x10]
cvtsi2ss xmm8,r8
jmp __Vector.push__leave_ret_

__Vector.push__leave_ret_:
leave
ret

Vector.pop:

push rbp
mov rbp, rsp
sub rsp, 0x30
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rbx, QWORD [rbp-0x8]
mov [currentVector], rbx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx

mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rcx, [rbx]
mov QWORD [rbp-0x20], rcx

mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
sub rbx, rcx
mov QWORD [rbp-0x20], rbx
mov rcx, 0x0
mov QWORD [rbp-0x28], rcx

mov rax, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax

mov rbx, QWORD [rbp-0x10]

    
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15

mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x28
mov rax, QWORD [rbp-0x20]
mov [rbx], rax
mov r8, QWORD [rbp-0x28]
cvtsi2ss xmm8,r8
jmp __Vector.pop__leave_ret_

__Vector.pop__leave_ret_:
leave
ret

Vector.at:

push rbp
mov rbp, rsp
sub rsp, 0x30
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

mov rcx, 0x0
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x28], rcx

mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov rax,rax

mov rbx, QWORD [rbp-0x18]

    
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r8, QWORD [rbp-0x20]
cvtsi2ss xmm8,r8
jmp __Vector.at__leave_ret_

__Vector.at__leave_ret_:
leave
ret

Vector.set:

push rbp
mov rbp, rsp
sub rsp, 0x30
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, r11
mov QWORD [rbp-0x18], rcx
mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov rcx, 0x0
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x28], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x20], rcx

mov rax, QWORD [rbp-0x10]
mov rcx, QWORD [rbp-0x28]
imul rcx
mov rax,rax

mov rbx, QWORD [rbp-0x20]

    
mov r15, QWORD [rbp-0x18]
mov QWORD [rbx+rax], r15

__Vector.set__leave_ret_:
leave
ret

Vector.print:

push rbp
mov rbp, rsp
sub rsp, 0x40
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x18
mov rcx, [rbx]
mov QWORD [rbp-0x10], rcx

mov rcx, 0x0
mov QWORD [rbp-0x18], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x20
mov rcx, [rbx]
mov QWORD [rbp-0x20], rcx

mov r9, STRING_CONSTANT_2
mov r10, 0x0
call printformat
mov rcx, 0x0
mov QWORD [rbp-0x28], rcx

mov rbx, 0x0
mov QWORD [rbp-0x30], rbx
__Vector.print__flp0x30:
mov rax, QWORD [rbp-0x30]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax

mov rbx, QWORD [rbp-0x10]

    
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r9, STRING_CONSTANT_3
mov r10, QWORD [rbp-0x28]
call printformat
__Vector.print__flp_end_0x30:
mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
sub rbx, rcx
mov QWORD [rbp-0x38], rbx

mov rax, QWORD [rbp-0x30]

    
inc rax
mov rcx, rax
mov QWORD [rbp-0x30], rcx


mov rdi, QWORD [rbp-0x38]

    

mov rsi, QWORD [rbp-0x30]

    
cmp rsi, rdi
jl __Vector.print__flp0x30

mov rbx, QWORD [rbp-0x20]
mov rcx, 0x1
sub rbx, rcx
mov QWORD [rbp-0x20], rbx
mov rax, QWORD [rbp-0x20]
mov rcx, QWORD [rbp-0x18]
imul rcx
mov rax,rax

mov rbx, QWORD [rbp-0x10]

    
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x28], r15
mov r9, STRING_CONSTANT_4
mov r10, QWORD [rbp-0x28]
call printformat

__Vector.print__leave_ret_:
leave
ret

Vector.size:

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
jmp __Vector.size__leave_ret_

__Vector.size__leave_ret_:
leave
ret

Vector.pushes:

push rbp
mov rbp, rsp
sub rsp, 0x48
mov rcx, r9
mov QWORD [rbp-0x8], rcx
mov rcx, r10
mov QWORD [rbp-0x10], rcx
mov rcx, r11
mov QWORD [rbp-0x18], rcx
mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

mov rcx, 0x0
mov QWORD [rbp-0x28], rcx

mov rcx, 0x0
mov QWORD [rbp-0x30], rcx


mov rbx, QWORD [rbp-0x8]

    
add rbx, 0x30
mov rcx, [rbx]
mov QWORD [rbp-0x30], rcx

mov rcx, 0x0
mov QWORD [rbp-0x38], rcx

__Vector.pushes__flp0x38:
mov rax, QWORD [rbp-0x38]
mov rcx, QWORD [rbp-0x30]
imul rcx
mov QWORD [rbp-0x28], rax
mov rax, QWORD [rbp-0x28]

mov rbx, QWORD [rbp-0x10]

    
mov r15,QWORD [rbx+rax]
mov QWORD [rbp-0x20], r15
mov r9, QWORD [rbp-0x8]
mov r10, QWORD [rbp-0x20]
call Vector.push
__Vector.pushes__flp_end_0x38:
mov rbx, QWORD [rbp-0x18]
mov QWORD [rbp-0x40], rbx

mov rax, QWORD [rbp-0x38]

    
inc rax
mov rcx, rax
mov QWORD [rbp-0x38], rcx


mov rdi, QWORD [rbp-0x40]

    

mov rsi, QWORD [rbp-0x38]

    
cmp rsi, rdi
jl __Vector.pushes__flp0x38


__Vector.pushes__leave_ret_:
leave
ret

Vector.destroy:

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
jmp __Vector.destroy__leave_ret_

__Vector.destroy__leave_ret_:
leave
ret

testmod:

push rbp
mov rbp, rsp
sub rsp, 0x8
mov r8, 0x5a
cvtsi2ss xmm8,r8
jmp __testmod__leave_ret_

__testmod__leave_ret_:
leave
ret

fltTest:

push rbp
mov rbp, rsp
sub rsp, 0x18
movss [rbp-0x8], xmm0
movss xmm15, [rbp-0x8]
mov rcx, 0x3
cvtsi2ss xmm14, rcx
mulss xmm15, xmm14
movss xmm10, xmm15
movss xmm15, xmm10
movss xmm14, [FLT_CONSTANT_0]
addss xmm15, xmm14
movss xmm10, xmm15
movss xmm15, xmm10
mov rcx, 0x2
cvtsi2ss xmm14, rcx
divss xmm15, xmm14
movss [rbp-0x10], xmm15
movss xmm8,  [rbp-0x10]
cvttss2si r8, xmm8
jmp __fltTest__leave_ret_

__fltTest__leave_ret_:
leave
ret

m:

push rbp
mov rbp, rsp
sub rsp, 0x68
movss xmm10, [FLT_CONSTANT_1]
movss  [rbp-0x8], xmm10
mov rcx, 0x0
mov QWORD [rbp-0x10], rcx

mov rcx, 0x0
mov QWORD [rbp-0x18], rcx

mov rcx, 0x0
mov QWORD [rbp-0x20], rcx

movss xmm0,  [rbp-0x8]
call floor
mov rcx, r8
mov QWORD [rbp-0x10], rcx

mov r9, STRING_CONSTANT_5
mov r10, QWORD [rbp-0x10]
call printformat
movss xmm0,  [rbp-0x8]
call round
mov rcx, r8
mov QWORD [rbp-0x20], rcx

mov r9, STRING_CONSTANT_6
mov r10, QWORD [rbp-0x20]
call printformat
movss xmm0,  [rbp-0x8]
call ceil
mov rcx, r8
mov QWORD [rbp-0x18], rcx

mov r9, STRING_CONSTANT_7
mov r10, QWORD [rbp-0x18]
call printformat
movss  xmm10, [FLT_STANDARD_ZERO]
movss [rbp-0x28], xmm10
movss xmm0,  [rbp-0x8]
call sqrtflt
movss [rbp-40], xmm8
mov r9, STRING_CONSTANT_8
movss xmm1,  [rbp-0x28]
call print_formatfloat
movss  xmm10, [FLT_STANDARD_ZERO]
movss [rbp-0x30], xmm10
movss xmm0,  [rbp-0x28]
call fltTest
movss [rbp-48], xmm8
movss xmm0,  [rbp-0x30]
call print_floatln
mov r9, STRING_CONSTANT_9
call print_string
mov r9, STRING_CONSTANT_10
call print_string
mov r9, STRING_CONSTANT_11
call print_string
mov rcx, 0x0
mov QWORD [rbp-0x38], rcx

call Vector
mov rcx, r8
mov QWORD [rbp-0x38], rcx

mov r9, QWORD [rbp-0x38]
mov r10, 0x8
call Vector.init
mov r9, QWORD [rbp-0x38]
mov r10, 0x45
call Vector.push
mov rcx, 0x0
mov QWORD [rbp-0x40], rcx

mov r9, QWORD [rbp-0x38]
mov r10, 0x0
call Vector.at
mov rcx, r8
mov QWORD [rbp-0x40], rcx

mov rbx, 0x0
mov QWORD [rbp-0x48], rbx
__m__flp0x48:
mov r9, QWORD [rbp-0x38]
mov r10, QWORD [rbp-0x48]
call Vector.push
mov r9, STRING_CONSTANT_12
mov r10, QWORD [rbp-0x48]
call printformat
__m__flp_end_0x48:
mov rbx, 0x1f4
mov QWORD [rbp-0x50], rbx

mov rax, QWORD [rbp-0x48]

    
inc rax
mov rcx, rax
mov QWORD [rbp-0x48], rcx


mov rdi, QWORD [rbp-0x50]

    

mov rsi, QWORD [rbp-0x48]

    
cmp rsi, rdi
jl __m__flp0x48

mov r9, QWORD [rbp-0x38]
call Vector.print
mov r9, QWORD [rbp-0x38]
call Vector.destroy
mov r9, STRING_CONSTANT_13
call print_string
mov r9, STRING_CONSTANT_14
call print_string
mov r9, STRING_CONSTANT_15
call print_string
mov rcx, 0x0
mov QWORD [rbp-0x58], rcx

call String
mov rcx, r8
mov QWORD [rbp-0x58], rcx

mov r9, QWORD [rbp-0x58]
mov r10, STRING_CONSTANT_16
call String.init
mov rcx, 0x0
mov QWORD [rbp-0x60], rcx

mov r9, QWORD [rbp-0x58]
mov r10, STRING_CONSTANT_17
call String.append_chars
mov r9, QWORD [rbp-0x58]
call String.printable
mov rcx, r8
mov QWORD [rbp-0x60], rcx

mov r9, QWORD [rbp-0x60]
call print_string
mov r9, QWORD [rbp-0x58]
call String.destroy

__m__leave_ret_:
leave
ret







CMAIN:
mov rbp, rsp
xor rax, rax


mov r9, rsi     ;commandline args
mov r10, rdi
align 16
mov QWORD [currentVector], 0x0
mov QWORD [globtest], 0x0
mov QWORD [globalfloat], 0x0
call m
NEWLINE
ret


