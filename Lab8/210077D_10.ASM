; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================
Start:
	MOV	AL,8A	; 1111 1010
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,0	; 0000 0000
	OUT	02	; Send the data in AL to Port 02
	
	MOV	AL,8B	; 1111 1011
	OUT	02	; Send the data in AL to Port 02
	
	MOV 	AL, 1
	OUT 	02
	JMP	Start
	
	END
; ======================================================