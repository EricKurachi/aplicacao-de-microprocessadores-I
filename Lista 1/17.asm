	ORG 0
	SJMP Prog
;************************************
	ORG 0003
	JB P1.1, Final
	SETB P1.0
Final:  RETI
;************************************
	ORG 0013H
	JNB P1.1, Fim
	CLR P1.0
Fim:    RETI
;************************************
Prog:   SETB EX0
	SETB EX1
	CLR  PX0
	SETB PX1
	CLR  IT1
	CLR  IT0
	SETB EA
	SJMP $
	END