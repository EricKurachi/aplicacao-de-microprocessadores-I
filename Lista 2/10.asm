;Escrever um programa em Assembly que permita a um usuário digitar uma senha de 4 dígitos no teclado. Se a senha digitada for 4AD3 em hexadecimal, o programa deve acender o LED1 (P3.2) e preencher a RAM externa tal que o conteúdo de cada posição seja igual à parte menos significativa do endereço. Se a senha for  CABE em hexadecimal a RAM externa deve ser totalmente zerada e o LED2 (P3.4) aceso. Qualquer outra senha que for digitada diferente das duas anteriores, o programa deve preencher a RAM externa com FFh, piscar os dois leds de maneira alternada (enquanto um está aceso o outro está apagado e vice-versa) em uma freqüência aproximada de 10 Hz e  não permitir a entrada de nenhuma outra senha.  Obs: Os Leds inicialmente devem ficar apagados. 

org 0000h




prog: 		mov TMOD, #10h
		clr P3.3
		clr P3.4
		acall teclado
      		cjne A, #0ffh, prog
      		cjne A, #04h, teste
      		sjmp senha_1
teste:		cjne A, #0ch, qualq_senha
		sjmp senha_2      

senha_1: 	acall teclado
		cjne A, #0ffh, senha_1
		cjne A, #0ah, qualq_senha
test1s1:	acall teclado
		cjne A, #0ffh, test1s1
		cjne A, 0dh, qualq_senha
test2s1:	acall teclado
		cjne A, #0ffh, test2s1
		cjne A, 03h, qualq_senha
		setb P3.2
		mov R0, #0ffh
escrmem_s1:	clr A
		mov DPTR, #0100h
		mov A, DPL
		movx @DPTR, A
		inc DPTR
		djnz R0, escrmem_s1
		sjmp prog

senha_2: 	acall teclado
		cjne A, #0ffh, senha_2
		cjne A, #0ah, qualq_senha
test1s2:	acall teclado
		cjne A, #0ffh, test1s2
		cjne A, 0bh, qualq_senha
test2s2:	acall teclado
		cjne A, #0ffh, test2s2
		cjne A, 0eh, qualq_senha
		setb P3.4
		mov R0, #0ffh
escrmem_s2:	mov A, #00h
		mov DPTR, #0100h
		movx @DPTR, A
		inc DPTR
		djnz R0, escrmem_s1
		sjmp prog

qualq_senha:	mov A, #00h
		mov DPTR, #0100h
		movx @DPTR, A
		inc DPTR
		djnz R0, qualq_senha
leds:		setb P3.3
		acall atraso_10hz
		clr P3.3
		setb P3.4
		acall atraso_10hz
		clr P3.4
		sjmo leds

atraso_10hz: 	mov TH1, #3Ch
		mov TL1, #0Afh
		setb TR1
		jnb TF1, $
		reti	
		
teclado:	 mov P1, #0ffh; coloca todo o port em 1
coluna1:	 clr P1.4
		 jnb P1.0, tecla0
		 jnb P1.1, tecla4
		 jnb P1.2, tecla8
		 jnb P1.3, teclac 
		 mov P1, #0ffh
coluna2:	 clr P1.5
	         jnb P1.0, tecla1
		 jnb P1.1, tecla5
		 jnb P1.2, tecla9
		 jnb P1.3, teclad 
		 mov P1, #0ffh
coluna3:	 clr P1.6
	         jnb P1.0, tecla2
		 jnb P1.1, tecla6
		 jnb P1.2, teclaa
		 jnb P1.3, teclae
		 mov P1, #0ffh
coluna4:	 clr P1.7
	         jnb P1.0, tecla3
		 jnb P1.1, tecla7
		 jnb P1.2, teclab
		 jnb P1.3, teclaf
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
