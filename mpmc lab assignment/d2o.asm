MVI A,0FFH
MOV B,A
ANI 0FH
MOV C,A
MOV A,B
ANI 0F0H
RRC
RRC
RRC
RRC
MOV H,A
MVI D,09H
LOOP:	ADD H
	DCR D
	JNZ LOOP
ADD C
MOV B,A
ANI 07H
STA 0002H
MOV A,B
ANI 38H
RRC
RRC
RRC
STA 0001H
MOV A,B
ANI 0C0H
RRC
RRC
RRC
RRC
RRC
RRC
STA 0000H
hlt