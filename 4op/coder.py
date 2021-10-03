import sys

if __name__ == "__main__":

    try:
        types = sys.argv[1]
    except:
        types = 'II'
    
    acctype = types[0]
    deptype = types[1]

    head = '''import sys

if __name__ == "__main__":
    try:
        instruction = sys.argv[1]
    except:
        instruction = 'MLA'
    
    print(f"""#include "macros.i"
    .syntax unified
    .text
    .global target
    .type   target, %function
    .macro core rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7, rr8, rr9, rra, rrb, rrc, rre
'''

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

    reg1 = "\\\\rr1"
    reg2 = "\\\\rr2" if (acctype != "O") else "\\\\rr1"
    l1, l2 = f"    {{instruction}}	{reg1}, ", f"    {{instruction}}	{reg2}, "
    if acctype == "I":
        r1, r2 = "\\\\rr0", "\\\\rr0"
    elif acctype == "P":
        r1, r2 = "\\\\rr1", "\\\\rr2"
    elif acctype == "X":
        r1, r2 = "\\\\rr2", "\\\\rr1"
    else:
        r1, r2 = "\\\\rr1", "\\\\rr1"
    if deptype == "I":
        m1, m2 = f"\\\\rr0, \\\\rr0, ", f"\\\\rr0, \\\\rr0, "
    elif deptype == "N":
        m1, m2 = f"{ reg2}, \\\\rr0, ", f"{ reg1}, \\\\rr0, "
    elif deptype == "M":
        m1, m2 = f"\\\\rr0, { reg2}, ", f"\\\\rr0, { reg1}, "
    else:
        m1, m2 = f"{ reg2}, { reg2}, ", f"{ reg1}, { reg1}, "
    
    command1 = l1+m1+r1+"\n"
    command2 = l2+m2+r2+"\n"

    print(head+command1+command2+foot)
