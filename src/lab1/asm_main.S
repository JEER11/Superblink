.section .text      
.align 2
.globl asm_main 

.equ offset, 0x80000000
.equ data,   0xDEADBEEF
# add program code here
asm_main:
   li a1, data             # load immediate (32-bit) 

   li a2, offset           # load offset address to a2
   sw a1, (a2)             # save a1 into the memory location specified by a2
   lw a3, (a2)             # load word (32-bit) from mem
   lh a4, (a2)             # load half word (16-bit) from mem
   lb a5, (a2)             # load byte (8-bit) from mem  

   mv a2, a1              # copy a1 to a2
   mv a1, x0              # clear a1. x0 is always '0'   
 ret