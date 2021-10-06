import os, itertools

if __name__ == "__main__":

    INSTR  = [	"SMLAL", "UMLAL", "SMULL", "UMULL", \
			    "SMLALBB", "SMLALBT", "SMLALTB", "SMLALTT", \
			    "SMLALD", "SMLALDX", "SMLSLD", "SMLSLDX", "UMAAL"] # Length 13

    OPTYPE_D = ["I", "L", "H", "F", "C"]
    #OPTYPE_N = ["I", "L", "H"]
    #OPTYPE = [i[0]+i[1]+i[2] for i in itertools.product(OPTYPE_D, OPTYPE_N, OPTYPE_N)]
    OPTYPE = [f"{D}II" for D in OPTYPE_D][:3]

    for optype in OPTYPE:
        os.system(f'echo "" > RESULT_{optype}.txt')
        os.system(f"make coder_{optype}.py")
        for instruction in INSTR:
            os.system(f"python3 coder_{optype}.py {instruction} > meta_{instruction}_{optype}.S")
            os.system(f"make meta_{instruction}_{optype}.bin")
        for instruction in INSTR:
            os.system(f"./meta_{instruction}_{optype}.bin >> RESULT_{optype}.txt")
