        ORG 0
        MOV A, #01H
        MOV R0, #50H
        MOV DPTR, #2200H
INICIO: MOV @R0, A
        MOVX @DPTR, A
        INC A
        INC R0
        INC DPTR
        CJNE A, #016H, INICIO
AQUI:   SJMP AQUI
        END