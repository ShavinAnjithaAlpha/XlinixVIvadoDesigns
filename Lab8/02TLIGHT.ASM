; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.
Start:
			; Turn off all the traffic lights.
	MOV AL, 84	; Copy 1000100 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
			; Turn on all the traffic lights.
	MOV AL, 10	
	CALL 50		; Start the 10 delay timer
	MOV AL, 48	; Copy 11111100 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL, 30
	OUT 01
	MOV AL, 5
	CALL 50		; Start the 5 delay timer
	
	JMP Start	; Jump back to the start.
	

; ----- Time Delay Procedure Stored At Address [30] -------------
	ORG	50	; Generate machine code from address [30]

	PUSH	AL	; Save AL on the stack.
	PUSHF		; Save the CPU flags on the stack.
Rep:
	DEC	AL	; Subtract one from AL.
	JNZ	REP	; Jump back to Rep if AL was not Zero.

	POPF		; Restore the CPU flags from the stack.
	POP	AL	; Restore AL from the stack.

	RET		; Return from the procedure.
; ---------------------------------------------------------------
	
; ===== Program Ends ==========================================

	END		; Program ends.
	YOUR TASK
	=========
	Use the help page on Hexadecimal and ASCII codes.
	Work out what hexadecimal numbers will activate the
	correct traffic lights. Modify the program to step
	the lights through a realistic sequence.
