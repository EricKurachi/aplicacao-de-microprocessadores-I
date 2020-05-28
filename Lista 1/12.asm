        ORG 0
        SJMP Prog
;************************
        ORG 000BH
        DEC R0
        MOV TH0, #003CH
        MOV TL0, #00AFH
        RETI
;************************
Prog:   SETB EA
        SETB ET0
        MOV R0, #100D
        MOV TMOD, #00000001B
        MOV TH0, #003CH
        MOV TL0, #00AFH
        SETB TR0
ATRASO: CJNE R0, #00D, ATRASO
        END
      