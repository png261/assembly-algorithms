.section .data
output: 
    .asciz "%d\n"

inputFormat: 
    .asciz "%d"

array:
    .int 4 
    .int 3 
    .int 2 
    .int 1 

arraySize:
    .int 4

.section .text
.globl _start

_start:
    pushl arraySize
    pushl $array
    call bubbleSort
    addl $8, %esp

    pushl arraySize
    pushl $array
    call printArray
    addl $8, %esp

    pushl $0
    call exit

# bubbleSort(array_base, array_size)
.type bubbleSort, @function
bubbleSort:
    pushl %ebp
    movl %esp, %ebp

    movl 12(%esp), %ecx
outerLoop:
    pushl %ecx

    movl 8(%ebp), %esi
    innerLoop:
        pushl %ecx

        movl (%esi), %eax
        cmpl 4(%esi), %eax
        jl continue

        xchg %eax, 4(%esi) 
        movl %eax, (%esi) 

    continue:
        popl %ecx
        addl $4, %esi
        loop innerLoop

    popl %ecx
    loop outerLoop

    movl %ebp, %esp
    popl %ebp
    ret


# printArray(array, array_size)
.type printArray @function

printArray:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi
    movl 12(%ebp), %ecx 
loop:
    pushl %ecx
    
    pushl (%esi)
    pushl $output
    call printf
    addl $8, %esp

    popl %ecx
    addl $4, %esi
    loop loop

    movl %ebp, %esp
    popl %ebp
    ret

