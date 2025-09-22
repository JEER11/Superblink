.section .text
.align 2
.globl asm_main

# Part 4: Conditional branching demo
# Change the immediate for a1 below (e.g., 0x0, 0x1, 0xDEADBEEF) and observe which branch is taken.

asm_main:
    li a1, 0xDEADBEEF      # change this value to see different paths
    li a2, 0xDEADBEEF

    beq  a1, a2, spot1     # branch if a1 == a2
    beqz a1, spot2         # branch if a1 == 0
    bne  a1, a2, spot3     # branch if a1 != a2

spot1:
    ret

spot2:
    ret

spot3:
    ret