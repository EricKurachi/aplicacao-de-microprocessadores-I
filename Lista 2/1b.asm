		ORG 0
		MOV  TMOD, #20h
		MOV  TH1,  #253
		MOV  TL1,  #253
		SETB TR1
		MOV  SCON, #40h
		SETB REN
		JNB  RI, $
		MOV  A, SBUF
		CLR  RI
		MOV  TH1, #253
		MOV  TL1, #253;
		SETB TR1
		MOV DPTR, #TAB
		CLR A
		MOVC A, @A+DPTR
		MOV SBUF, A
		JNB TI, $
		TAB: db 'VEL_RECONHECIDA'
		END