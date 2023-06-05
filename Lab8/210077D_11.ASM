; ==================================================
; =============== 1 to 5 multiplier ================
	CLO		; clear the windows

	MOV AL, 1 	; load 1 to AL register
	MOV BL, 2 	; load 2 to BL register

Rep:
	MUL AL, BL 	; multiply the values in AL and BL registers, save it in AL
	INC BL 		; increment BL value by 1
	CMP BL, 6 	; compare if the BL register value is 6
	JNZ Rep 	; if BL value is  not 6 then jmup to the Rep label 

; =================== show the result in 2 7-segment display ======
	PUSH AL		; save AL on the stack
	PUSHF		; save the cpu flag on the stack 
	
	PUSH AL POP BL	; Load value in AL to BL
	AND BL, F	; mask off the first 4-bit of the number in BL using AND operator
	
	POPF		; restore the cpu flag
	POP AL		; restore the AL from the stack
	AND AL, F0	; mask off the second 4-bit of the number in AL using AND operator
	SHR AL		; right shift the AL value
	SHR AL
	SHR AL	
	SHR AL		; right shift 4 times
	PUSH AL POP CL	; load value in AL to CL
	
	MOV AL, FA	; save the lookup table for 7-seg display in ram address starting from [B0]
	MOV [B0], AL

	MOV AL, 0A
	MOV [B1], AL
	
	MOV AL, B6
	MOV [B2], AL
	
	MOV AL, 9E
	MOV [B3], AL
	
	MOV AL, 4E
	MOV [B4], AL

	MOV AL, DC
	MOV [B5], AL

	MOV AL, FC
	MOV [B6], AL

	MOV AL, 8A
	MOV [B7], AL

	MOV AL, FE
	MOV [B8], AL

	MOV AL, DE
	MOV [B9], AL

	MOV AL, EF
	MOV [BA], AL

	MOV AL, 7C
	MOV [BB], AL

	MOV AL, F0
	MOV [BC], AL

	MOV AL, 3E
	MOV [BD], AL

	MOV AL, F4
	MOV [BE], AL

	MOV AL, E4
	MOV [BF], AL
	
	MOV AL, 1 	; reset the 7-seg display
	OUT 2		; output the AL into 7-seg

	ADD CL, B0	; add B0 to value in CL to shift to the correct mem address
	MOV AL, [CL]	; load the value in mem address [CL] into AL 
	OUT 2		; output the AL into 7-seg
	
	ADD BL, B0	; add B0 to value in BL to shift to the correct mem address
	MOV AL, [BL]	; load the value in mem address [BL] into AL
	ADD AL, 1	; add 1 to the value in AL in order to activate the first 7-seg display
	OUT 2		; output the AL into 7-seg
	
	END ;
