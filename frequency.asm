
;<Program title>
lxi h,2000h
mvi c,05h;
label3: mov a,m;
mov b,a
ori 00h;
jz label;
jm label2;
lda 2009h
adi 01h;
sta 2009h;
jmp start
label2: lda 2008h;
adi 01h;
sta 2008h;
jmp start;
label: lda 2007h
adi 01h;
sta 2007h;
start: inx h;
dcr c;
jnz label3;

hlt