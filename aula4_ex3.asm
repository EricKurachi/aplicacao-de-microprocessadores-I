;Nome: Eric Tamashiro Kurachi
;NUSP: 10310996
;exercicio 3 dos slides
;***********************************************************************************
	 ORG  0
	 SJMP PROGRAMA
;***********************************************************************************
	 ORG  0003H
	 SJMP EXTERNA
;***********************************************************************************
PROGRAMA:SETB EA                      ;ativa interrupcoes de interrupcoes             
	 SETB EX0                     ;ativa INT0
INICIO:  MOV  P2, #00000010b          ;liga a esteira no sentido horario
	 MOV  R4, P2                  
LIGADO:	 CJNE R4, #10000000b, LIGADO  ;espera uma interrupcao
ANTI:    CJNE R4, #00000010b, ANTI    ;espera uma interrupcao
	 SJMP INICIO
EXTERNA: ACALL ATRASO                 ;ao interromper espera 5s
	 JB   P2.1, PRIMEIRA          ;caso da esteira no sentido horario
	 JB   P2.7, SEGUNDA           ;caso da esteira no sentido antihorario
PRIMEIRA:MOV  P2, #10000000b          ;esteira passa a mover no sentido
	 MOV  R4, P2                  ;antihorario
	 RETI
SEGUNDA: ACALL ATRASO 
	 MOV  P2, #00000010b          ;esteira passa a se mover no
	 MOV  R4, P2                  ;sentido horario
	 RETI
ATRASO:  MOV  R2, #0024h  ;1 ciclo
LOOP1:   MOV  R1, #00FEh  ;1 ciclo
LOOP:    MOV  R0, #00FFh  ;1 ciclo
	 DJNZ R0, $     ;2 ciclos
	 DJNZ R1, LOOP  ;2 ciclos
	 DJNZ R2, LOOP1 ;2 ciclos  total:aproximadamente 5000000us
	 RET
         END

