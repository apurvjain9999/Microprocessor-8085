LXI H,0070H
LXI B,0070H
MVI D,04H

LOOP:	MOV A,M
	MOV E,A
	INX H
	MOV A,M
	SUB E
	STAX B
	INX B
	INX H
	DCR D
	JNZ LOOP
hlt