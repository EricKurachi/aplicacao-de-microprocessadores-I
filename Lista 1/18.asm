	ORG 0
	SJMP Prog
;*************************************
	ORG 0003
	CLR P2.6
	SETB P1.2
	ACALL Atraso ;500 ms
	SETB P2.6
	CLR P2.7
	RETI
;*************************************
	ORG 0013H
	CLR P2.6
	SETB P1.0
	ACALL Atraso ;500 ms
	DEC R0
	RETI
;*************************************
Prog:	MOV R0, #03
	SETB P2.7
	SETB P2.6
	SETB IT0
	SETB IT1
	SETB EX0
	SETB EX1
	SETB EA
Loop:	CJNE R0, #00, Loop
	CLR EA
	SJMP $
	END