;Nome: Eric Tamashiro Kurachi
;NUSP: 10310996
;exercicio 2 dos slides
;***********************************************************************************
	ORG 0	
INICIO:	MOV   P1, #0000H      ;para o motor
	ACALL ATRASO          ;espera 0,5s
        JB   P3.5, L1         ;chave 1 fechada        
	JB   P3.6, L2	      ;chave 2 fechada
	JB   P3.7, L3         ;chave 3 fechada
	SJMP  INICIO          
L1:     SETB  P1.0            ;liga o LED 1 por 0,5s
        ACALL ATRASO         
        SJMP  INICIO
L2:     SETB  P1.1            ;liga o LED 2 por 0,5s
        ACALL ATRASO
        SJMP  INICIO
L3:     SETB  P1.2            ;liga alternadamente o LED 3
	ACALL ATRASO          ;e o LED 1
	CLR   P1.2
	ACALL ATRASO
	SETB  P1.0
	ACALL ATRASO
	SJMP  INICIO
ATRASO: MOV   R2,#0002h ;1 ciclo
LOOP1:  MOV   R1,#004Fh ;1 ciclo
LOOP:   MOV   R0,#00EFh ;1 ciclo
	DJNZ  R0, $     ;2 ciclos
	DJNZ  R1, Loop  ;2 ciclos
	DJNZ  R2, Loop1 ;2 ciclos
	RET             ;2 ciclos  total:aproximadamente 500000us
	END