MVI A,55H
MOV B,A
ANI 0FH
MOV C,A
MOV A,B
ANI 0F0H
RRC
RRC
RRC
RRC
MVI D,0AH
LOOP:	ADI 01H
	DCR D
	JNZ LOOP
ADD C
hlt