/*
 * sourced.asm
 *
 *  Created on: Mar 20, 2018
 *      Author: DarkN
 */

.global start
.EQU N, 4

.data
A: .word 1,3,5,7
B: .word 8,6,4,2

.bss
C: .space 4*2*N

.text
start:

LDR R6, =A
LDR R7, =B
LDR R8, =C

MOV R0, #0		// R0 = contA
MOV R1, #3		// R1 = contB

MOV R2, #0		// R2 = i
MOV R3, #N
ADD R3, R3, R3
SUB R3, R3, #1

for:
CMP R2, R3
BGE finfor1
LDR R4, [R6, R0, LSL#2]		//R4 = aux1
LDR R5, [R7, R1, LSL#2]		//R5 = aux2

STR R4, [R8, R2, LSL#2]
ADD R9, R2, #1				// R9 = i+1
STR R5, [R8, R9, LSL#2]

ADD R0, R0, #1
SUB R1, R1, #1

ADD R2, R2, #2
B for

finfor1:

B .
.end
