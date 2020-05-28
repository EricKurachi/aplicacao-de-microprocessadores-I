	ORG 0
	SJMP Prog
;************************************
	ORG 0003H
	MOV DPTR, #4000H
	MOVX A, @DPTR
	MOV DPTR, #4200H
	MOVX @DPTR, A
	RETI
;************************************
	ORG 000BH
	MOV A, P2
	MOV DPTR, #4000H
	MOVX @DPTR, A
;************************************
	ORG 0013H
	MOV DPTR, #4200H
	MOVX A, @DPTR
	MOV P1, A
;************************************
Prog:   SETB EX0
	SETB ET0
	SETB EX1
	MOV TMOD, #00H
	SETB IT0
	SETB IT1
	SETB PX0
	CLR PT0
	SETB PX1
	SETB EA
	SETB TR0
	SJMP $
	END