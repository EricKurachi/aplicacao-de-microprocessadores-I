	ORG 0
	MOV R4, #10010101B ;exemplo
	MOV A, R4
	MOV R6, #00H
	JNB A.0, ZERO
	INC R6   
ZERO:   JNB A.1, UM
	INC R6
UM:     JNB A.2, DOIS
	INC R6
DOIS:	JNB A.3, TRES
	INC R6
TRES:	JNB A.4, QUATRO
	INC R6
QUATRO:	JNB A.5, CINCO
	INC R6
CINCO:	JNB A.6, SEIS
	INC R6
SEIS:	JNB A.7, SETE
	INC R6
SETE:   SJMP SETE
	