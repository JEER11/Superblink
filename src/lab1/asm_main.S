.section .text
.align 2
.globl asm_main

.equ offset, 0x80000000
.equ data,   0xDEADBEEF

asm_main:
   li a1, data
   li a2, offset
   sw a1, (a2)
   lw a3, (a2)
   lh a4, (a2)
   lb a5, (a2)
   mv a2, a1
   mv a1, x0
   ret