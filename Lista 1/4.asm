        ORG 0
        MOV R0, #30H
        MOV R1, #00H
        MOV DPTR, #TAB
INICIO: CLR A
        MOVC A, @A+DPTR
        MOV @R0, A
        INC DPTR
        INC R0
        INC R1
        CJNE A, #00, INICIO
        DEC R1
        MOV 20H, R1
LOOP:   SJMP LOOP
TAB:    DB 20H, 30H
