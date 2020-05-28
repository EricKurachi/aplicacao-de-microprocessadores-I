		ORG 0
		MOV P2, #0FFH
		MOV TMOD, #20H
		MOV TH1, #0FAH
		MOV SCON, #50H
		SETB TR1
		MOV DPTR, #SEQ
VI:     CLR A
		MOVC A, @A+DPTR
		JZ VII 
		ACALL envia
		INC DPTR
		SJMP VI
BI: 	MOV A, P2
		ACALL envia
		ACALL rec
		MOV P1, A
		SJMP VII
;***********************
envia:  MOV SBUF, A
VII:	JNB TI, VII
		CLR TI
		RET
;************************
rec:    JNB RI, RECV
		MOV A, SBUF
		CLR RI
		RET
;***********************
SEQ: DB 89h,56h,0d3h,4eh,0a7h,23h,0ffh,00h,99h,7fh,12h,0ceh,0bch,02h,0fdh,66h