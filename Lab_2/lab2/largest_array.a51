ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL MAX
HERE: SJMP HERE
ORG 130H

MAX:
	MOV R2, #09H
	MOV R0, #60H
	
LOOP:	
	CLR C
	MOV A, @R0
	MOV b, A
	MOV R1,70H
	INC R0
	
	SUBB A, R1
	JNC not_carry
	JC carry
	STOP: SJMP STOP
	
not_carry:
	MOV 70H, b
	DJNZ R2, LOOP
	SJMP STOP
	
	
carry: 
	MOV 70H, R1
	DJNZ R2, LOOP
	SJMP STOP
	


	

END