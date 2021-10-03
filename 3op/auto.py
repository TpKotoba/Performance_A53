import os, itertools

if __name__ == "__main__":

    INSTR = [   "ADD", "SUB", "RSB", "ADC", "SBC", "RSC", \
                "AND", "BIC", "ORR", "EOR", "ASR", "LSL", "LSR", "ROR", \
                "SDIV", "UDIV", "QADD", "QSUB", "QDADD", "QDSUB", \
                "SEL", "PKHBT", "PKHTB", \
                "SXTAB", "UXTAB", "SXTAH", "UXTAH", "SXTAB16", "UXTAB16", \
                "USAD8", "MUL", "SMMUL", "SMMULR", \
                "SMUAD", "SMUADX", "SMUSD", "SMUSDX", \
                "SMULBB", "SMULBT", "SMULTB", "SMULTT", "SMULWB", "SMULWT"]
    
    SIMD_PREF = ["S", "Q", "SH", "U", "UQ", "UH"]
    SIMD_MAIN = ["ADD16", "ASX", "SAX", "SUB16", "ADD8", "SUB8"]
    INSTR += [i[0]+i[1] for i in itertools.product(SIMD_PREF, SIMD_MAIN)]

    OPTYPE=["IND3", "DRN3","DRM3", "DRD3"]

    for optype in OPTYPE:
        os.system(f'echo "" > RESULT_{optype}.txt')
        for instruction in INSTR:
            os.system(f"make meta_{instruction}_{optype}.bin")
        for instruction in INSTR:
            os.system(f"./meta_{instruction}_{optype}.bin >> RESULT_{optype}.txt")
