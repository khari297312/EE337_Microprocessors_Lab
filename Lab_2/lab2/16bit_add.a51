// -- DO NOT CHANGE ANYTHING UNTIL THE **** LINE--//
ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL ADD16
HERE: SJMP HERE
ORG 130H
// *****************
ADD16:
mov a, 71h
add a,73h
mov 76h, a

mov a, 70h 
addc a, 72h
mov 75h, a

mov a, psw
anl a, #40h
rl a
rl a


MOV 74h, A 


RET
END
