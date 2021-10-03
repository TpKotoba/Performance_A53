#ifndef MACROS_I
#define MACROS_I

.macro Repeat4 macro, rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
    \macro \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    \macro \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    \macro \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    \macro \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
.endm

.macro Repeat16 macro, rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
    Repeat4 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat4 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat4 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat4 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
.endm

.macro Repeat64 macro, rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
    Repeat16 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat16 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat16 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat16 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
.endm

.macro Repeat256 macro, rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
    Repeat64 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat64 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat64 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    Repeat64 \macro, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
.endm

.macro DRN2_312 instruction, rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
    DRN2_K13 \instruction, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    DRN2_K13 \instruction, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    DRN2_K13 \instruction, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
    DRN2_K13 \instruction, \rr0, \rr1, \rr2, \rr3, \rr4, \rr5, \rr6, \rr7, \rr8, \rr9, \rra, \rrb, \rrc, \rre
.endm

.macro DRN2_K13 instruction, rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
    \instruction \rr1, \rre
    \instruction \rr2, \rr1
    \instruction \rr3, \rr2
    \instruction \rr4, \rr3
    \instruction \rr5, \rr4
    \instruction \rr6, \rr5
    \instruction \rr7, \rr6
    \instruction \rr8, \rr7
    \instruction \rr9, \rr8
    \instruction \rra, \rr9
    \instruction \rrb, \rra
    \instruction \rrc, \rrb
    \instruction \rre, \rrc

    \instruction \rr2, \rre
    \instruction \rr4, \rr2
    \instruction \rr6, \rr4
    \instruction \rr8, \rr6
    \instruction \rra, \rr8
    \instruction \rrc, \rra
    \instruction \rr1, \rrc
    \instruction \rr3, \rr1
    \instruction \rr5, \rr3
    \instruction \rr7, \rr5
    \instruction \rr9, \rr7
    \instruction \rrb, \rr9
    \instruction \rre, \rrb

    \instruction \rr3, \rre
    \instruction \rr6, \rr3
    \instruction \rr9, \rr6
    \instruction \rrc, \rr9
    \instruction \rr2, \rrc
    \instruction \rr5, \rr2
    \instruction \rr8, \rr5
    \instruction \rrb, \rr8
    \instruction \rr1, \rrb
    \instruction \rr4, \rr1
    \instruction \rr7, \rr4
    \instruction \rra, \rr7
    \instruction \rre, \rra

    \instruction \rr4, \rre
    \instruction \rr8, \rr4
    \instruction \rrc, \rr8
    \instruction \rr3, \rrc
    \instruction \rr7, \rr3
    \instruction \rrb, \rr7
    \instruction \rr2, \rrb
    \instruction \rr6, \rr2
    \instruction \rra, \rr6
    \instruction \rr1, \rra
    \instruction \rr5, \rr1
    \instruction \rr9, \rr5
    \instruction \rre, \rr9

    \instruction \rr5, \rre
    \instruction \rra, \rr5
    \instruction \rr2, \rra
    \instruction \rr7, \rr2
    \instruction \rrc, \rr7
    \instruction \rr4, \rrc
    \instruction \rr9, \rr4
    \instruction \rr1, \rr9
    \instruction \rr6, \rr1
    \instruction \rrb, \rr6
    \instruction \rr3, \rrb
    \instruction \rr8, \rr3
    \instruction \rre, \rr8

    \instruction \rr6, \rre
    \instruction \rrc, \rr6
    \instruction \rr5, \rrc
    \instruction \rrb, \rr5
    \instruction \rr4, \rrb
    \instruction \rra, \rr4
    \instruction \rr3, \rra
    \instruction \rr9, \rr3
    \instruction \rr2, \rr9
    \instruction \rr8, \rr2
    \instruction \rr1, \rr8
    \instruction \rr7, \rr1
    \instruction \rre, \rr7
.endm

#endif