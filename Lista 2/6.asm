        org 0
prog:   ACALL teclado
        CJNE A, #0ffh, prog
		CJNE A, #0Ch, teste
		SJNM disp1
teste:  CJNE A, #0fh, alarme
		SJMP disp2		
alarme:	SETB p3.2
		CLR P1.0
		CLR P1.1
		ACALL teclado
		CJNE A, #0ffh, alarme
		CJNE A, #03h, alarme
loopal1:ACALL teclado
		CJNE A, #0ffh, loopal1
		CJNE A, #06h, alarme
loopal2:ACALL teclado
		CJNE A, #0ffh, loopal2
		CJNE A, #09h, alarme
loopal3:ACALL teclado
		CJNE A, #0ffh, loopal3
		CJNE A, #0ch, alarme
		CLR P3.2
		SJMP prog
		
		
		
disp1:		acall teclado
		cjne A, #0ffh, disp1
		cjne A, #04h, alarme
loop1:		acall teclado
		cjne A, #0ffh, loop1
		cjne A, #02h, alarme
loop2:		acall teclado
		cjne A, #0ffh, loop2
		cjne A, #0fh, alarme
		setb P1.1
		sjmp prog

disp2:		acall teclado
		cjne A, #0ffh, disp2
		cjne A, #02h, alarme
loop3:		acall teclado
		cjne A, #0ffh, loop3
		cjne A, #04h, alarme
loop4:		acall teclado
		cjne A, #0ffh, loop4
		cjne A, #0ch, alarme
		setb P1.0
		sjmp prog				










teclado:	 mov P2, #0ffh; coloca todo o port em 1
coluna1:	 clr P2.4
		 jnb P2.0, tecla0
		 jnb P2.1, tecla4
		 jnb P2.2, tecla8
		 jnb P2.3, teclac 
		 mov P2, #0ffh
coluna2:	 clr P2.5
	         jnb P2.0, tecla1
		 jnb P2.1, tecla5
		 jnb P2.2, tecla9
		 jnb P2.3, teclad 
		 mov P2, #0ffh
coluna3:	 clr P2.6
	         jnb P2.0, tecla2
		 jnb P2.1, tecla6
		 jnb P2.2, teclaa
		 jnb P2.3, teclae
		 mov P2, #0ffh
coluna4:	 clr P2.7
	         jnb P2.0, tecla3
		 jnb P2.1, tecla7
		 jnb P2.2, teclab
		 jnb P2.3, teclaf
		 mov A, #0ffh
final:		 reti
tecla0:		 mov A, #00h
		 sjmp final
tecla1:		 mov A, #01h
		 sjmp final
tecla2:		 mov A, #02h
		 sjmp final
tecla3:		 mov A, #03h
		 sjmp final
tecla4:		 mov A, #04h
		 sjmp final
tecla5:		 mov A, #05h
		 sjmp final
tecla6:		 mov A, #06h
		 sjmp final
tecla7:		 mov A, #07h
		 sjmp final
tecla8:		 mov A, #08h
		 sjmp final
tecla9:		 mov A, #09h
		 sjmp final
teclaa:		 mov A, #0ah
		 sjmp final
teclab:		 mov A, #0bh
		 sjmp final
teclac:		 mov A, #0ch
		 sjmp final
teclad:		 mov A, #0dh
		 sjmp final
teclae:		 mov A, #0eh
		 sjmp final
teclaf:		 mov A, #0fh
		 sjmp final
end


		 
		 
		 