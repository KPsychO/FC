.extern _stack
.global start
.equ N, 4
.data
vector:		.word 5, 6, 4, 3

.bss
fact:		.space 4*N

.text

MOV R1, #0
for:

LDR R0, =vector
LDR R0, [R0, R1, LSL#2]

CMP R1, #N
BGE fin

BL factorial

LDR R4, =fact
STR R0, [R4, R1, LSL#2]

ADD R1, R1, #1
b for
fin:
B .

factorial:
PUSH {R1, LR}

CMP R0, #1
BLE ELSE

MOV R1, R0
SUB R0, R0, #1
BL factorial
MUL R1, R0, R1
B FIN_CMP

ELSE:

MOV R1, #1
B FIN_CMP

FIN_CMP:
MOV R0, R1
POP {R1, LR}
MOV PC, LR

.end
