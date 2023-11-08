.section .data
promptInput:
    .asciz "Input n: "
scanNumber:
    .asciz "%d"
printNumber:
    .asciz "%d \n"

.section .bss
    .lcomm n, 4

.section .text
.globl _start
_start: 
input:
    pushl $promptInput
    call printf
    addl $4, %esp

    pushl $n
    pushl $scanNumber
    call scanf
    addl $4, %esp

    pushl n
    call fibonacci
    addl $4, %esp

    pushl $0
    call exit


# fibonacci(n)
.type fibonacci, @function
fibonacci:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp) , %ecx
    movl $0, %eax # prev
    movl $1, %ebx # current

loop:
    pushl %ecx
    pushl %ebx
    pushl %eax

    pushl %eax
    pushl $printNumber
    call printf
    addl $8, %esp

    popl %eax
    popl %ebx

    # current += prev
    addl %eax, %ebx

    # prev = current - prev
    movl %ebx, %edx
    subl %eax, %edx
    movl %edx, %eax

    popl %ecx
    decl %ecx
    cmpl $0, %ecx
    jge loop

    movl %ebp, %esp
    popl %ebp
    ret



