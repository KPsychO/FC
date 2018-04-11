/*
 * source.asm
 *
 *  Created on: Feb 18, 2018
 *      Author: DarkN
 */


.global start
.data
A: .word 0x09
B: .word 0x03
.bss
C: .space 4
.text
start:
LDR R2, =A
LDR R3, =B
LDR R4, =C
LDR R0, [R2]
LDR R1, [R3]
MOV R3, #0
COMP: CMP R0, R1
BLT else
SUB R0, R0, R1
ADD R3, R3, #1
B COMP
else:
STR R0, [R2]
STR R3, [R4]
B .
.end
