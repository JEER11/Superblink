.section .text
.align 2
.globl asm_main

# Part 5: Demonstrate jump-and-link (jal) and return (jalr via ret)
# Two addresses are treated as memory locations to be modified by a subroutine.

.equ value1, 0x80000000     # treated as an address
.equ value2, 0x80000004     # treated as an address

asm_main:
    # Call subroutine to modify content at value1
    li a1, value1           # a1 holds the address argument
    jal change_value        # call subroutine, return address stored in ra

    # Call subroutine to modify content at value2
    li a1, value2
    jal change_value

    # Repeat forever to observe repeated calls/returns
    j asm_main

change_value:
    # Operate on the value stored at the address in a1
    lw a3, 0(a1)            # load word from memory location
    addi a3, a3, 1          # increment the content
    xori a4, a3, 0xAF       # XOR with 0xAF (arbitrary mask)
    and  a3, a4, a3         # AND mask with previous result
    sw a3, 0(a1)            # save the result back to memory
    ret                     # return to caller (jalr x0, 0(ra))
