.section .text
.align 2
.globl asm_main

# Part 2: arithmetic and logic operations demo
.equ data1, 0b01010101      # example bit pattern
.equ data2, 0x00000010      # mask or operand
.equ data3, 0x0000000F      # mask for xori example

asm_main:
    # Load immediates
    li a0, 100              # load 100 into a0
    li a1, 150              # load 150 into a1

    # Basic arithmetic
    add a2, a0, a1          # a2 = a0 + a1 = 250
    sub a3, a1, a0          # a3 = a1 - a0 = 50

    # Logical operations on example data
    li a4, data1            # a4 = 0b01010101
    li a5, data2            # a5 = 0x10
    or  a6, a4, a5          # a6 = a4 OR a5
    and a7, a4, a5          # a7 = a4 AND a5
    xor a0, a4, a5          # a0 = a4 XOR a5
    xori a1, a4, data3      # a1 = a4 XOR 0x0F (mask low 4 bits)

    ret