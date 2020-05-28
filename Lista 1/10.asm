	ORG 0
        SJMP Prog
;**********************************
        ORG 001BH
	INC P1
	MOV TH1, #00H
	MOV TL1, #00H
	RETI
;**********************************
	MOV P1, #00H
Prog:   SETB ET1
        MOV TH1, #00H
        MOV TL1, #00H
        MOV TMOD, #01100000B
        SETB EA
Cont:   ACALL Atraso
        CLR P3.5
        SETB P3.5
        SJMP Cont
;***********************************
Atraso: mov R1,#49d
Loop:   mov R0,#5d 
	djnz R0, $
	djnz R1, Loop 
	RET
END