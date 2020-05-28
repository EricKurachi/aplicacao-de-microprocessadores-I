	 ORG 0 
	 MOV R0, #50H
	 MOV R1, #00H
         MOV DPTR, #8200H
INTERNA: MOVX A, @DPTR
         MOV @R0, A
         INC R0
         INC R1
         INC DPTR
         CJNE A, #00H, INTERNA
         MOV DPTR, #8300H
         MOV R0, #50H
EXTERNA: MOV A, @R0
         MOVX @DPTR, A
         INC R0
         INC DPTR
         CJNE A, #00H, EXTERNA
         DEC R1
         MOV 40H, R1
AQUI:    SJMP AQUI
         END