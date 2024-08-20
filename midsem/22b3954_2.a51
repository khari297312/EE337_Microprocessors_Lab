// -- DO NOT CHANGE ANYTHING UNTIL THE **** LINE--//
ORG 0H
LJMP MAIN
ORG 100H
MAIN:
lcall determinant
HERE: SJMP HERE

determinant:
	mov r0,64h
	mov r1, 65h
	mov r2,67h
	mov r3, 68h
	acall ab_cd
	mov a, 59h
	mov b, 60h
	mul ab
	
	mov 69h, a
	dec r0
	dec r1
	dec r2
	dec r3

	acall ab_cd


	mov a, 59h
	mov b, 62h
	mul ab
	jc sub1
	jnc add1
	mov 69h,a

	dec r1
	dec r3
	mov r0,65h
	mov r2, 68h

	call ab_cd
	
	mov a, 59h
	mov b, 61h

	mul ab
	
	jc sub1
	jnc add1

	
	
	call check_det
ret 
sub1:
		clr c	
		cpl a
		add a, #01h
		mov b, a
		mov a, 69h
		subb a,b 
		mov 69h, a
		ret
		
add1: add a, 69h
	mov 69h,a
	ret
check_det:
	mov a, 69h
	cjne a, #00h, inverse_matrix
	call here
inverse_matrix:
	mov b, 69h
	mov r3, #09h
	mov r0,#70h
	mov r1, #70h
	acall adj_a
	loop:
		mov a, @r0
		div ab
		mov @r0, a
		inc r0
		djnz r3, loop
ret


adj_a:
mov r0,60h
mov r1,61h
mov r2, 63h
mov r3,64h

call ab_cd

mov a, 59h
mov 78h, a

mov r0,62h
mov r1,60h
mov r2, 65h
mov r3,63h

call ab_cd

mov a, 59h
mov 75h, a


mov r0,60h
mov r1,62h
mov r2, 64h
mov r3,65h

call ab_cd

mov a, 59h
mov 72h, a

mov r0,61h
mov r1,60h
mov r2,67h
mov r3,66h

call ab_cd

mov a, 59h
mov 77h, a

mov r0,60h
mov r1,62h
mov r2,66h
mov r3,68h

call ab_cd

mov a, 59h
mov 74h, a

mov r0,62h
mov r1,61h
mov r2,68h
mov r3,67h

call ab_cd

mov a, 59h
mov 71h, a


mov r0,63h
mov r1,64h
mov r2,66h
mov r3,67h

call ab_cd

mov a, 59h
mov 76h, a

mov r0,65h
mov r1,63h
mov r2,68h
mov r3,66h

call ab_cd

mov a, 59h
mov 73h, a


mov r0,64h
mov r1,65h
mov r2,67h
mov r3,68h

call ab_cd

mov a, 59h
mov 70h, a


ret


ab_cd:
	mov a, r0
	mov b, r3
	mul ab
	mov 58h, a
	mov a, r1
	mov b, r2
	mul ab
	mov 57h, a
	mov a, 58h
	clr c
	subb a, 57h
	mov 59h, a
ret

END