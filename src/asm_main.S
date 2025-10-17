.section .text
.align 2
.globl asm_main

/* -------------Part 1 ----------------
.equ offset, 0x80000000
.equ data, 0xDEADBEEF

add program code here
asm_main:
    li a1, data # load immediate (32-bit)

    li a2, offset # load offset address to a2
    sw a1, (a2) # save a1 into the memory location specified by a2
    lw a3, (a2) # load word (32-bit) from mem
    lh a4, (a2) # load half word (16-bit) from mem
    lb a5, (a2) # load byte (8-bit) from mem

    mv a2, a1 # copy a1 to a2
    mv a1, x0 # clear a1. x0 is always '0'
ret
*/ 




/* # -------------Part 2 ---------------
.equ data1, 0x01010101
.equ data2, 0x10101010

# add program code here
asm_main:
    li a1, 100            # load 100 into a1
    li a2, 150            # load 150 into a2
    add a3, a2, a1              # add a1 and a2 and place it in a3
    sub a4, a2, a1              # subtract a2-a1 and place it in a4
    addi a1, a1, 100            # add immediate to a1 and place the result into a1

    li a1, data1                # load immediate
    li a2, data2
    and a3, a2, a1              # AND both a2 and a1 and place it into a3
    or a4, a2, a1               # OR a2 and a1
    xor a5, a2, a1              # XOR a2 and a1
                            # xor is widely used in microprocesors for masking the registers and insulating
                            # the bit that is of interest
ret
*/





/*# ------Part 3 ------------
# add program code here
asm_main:
    j spot1
spot1:
    j spot4
spot2:
    j exit
spot3:
    j spot2
spot4:
    j spot3
exit:
    ret
*/




/*# ------Part 4 ------------
# add program code here
asm_main:
    li a1, 0xdeadbeef       # keep changing a1 to observe different branching
    li a2, 0xdeadbeef
    beq a1, a2, spot1       # branch if a1 and a2 are equal
    beqz a1, spot2          # branch if a1 is 0
    bne a1, a2, spot3       # branch if a1 is not equal to a2
spot1:
    ret
spot2:
    ret
spot3:
    ret
*/


# ------Part 5 ------------
.equ value1, 0x80000000     # value1 and value2 are treated as addresses
.equ value2, 0x80000010
# add program code here
asm_main:
    li a2, value1
    jal change_value        # call change value for value1
    li a2, value2
    jal change_value        # call change value for value2
    j asm_main              # do it again

change_value:
    lw a3, (a2)             # load the content of the memory

# operating on retrieved date from memory location a2
    addi a3, a3, 1           # increment the content
    xor a3, a3, a2           # XOR the adress with the incremented content
    li a4, 0xFF              # create a mask
    and a4, a4, a3 # AND mask and previous result in a3

# these operations are just arbitrary set of operations that do not
# accomplish anything meaningful. It only changes the value
# retrieved from memory location
    sw a4, (a2)             # save the result back to the memory
    ret
# will use saved return address to resume operation in asm_main
