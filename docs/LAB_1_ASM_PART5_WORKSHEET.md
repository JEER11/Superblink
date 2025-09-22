# Lab 1 — Part 5 Worksheet (jal/jalr)

Goal: Observe jump-and-link calls to a subroutine and returns.

What to do:
- Set breakpoints on `asm_main`, `change_value`, and the two `jal` instructions.
- Step into `change_value` and watch `ra` change (return address stored by `jal`).
- Inspect `a1` (address arg), `a3` (loaded value), `a4` (XOR mask result).
- After `ret`, confirm PC returns to the instruction after the corresponding `jal`.
- Observe memory at `0x80000000` and `0x80000004` changing each loop.

Questions:
1) Which register holds the return address after `jal`? What instruction uses it to return?
2) How do `jal` and `ret` relate to function calls in C?
3) What happens to the values at `0x80000000` and `0x80000004` over time?
