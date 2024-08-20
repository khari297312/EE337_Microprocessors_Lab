
ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL XORSWAP
HERE: SJMP HERE
ORG 130H

XORSWAP:
mov a, 60h
mov b, 61h
xrl a,b
xrl b,a
xrl a,b
mov 60h,a
mov 61h ,b 

RET
END