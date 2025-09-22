Lab 1 – Part 2: Arithmetic and Logic Ops (Observation Sheet)

Instructions
- Build env `lab1-asm-part2` and upload.
- Debug: set a breakpoint at `asm_main` in `src/lab1/asm_main_part2.S`.
- Single-step and record register results after each instruction.

Expected checkpoints
- After `li a0,100`: a0 = 100
- After `li a1,150`: a1 = 150
- `add a2,a0,a1`: a2 = 250
- `sub a3,a1,a0`: a3 = 50
- Load patterns: a4 = 0b01010101, a5 = 0x10
- `or  a6,a4,a5`: a6 = (a4 | a5)
- `and a7,a4,a5`: a7 = (a4 & a5)
- `xor a0,a4,a5`: a0 = (a4 ^ a5)
- `xori a1,a4,0x0F`: a1 = (a4 ^ 0x0F)

Note: Observe binary/hex to see individual bits change; this matches the PDF’s demonstration of basic ALU ops and masking.