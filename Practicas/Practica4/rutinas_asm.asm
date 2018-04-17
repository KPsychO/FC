	.EQU N, 128*128
	.EQU PENE, 256
	.global RGB2GrayMatrix

//	.global rgb2gray

//	.equ COEF1, 3483
//	.equ COEF2, 11718
//	.equ COEF3, 1183

	.text

//rgb2gray:
// 		ldr r3, =COEF1
// 		mul r0, r3, r0
// 		ldr r3, =COEF2
// 		mla r0, r3, r1, r0
// 		ldr r3, =COEF3
// 		mla r0, r3, r2, r0
//		mov r0, r0, lsr #14

// 		mov pc, lr


RGB2GrayMatrix:

		// R0 = orig
		// R1 = dest

		PUSH {R4 - R12, LR}

		MOV R4, #0
		MOV R5, #N

		MOV R6, R0
		MOV R7, R1

		MOV R11, R4

FOR:	CMP R4, R5
		BGE FIN_FOR

		LDRB R8, [R6, R11]
		ADD R11, R11, #1
		LDRB R9, [R6, R11]
		ADD R11, R11, #1
		LDRB R10, [R6, R11]

		MOV R12, #PENE
/*		MOV R0, R8
		MOV R1, R9
		MOV R2, R10
*/
		SUB R0, R12, R8
		SUB R1, R12, R9
		SUB R2, R12, R10

		BL rgb2gray


		STRB R0, [R7, R4]
		ADD R4, R4, #1
		ADD R11, R11, #1

		B FOR


FIN_FOR:

		POP {R4 - R12, LR}
		MOV PC, LR


