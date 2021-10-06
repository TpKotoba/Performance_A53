import sys

if __name__ == "__main__":
    try:
        instruction = sys.argv[1]
    except:
        instruction = 'SMLAL'
    
    print(f"""#include "macros.i"
    .syntax unified
    .text
    .global target
    .type   target, %function
    .macro core rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
    {instruction} \\rr1, \\rr2, \\rr0, \\rr0
    {instruction} \\rr1, \\rr2, \\rr0, \\rr0
    .endm
target:
    push    {{r4-r11, lr}}
loop:
    Repeat256   core, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, lr
    subs    r0, #1
    bge     loop
end:
    pop     {{r4-r11, pc}}
            """)
