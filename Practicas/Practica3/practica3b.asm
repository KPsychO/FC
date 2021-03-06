.extern _stack
.global start
.equ 	N, 8

.data
A: 		.word 7,3,25,4,75,2,1,1

.bss
B:		.space N*4
max: 	.space 4
ind:	.space 4

.text

start:
		LDR SP, =_stack
		MOV FP, #0
		LDR R0, =A
		MOV R1, #N		// R1 = N

		BL ordenar_vector

		B .

ordenar_vector:
		PUSH {FP, LR}

for1:	LDR R0, =A		// R0 = A
		CMP R4, #N
		BGE fin_for1
		BL sub_max

		MOV R5, R0		// ind = max(A)
		LDR R6, =A
		LDR R7, [R6, R5, LSL#2]
		LDR R8, =B
		STR R7, [R8, R4, LSL#2]
		MOV R9, #0
		STR R9, [R6, R5, LSL#2]
		ADD R4, R4, #1
		B for1

fin_for1:

		LDR R0, =A
		LDR R1, =B
		MOV R2, #N

		BL copiar

		B ret_ordenar

sub_max:PUSH {R4 - R9, FP}	// Prologo max
		MOV R4, R0			// R4 = A
		LDR R6, =max
		MOV R7, #0
		STR R7, [R6]		// MAX = 0
		LDR R8, =ind
		STR R7, [R8]		// IND = 0

		MOV R5, #0			// R5 = i = 0

for:
		CMP R5, R1
		BGE fin_for
		LDR R7, [R4, R5, LSL#2]	// R7 = A[i]
		LDR R9, [R6]		// R9 = max

		CMP R7, R9
		BLE finif
		STR R7, [R6]
		STR R5, [R8]

finif:	ADD R5, R5, #1
		B for

fin_for:
		LDR R4, [R8]
		MOV R0, R4
		B ret_max

ret_max:
		POP {R4- R9, FP}
		MOV PC, LR

copiar:
		PUSH {R4- R6, FP}

		MOV R4, #0
for2:	CMP R4, R2
		BGE fin_for2

		LDR R5, [R1, R4, LSL#2]
		STR R5, [R0, R4, LSL#2]
		MOV R6, #0
		STR R6, [R1, R4, LSL#2]

		ADD R4, R4, #1
		B for2

fin_for2:
		B ret_copiar

ret_copiar:
		POP {R4 - R6, FP}
		MOV PC, LR

ret_ordenar:
		POP {FP, LR}
		MOV PC, LR

		.end
