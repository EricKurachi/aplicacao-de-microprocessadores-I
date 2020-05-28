         ORG 0
         MOV R0, #30H
         MOV DPTR, #TAB
INTERNA: CLR A
         MOVC A, @A+DPTR
         MOV @R0, A
         INC DPTR
         INC R0
         CJNE A, #00, INTERNA
         MOV DPTR, #1000H
         MOV R0, #30H
EXTERNA: MOV A, @R0
         MOVX @DPTR, A
         INC R0
         INC DPTR
         CJNE A, #00, EXTERNA
LOOP:    SJMP LOOP
TAB:     DB 20H, 30H