	ORG 0
	SJMP Prog
;*********************************************
	ORG 0003H
	SETB P1.0
	CLR P1.0
	RETI
;*********************************************
	ORG 0013H
	SETB P1.1
	CLR P1.1
	RETI
;*********************************************
Prog:   MOV P1, #00H
	SETB EX0
	SETB EX1
	CLR IT0
	CLR IT1
	SETB EA
	SJMP $
	END