      ORG 0
      CLR A
      CLR C
      MOV R4, #03H
      MOV DPTR, #4000H ;R0
;na memoria externa R0 esta em #4000H, R1 esta em #4001h, R0+1 em #4002h e assim por diante
LOOP: MOVX A, @DPTR
      MOV R3, A
      INC DPTR
      MOVX A, @DPTR
      ADDC A, R3
      DJNZ R4, LOOP
      SJMP $
      END