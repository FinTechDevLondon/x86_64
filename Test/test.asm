section .text
    global test
    global sum_test
    global convert_test

test:
                    ; save old base pointer
    push rbp        ; sub rsp, 8; mov [rsp] rbp
    mov rbp, rsp    ; mov rbp, rsp ;; rbp = rsp
                    ; initializes new stack frame

    add rdi, 2      ; add 2 to the first argument passed to this function
    mov rax, rdi    ; return value passed via rax

                    ; did not allocate any local variables, nothing to add to
                    ; stack pointer
                    ; the stack pointer is unchanged

    pop rbp         ; restore old base pointer

    ret             ; pop the return address off the stack and jump
                    ; call and ret modify or save the rip instruction pointer

sum_test:
    ret


convert_test:

    ; the result is store in register a
    ; first function argument is passed into register rdx

    push rbp;
    mov rbp, rsp;   ; stack frame

    xor rax, rax    ; zero rax

    ; ! do we need to zero b?

    ; modify register a directly on first iteration

    mov al, [rdi]   ; input string

    cmp al, 0       ; exit condition
    jz exit

    sub al, '0'     ; convert to decial value
                    ; this modifies the zf and cf

    ; further iterations load values in to register b
    loop:

        inc rdi         ; increment rdi
        movzx bx, [rdi] ; input string next char

        cmp bl, 0       ; exit condition
        jz exit

        sub bl, '0'     ; convert

        mov rcx, 10     ; load 10 into register c
        mul cx          ; multiply the contents of register a by 10
        add ax, bx      ; then add register b

        jmp loop        ; re-execute final part of algorithm

    exit:

    pop rbp
    ret

