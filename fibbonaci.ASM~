
;<Program title>
mvi b,0h
mov a,b
sta 2001h
mvi a,1h
sta 2002h
lxi d,2003h
mvi l,10h
start: mov c,a
       add b
       stax d
       inx d
       mov b,c
       dcr l
       jnz start
hlt