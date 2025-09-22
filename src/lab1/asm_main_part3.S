.section .text
.align 2
.globl asm_main

# Part 3: Demonstrate unconditional branches and label addresses
# Each label below (spot1..spot4, exit) marks an address. Jumps change the PC.

asm_main:
    j spot1            # jump to spot1

spot1:
    j spot4            # jump to spot4

spot4:
    j spot2            # jump to spot2

spot2:
    j spot3            # jump to spot3

spot3:
    j exit             # jump to exit

exit:
    ret                # return to C caller