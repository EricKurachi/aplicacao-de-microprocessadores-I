		ORG 0
		SJMP prog
;**************************************
		ORG 0003h
		INC  R1
		CJNE R1, #00h, porta1
		INC  R0
		MOV  P0, R0
		MOV  A, R0
		MOV  SBUF, A
		JNB  TI, $
porta1: MOV  P1, R1
		RETI
;***************************************
		ORG 0013h
		INC R2
		CJNE R2, #00h, porta1
		INC R0
		MOV P0, R0
		MOV A, R0
		MOV SBUF, A
		JNB TI, $
porta2: MOV P2, R2
		RETI
;********************************************************************************
prog: 	MOV TMOD, #20h
		MOV TH1, #250
		MOV TH1, #250
		SETB TR1
		MOV SCON, #40h
        SETB EA
    	SETB EX0
    	SETB EX1
    	SETB EX0
    	SETB IT0
    	CLR  IT1
loop:   SETB EA
    	MOV R0, #00h
    	MOV R1, #00h
    	MOV R2, #00h
    	MOV P0, R0
    	MOV P1, R1
    	CJNE R2,#00h, $
    	CLR EA
    	CLR A
    	MOV DPTR, #TAB
    	MOVC A, @A+DPTR
		MOV SBUF, A
		JNB TI, $
    	SJMP loop  		
    		
TAB: db 'CONTAGEM RE-INICIADA'
		end