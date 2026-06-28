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


section .text
    global _start

_start:

    PrintString text

    mov rax, 60
    mov rdi, 0
    syscall