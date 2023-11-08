.section .data
inputA:
    .asciz "Input a: "
inputD:
    .asciz "Input d: "
inputN:
    .asciz "Input n: "
inputFormat:
    .asciz "%d"
output:
    .asciz "%d\n"

.section .bss
    .lcomm a, 4
    .lcomm d, 4
    .lcomm n, 4

.section .text
.globl _start
_start:
    pushl $a
    pushl $inputA
    call promptInt
    addl $8, %esp

    pushl $d
    pushl $inputD
    call promptInt
    addl $8, %esp

    pushl $n
    pushl $inputN
    call promptInt
    addl $8, %esp

    pushl n
    pushl d
    pushl a
    call printArithmeticSequence
    addl $12, %esp

    pushl $0
    call exit

# promptInt(string, pointer)
.type promptInt, @function

promptInt:
    pushl %ebp
    movl %esp, %ebp

    pushl 8(%ebp)
    call printf
    addl $4, %esp

    pushl 12(%ebp)
    pushl $inputFormat
    call scanf
    addl $8, %esp

    movl %ebp, %esp
    popl %ebp
    ret

# printGeometricSequence(a, r, n)
.type printArithmeticSequence, @function
printArithmeticSequence: 
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %eax
    movl 12(%ebp), %ebx
    movl 16(%ebp), %ecx

loop:
    pushl %ecx
    pushl %eax

    pushl %eax
    pushl $output
    call printf
    addl $8, %esp

    popl %eax
    addl %ebx, %eax

    popl %ecx
    loop loop

    movl %ebp, %esp
    popl %ebp
    ret

