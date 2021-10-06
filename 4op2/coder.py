import sys

if __name__ == "__main__":

    try:
        types = sys.argv[1]
    except:
        types = 'III'
    
    head = f'''import sys

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
    .macro core rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre'''

    foot = '''    .endm
target:
    push    {{r4-r11, lr}}
loop:
    Repeat256   core, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, lr
    subs    r0, #1
    bge     loop
end:
    pop     {{r4-r11, pc}}
            """)'''
    

    DTYPEMAP = {"I": {3:3, 4:4}, \
                "L": {3:1, 4:4}, \
                "H": {3:3, 4:2}, \
                "F": {3:1, 4:2}, \
                "C": {3:2, 4:1}
    }
    
    NTYPEMAP = {"I": {0:0, 1:0}, \
                "L": {0:3, 1:1}, \
                "H": {0:4, 1:2}
    }
    
    r = [f"\\\\rr{i}" for i in range(3)] + [f"\\\\rr{DTYPEMAP[types[0]][i]}" for i in (3, 4)]
    n = [r[NTYPEMAP[types[1]][i]] for i in (0, 1)]
    m = [r[NTYPEMAP[types[2]][i]] for i in (0, 1)]

    d = [f"    {{instruction}} {r[1+2*i]}, {r[2+2*i]}, {n[i]}, {m[i]}" for i in (0, 1)]

    print(head)
    print(*d, sep="\n")
    print(foot)