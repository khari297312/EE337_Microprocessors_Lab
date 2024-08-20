//objective - program to add 2 8-bit numbers stored in 30h and 31h and store the result in 33h.

//steps-
// 1. fetch the numbers from the memory and store registers
// 2. compute the sum and store it back in the memory


ORG 0H
LJMP MAIN
ORG 100H
	
MAIN:

ACALL ADD8

HERE: SJMP HERE

ADD8:
MOV A,30H //FETCHES THE VALUE PRESENT IN 30H AND TRANSFERS IT TO A
MOV R1,31H 
ADD A,R1 // A = A + R1
MOV 33H,A
RET

END
