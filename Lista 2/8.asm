org 0000h
sjmp prog

org 000bh
cpl P3.4
setb TR1
reti


org 0013h; diretiva de int ext 1 - eoc ad
sjmp conv_ad

prog:		setb EA; hab interrupções
		setb ET0
		setb EX1
		mov TMOD, #22h; timer para o clock em modo recarregável 2
		mov TH0, 245; th1 e tl1 para contarem 10us
		mov TL0, 245
		mov TH1, #253; move o valor necessário para 9600bps de TH1 e TL1 
		mov TH1, #253;
		setb TR1; dispara o timer
		mov SCON, #40h; serial no modo 1
		setb TR1; dispara o temporizador
		acall selend_ad; seleciona o canal do ad que será lido
                mov A, 00h
loop:		acall volts
		mov DPTR, #TAB
		movc A, @A+DPTR
		mov SBUF, A
		jnb TI, $
		clr TI
		sjmp loop
		
		
		
		
		
volts: 		cjne A, #00h, umvolt
       		mov A, #00
       		ret
umvolt:         cjne A, #17h, doisvolts
		mov A, #01
		ret
doisvolts:      cjne A, #2eh, tresvolts
		mov A, #02
		ret
tresvolts: 	cjne A, #45h, quatrovolts
       		mov A, #03
       		ret
quatrovolts:    cjne A, #5ch, cincovolts
		mov A, #04
		ret
cincovolts:     cjne A, #73h, seisvolts
		mov A, #05
		ret
seisvolts: 	cjne A, #8ah, setevolts
       		mov A, #06
       		ret
setevolts:    	cjne A, #5ch, oitovolts
		mov A, #07
		ret
oitovolts:     	cjne A, #0b8h, novevolts
		mov A, #08
		ret
novevolts:     	cjne A, #0cfh, dezvolts
		mov A, #09
		ret
dezvolts:       mov A, #10
		ret


selend_ad: 	mov DPTR, #0000h; seleciona o canal 0	
		movx @DPTR, A; pulso de escrita em A para iniciar a conversão
		ret
conv_ad:	clr EA
		mov DPTR, #0000h; leitura conversor ad
		movx A, @DPTR
		mov 30h, A
		setb EA
		acall selend_ad
		reti
		
TAB:  db 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 00 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 01 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 02 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 03 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 04 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 05 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 06 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 07 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 08 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 09 volts', 'VALOR ANALOGICO DA TENSAO NO SENSOR 0 = 100 volts'

end
		