/*
 * source.asm
 *
 *  Created on: Feb 21, 2018
 *      Author: DarkN
 */


.global start
.data

D: .word -23			// Dividendo
d: .word 5				// divisor
inv: .word 0			// variable inversión

.bss

c: .space 4				// cociente
r: .space 4				// resto

.text

start:

LDR R5, =D				// int D = Divisor
LDR R6, =d				// int d = dividendo
LDR R7, =c				// int c = cociente
LDR R8, =r				// int r = resto
LDR R9, =inv			// int inv = 0

LDR R0, [R5]			
LDR R1, [R6]
// R2 - c
// R3 - r
LDR R4, [R9]

CMP R1, #0				// if (d < 0)
BGE fin_if1
MOV R4, #1				// inv = 1
NEG R1, R1				// d = -d
fin_if1:

MOV R3, R0				// r = D
MOV R2, #0				// c = 0

CMP R0, #0				// if (D > 0)
BLE else1

while1:
CMP R3, R1				// while (r > d)
BLE fin_while1
SUB R3, R3, R1			// r = r - d
ADD R2, R2, #1			//  c = c + 1
B while1
fin_while1:
B fin_if2

else1:					// else
while2:					// while (r < 0)
CMP R3, #0
BGE fin_while2
ADD R3, R3, R1			// r = r + d
ADD R2, R2, #1			// c = c + 1
B while2
fin_while2:

NEG R2, R2				// c = -c

fin_if2:
CMP R4, #1				// if(inv == 1)
BNE fin_if3
NEG R2, R2				// c = -c
NEG R1, R1				// d = -d

fin_if3:

STR R0, [R5]			// Stores
STR R1, [R6]
STR R2, [R7]
STR R3, [R8]

FIN: B .
.end
