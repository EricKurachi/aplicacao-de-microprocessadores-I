         ORG 0
         MOV R0, #50H
         MOV DPTR, #2100H
INTERNA: MOVX A, @DPTR
         MOV @R0, A
         INC R0
         INC DPTR
         CJNE R0, #60H, INTERNA
         MOV DPTR, #2300H
         MOV R0, #50H
EXTERNA: MOV A, @R0
         MOVX @DPTR, A
         INC R0
         INC DPTR
         CJNE R0, #60H, EXTERNA
AQUI:    SJMP AQUI
         END