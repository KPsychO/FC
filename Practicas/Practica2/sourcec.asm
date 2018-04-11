/*
 * sourcec.asm
 *
 *  Created on: Feb 28, 2018
 *      Author: DarkN
 */

/*
 * source.asm
 *
 *  Created on: Feb 25, 2018
 *      Author: DarkN
 */


.global start
.EQU N, 8

.data
A: .word 7,3,25,4,75,2,1,1

.bss
max: .space 4
aux: .space 4

.text
start:
LDR R0, =A
LDR R2, =max
LDR R3, = aux

MOV R5, #0		//j
for1: CMP R5, #N
BGE finfor1
MOV R4, R5		//max
STR R4, [R2]

MOV R7, R5		//i
for2: CMP R7, #N
BGE finfor2
LDR R8, [R0, R7, LSL#2]	// R8 = A[i]
LDR R1, [R0, R4, LSL#2]	// R1 = A[max]

CMP R8, R1
BLE finif
MOV R4, R7		// max = i
STR R4, [R2]
finif:
ADD R7, R7, #1
B for2
finfor2:

CMP R4, R5
BEQ finif2
LDR R1, [R0, R4, LSL#2]
MOV R6, R1
STR R6, [R3]
LDR R7, [R0, R5, LSL#2]
STR R7, [R0, R4, LSL#2]
STR R6, [R0, R5, LSL#2]

finif2:
ADD R5, R5, #1
B for1
finfor1:
B .
.end
