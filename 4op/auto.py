import os, itertools

if __name__ == "__main__":

    INSTR = [   "MLA", "MLS", \
			    "SMLABB", "SMLABT", "SMLATB", "SMLATT", "SMLAWB", "SMLAWT", \
			    "SMLAD", "SMLADX", "SMLSD", "SMLSDX", \
			    "SMMLA", "SMMLAR", "SMMLS", "SMMLSR", \
			    "USADA8"] # Length 17

    OPTYPE_ACC = ["I", "X", "O", "P"]
    OPTYPE_DEP = ["I", "N", "M", "D"]
    OPTYPE = [i[0]+i[1] for i in itertools.product(OPTYPE_ACC, OPTYPE_DEP)]

    for optype in OPTYPE:
        os.system(f'echo "" > RESULT_{optype}.txt')
        os.system(f"make coder_{optype}.py")
        for instruction in INSTR:
            os.system(f"python3 coder_{optype}.py {instruction} > meta_{instruction}_{optype}.S")
            os.system(f"make meta_{instruction}_{optype}.bin")
        for instruction in INSTR:
            os.system(f"./meta_{instruction}_{optype}.bin >> RESULT_{optype}.txt")
