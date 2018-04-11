.global start
.data
A: .word 9
B: .word 3
C: .word 6
.bss
Amul: .space 4
Bmul: .space 4
Cmul: .space 4
.text
start:

LDR R3, =A
LDR R4, =B
LDR R5, =C
LDR R0, [R3]		// R0 A
LDR R1, [R4]		// R1 B
LDR R2, [R5]		// R2 C

CMP R0, #0
BNE finif1
MOV R0, #0
STR R0, [R3]
STR R0, [R4]
STR R0, [R5]
B .

finif1:
CMP R1, #0
BNE finif2
MOV R0, #0
STR R0, [R3]
STR R0, [R4]
STR R0, [R5]
B .

finif2:
CMP R2, #0
BNE finif0
MOV R0, #0
STR R0, [R3]
STR R0, [R4]
STR R0, [R5]
B .

finif0:
CMP R0, R1
BGE cmpAB
MOV R7, R0
MOV R6, R1

cmpAB:
MOV R7, R1
MOV R6, R0

CMP R6, R2
BGE cmpMC

CMP R7, R2
BGE cmpMC
MOV R6, R2

cmpMC:

LDR R3, =Amul
ADD R0, R6, R7
STR R0, [R3]

LDR R4, =Bmul
MOV R1, #10
MUL R0, R6, R1
STR R0, [R4]

LDR R5, =Cmul
MOV R1, #3
STR R1, [R5]

FIN: B .
.end
