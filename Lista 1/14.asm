	ORG 0
	SJMP Inicio
;************************************
	ORG 0003
	CLR EA
	MOV P1, #00000101B
	ACALL Atraso
	JB 20H.0, Direita
	JNB 20h.0, Esquerda
Esquerda: MOV P1, #00000111B
	  ACALL Atraso
	  SJMP Ret
Direita:  MOV P1, #00001101B
          ACALL Atraso
          SJMP Ret
Ret:	CPL 20H.0
	SETB EA
	RETI
;************************************
Inicio:	SETB EX0
	SETB 20H.0
	CLR IT0
	SETB EA	
	MOV P1, #00001111B
	SJMP $
	END