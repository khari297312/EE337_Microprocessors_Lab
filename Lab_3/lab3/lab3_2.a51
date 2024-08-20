// -- DO NOT CHANGE ANYTHING UNTIL THE **** LINE--//
ORG 0H
LJMP MAIN
ORG 100H
MAIN:
MOV P1, #01H
CALL DELAY_5s
MOV P1, #00H
HERE: SJMP HERE
ORG 130H
// *****************
DELAY_5s:
// ADD YOUR CODE HERE
	MOV R7, #21
//	MOV R6, #250
	L1: 
	MOV R6, #250
	DJNZ R7, L2
	JMP FRWRD
		
	L2: 
	CALL delay_1ms
	DJNZ R6, L2
	JMP L1
	
	FRWRD:
	
RET

delay_1ms:
	push 00h
	mov r0, #4
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