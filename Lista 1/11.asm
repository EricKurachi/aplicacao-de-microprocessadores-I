	ORG 0
	SJMP Prog
;********************************
        ORG 000BH
        CPL P1.7
	MOV TH0, #5FH
	MOV TL0, #1CH
	RETI
;********************************
Prog:	SETB EA
	SETB ET0
	MOV TMOD, #00H
	MOV TH0, #5FH
	MOV TL0, #1CH
	SETB TR0
	SJMP $
        END