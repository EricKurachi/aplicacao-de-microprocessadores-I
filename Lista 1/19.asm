	ORG 0
	SJMP Prog
;*******************************
	ORG 0003
	SJMP Ext
;*******************************
Prog:   SETB EX0
	SETB IT0
	SETB EA
	CLR A
Loop:	SJMP Loop
;*******************************
Ext:    MOV R0, P1
	CJNE R0, #00001100B, Dez
	ADD A, #05D
Dez:	CJNE R0, #00001000B, Vinte
	ADD A, #10D
Vinte:	CJNE R0, #00000000B, Comp
	ADD A, #20D
Comp:   CJNE A, #20D, Test
Test:	JNC Troco
	SJMP Fim
Troco:  SETB P2.0
	CLR P2.0
	CJNE A, #20D, Cincot
	SJMP Fim
Cincot: CJNE A, #25D, Dezt
	SETB P2.1
	CLR P2.1
	SJMP Fim
Dezt:	CJNE A, #30D, Quinzet
	SETB P2.2
	CLR P2.2
	SJMP Fim
Quinzet:SETB P2.1
	CLR P2.1
	SETB P2.0
	CLR P2.0
Fim:    RETI
END
 