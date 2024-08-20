ORG 0H
LJMP MAIN
ORG 100

MAIN:
	ACALL FINDn // N in R5
	MOV 30H, R5
	MOV R0, #40H
	ACALL FINDr // R6 <= r
BACK: 
	MOV R0, #40H
	MOV A, @R0
	MOV R5, 30H
BACKIN:
	MOV B, R6
	MUL AB
	MOV P1, A
	ACALL DELAY 
	DJNZ R5, BACKIN
	JMP BACK

ORG 200
FINDn:
	PUSH 0
	MOV R0, #50H
	MOV A, @R0
	MOV R5, A //N
	POP 0
	RET

FINDr:
	INC R0
	MOV A, @R0
	DEC R0
	MOV B, @R0
	DIV AB
	MOV R6, A
	RET

DELAY:
	PUSH ACC
	PUSH B
	PUSH 5
	PUSH 6
	MOV R5, #0FFh
	MOV R6, #0FFh
	HERE1: DEC R5
	HERE2: DJNZ R6, HERE2
	MOV A, R5
	JNZ HERE1
	POP 6
	POP 5
	POP B
	POP ACC
	RET

END