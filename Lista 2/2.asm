			ORG 0
			MOV   TMOD, #20h
			MOV   TH1,  #208
			MOV   TL1,  #208
			SETB  TR1
			MOV   SCON, #40h
			MOV   DPTR, #TAB
trans:		CLR   A 
			MOVC  A, @A+DPTR
			MOV   SBUF, A
			INC   DPTR
			JNB   TI, $
			CLR   TI
			CJNE  A, #'$', trans
			MOV   A, R0
			ANL   A, #0fH
			ACALL conv_temp
			ACALL tran_temp
			MOV   A, R0
			ANL   A, #0f0h
			ACALL conv_temp
			ACALL tran_temp
tran_temp:	MOV   SBUF, A
			JNB   TI, $
			SJMP  $
			RET
conv_temp: 	CJNE  A, #0Ah, teste
teste: 		JC    num
			ADD   A, #07h
num:		ADD   A, #37h
			RET

TAB: db 'Temperatura do forno=', '$'
END 
	