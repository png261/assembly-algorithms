.section .data
inputA:
    .asciz "InputA: "
inputB:
    .asciz "InputB: "
inputC:
    .asciz "InputC: "
inputFormat:
    .asciz "%d"
output:
    .asciz "LCM: %d\n"

.section .bss
    .lcomm a, 4
    .lcomm b, 4

.section .text
.globl _start
_start:
    pushl $a
    pushl $inputA
    call promptInt
    addl $8, %esp

    pushl $b
    pushl $inputB
    call promptInt
    addl $8, %esp

    pushl b
    pushl a
    call lcm
    addl $8, %esp

    pushl %eax
    pushl $output
    call printf
    addl $8, %esp

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

# gcd(a, b)
.type gcd, @function
gcd:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%esp), %eax
    movl 12(%esp), %ebx

    # if(b == 0) return a
    cmpl $0, %ebx
    je gcd_return

    # %edx = %eax % %ebx
    xor %edx, %edx  
    idiv %ebx

    # gcd(b, a % b)
    pushl %edx
    pushl %ebx
    call gcd

gcd_return:
    movl %ebp, %esp
    popl %ebp
    ret


# lcm(a, b)
.type lcm, @function
lcm:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %eax
    movl 12(%ebp), %ebx
    cmpl $0, %eax
    je lcm_return

    pushl %eax
    pushl %ebx
    call gcd
    movl %eax, %ebx
    # a / gcd(a,b) * b 
    popl %eax
    div %ebx

    popl %ebx
    imull %ebx, %eax

lcm_return:
    movl %ebp, %esp
    popl %ebp
    ret
