.global start
.EQU N, 8

.data
A: .word 7,3,25,4,75,2,1,1

.bss
max: .space 4

.text
start:
LDR R1,=max 	// Leo la dir. de max
MOV R0, #0		// Inicializo max a 0
STR R0,[R1] 	// Escribo 0 en max

LDR R2, =A		// Cargo el array A en R2
MOV R3, #0		// Iniciamos R3 (i) a 0

for: CMP R3,#N
BGE fin
LDR R4, [R2, R3, LSL#2]

CMP R4, R0
BLE fin_if
MOV R0, R4
STR R0, [R1]
fin_if:

ADD R3, R3, #1
B for

fin: B .

.end
