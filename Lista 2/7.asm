		ORG 0
		SJMP prog
;****************************************
		ORG 0003h
		SJMP convad
		RETI
;****************************************
prog:		SETB EA
			SETB EX0
			SETB IT0
			CLR P3.6
			ACALL atraso_50u
			SETB P3.6
			ACALL atraso_100u
			CLR P3.7
			MOV A, 30h
			ACALL disp
			SETB P3.7
			MOV A, 31h
			ACALL disp
			SJMP prog		
atraso_50u: MOV R0, #24
			DJNZ R0, $
			RET
atraso_100u:MOV R0, #49
			DJNZ R0, $
			RET
convad:		MOV A, P1
			CJNE A, #10h, teste1
teste1:		JNC umvolt
				MOV 30h, #00
				MOV 31h, #00
umvolt:			CJNE A, #20h, teste2
teste2:			JNC doisvolts
				MOV 30h, #01
				MOV 31h, #00
doisvolts:		CJNE A, #30h, teste3
teste3:			JNC tresvolts
				MOV 30h, #02
				MOV 31h, #00
tresvolts:		CJNE A, #40h, teste4
teste4:			JNC quatrovolts
				MOV 30h, #03
				MOV 31h, #00
quatrovolts:	CJNE A, #50h, teste5
teste5:			JNC cincovolts
				MOV 30h, #04
				MOV 31h, #00
cincovolts:		CJNE A, #60h, teste6
teste6:			JNC seisvolts
				MOV 30h, #05
				MOV 31h, #00
seisvolts:		CJNE A, #70h, teste7
teste7:			JNC setevolts
				MOV 30h, #06
				MOV 31h, #00
setevolts:		CJNE A, #80h, teste8
teste8:			JNC oitovolts
				MOV 30h, #07
				MOV 31h, #00
oitovolts:		CJNE A, #90h, teste9
teste9:			JNC novevolts
				MOV 30h, #08
				MOV 31h, #00
novevolts:		CJNE A, #0A0h, teste10
teste10:		JNC dezvolts
				MOV 30h, #09
				MOV 31h, #00
dezvolts:		CJNE A, #0B0h, teste11
teste11:		JNC onzevolts
				MOV 30h, #00
				MOV 31h, #01
onzevolts:		CJNE A, #0c0h, teste12
teste12:		JNC dozevolts
				MOV 30h, #01
				MOV 31h, #01
dozevolts:		CJNE A, #0d0h, teste13
teste13:		JNC trezevolts
				MOV 30h, #02
				MOV 31h, #01
trezevolts:		CJNE A, #0e0h, teste14
teste14:		JNC catorvolts
				MOV 30h, #03
				MOV 31h, #01
catorvolts:		CJNE A, #0f0h, teste15
teste15:		JNC quinzevolts
				MOV 30h, #04
				MOV 31h, #01
quinzevolts:	MOV 30h, #05
				MOV 31h, #01
	disp:		MOV P2, #00H
				MOV DPTR, #TAB
				MOVC A, @A+DPTR 
				MOV P1, A
				RET

TAB: db  7eh, 30h, 6dh, 79h, 33h, 5bh, 5fh, 70h, 7fh, 7bh, 77h, 1fh, 4eh, 3dh, 47h
end		