section .data
    text db 'Hello WOrld!', 10, 0

%macro PrintString 1

    mov rax, %1
    xor rcx, rcx

    %%PrintLoop:
        cmp byte [rax], 0
        je %%Print

        inc rcx
        inc rax

        jmp %%PrintLoop

    %%Print:
        mov rax, 1
        mov rdi, 1
        mov rsi, %1
        mov rdx, rcx
        syscall
%endmacro

%macro PrintInteger 1

    mov rax, %1
    xor rcx, rcx
    xor rdx, rdx
    mov rbx, 10
    
    %%GetNumber:
        div rbx
        add rdx, 48
        dec rsp
        mov [rsp], dl
        add rcx, 1
        xor rdx, rdx

        cmp rax, 0
        je %%Print2
        jmp %%GetNumber


    %%Print2:
        mov rax, 1
        mov rdi, 1
        mov rsi, rsp 
        mov rdx, rcx
        syscall

        add rsp, rcx

%endmacro


section .text
    global _start

_start:

    PrintString text
    PrintUnsignedInteger 321312

    mov rax, 60
    mov rdi, 0
    syscall