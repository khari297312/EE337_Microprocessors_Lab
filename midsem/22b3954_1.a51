// -- DO NOT CHANGE ANYTHING UNTIL THE **** LINE--//
ORG 0H
LJMP MAIN
ORG 100H
MAIN:
call square_wave
HERE: SJMP HERE
ORG 130H
// *****************


square_wave:
MOV P1, #00H
CALL DELAY_2ms
MOV P1, #01H
call delay_2ms
jmp square_wave

delay_2ms:
	push 00h
	mov r0, #8
	h2: acall delay_250us
	djnz r0, h2
	pop 00h
ret

delay_250us:
	push 00h
	mov r0, #244
	
	h1: djnz r0, h1
	pop 00h
ret

END