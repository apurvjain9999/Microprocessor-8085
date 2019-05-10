LXI SP, 2500H ; Initialize SP to save and retrieve register’s data onto/from stack during execution CALL and subroutine 
LXI H, 2200H ; initialize data pointer to get the get the length of block of BCD numbers i.e. HL=2200H 
LXI B, time delay ; load BC reg. pair with specified delay time whatever we want. 
MOV D, M ; get the length of block in register D to set the counter 
INX H ; increment data pointer to get the first packed BCD number i.e. HL=2201H 
CALL UNPACK ; call subroutine to unpack the packed BCD number 
HLT 
UNPACK: MOV A,M ; get the packed BCD number pointed by data pointer HL 
ANI 0FH ; mask upper nibble to get lower (unpacked) BCD number 
CALL DISPLAY ; call the display subroutine for lower BCD number 
MOV A, M ; get the packed BCD number again to get upper (unpacked) BCD 
ANI F0H ; mask lower nibble i.e. A=X0
RRC 
RRC ;swap A i.e. A=0X 
RRC 
RRC 
CALL DISPLAY ; call the display subroutine for upper BCD number 
INX H ; increment data pointer HL by one to get next packed BCD number 
DCR D ; decrement counter by one 
JNZ UNPACK ; check the counter is 0 or not. If D is not 0, jump to UNPACK, to display next packed BCD number. 
RET ; i block of BCD is displayed return to main program 
DISPLAY: PUSH H ; save the data pointer HL contents on stack 
LXI H, 2304 ; load the HL reg. pair with look-up-table starting address 
ADD L ; add the contents of register L with contents of A i.e. A=contents of A+04H 
MOV L,A ; copied A into register L i.e. L=A 
MOV A,M ; get the contents of memory location pointed by HL reg. pair 
OUT 05H ; send the 7-segment code of BCD number to the 05 port to display. 
CALL DELAY ; keep the BCD number display for specified time 
POP H ; get back the contents of stack pointed by SP into HL register pair 
RET ; return to the UNPACK subroutine 
DELAY: DCX B 
MOV A, B 
ORA C 
JNZ DELAY 
RET