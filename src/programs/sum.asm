
;The double-precision sum of the double-word variables a, b, c.

.model small					; MODEL small: directive - code, data, and stack segments are all limited to 64 KB.
.stack 100h						; Stack 100h : directive - sets stack size segment to 256 bytes
.data
	a dw 12						; define word   (2-byte) named a and initializes it with the value 12.
	b dw 25						; define word   (2-byte) named b and initializes it with the value 25.
	c dw 10						; define word   (2-byte) named c and initializes it with the value 10.
	s dw ?						; define word   (2-byte) named s and not initialized.
	nstr db 3 dup(' ')	        ; defines bytes named nstr and Initialize with three null byte
	idv dw 10					; define word   (2-byte) named idv and initializes it with the value 10.
.code
.startup
	mov ax, dgroup				; instruction - move AX register with the segment address of the dgroup (default data group) data segment. 
	mov ds, ax					; instruction - move AX to DS.
	   							; DS register: segment register,usually used to store segment selectors, which are 16-bit values used to access different memory segments.
	mov ax, a 	    			; instruction - move a to AX.
	add ax, b 	     			; instruction - add b to AX.
	add ax, c					; instruction - add c to AX.							
	mov s, ax					; instruction - move AX (result) to s
	mov si,2					; instruction - move 2 to SI (Source Index) register
	mov nstr[si], '$'			; instruction - move $ character into the nstr array at the index specified by the value in the SI register (currently 2).
    							; $: end of line
	dec si						; instruction - Decrement Source Index (1)						
	mov ax, s					; move s to AX
								; AX register: general-purpose 16-bit register, typically used for various arithmetic operations
	mov dx, 0					; instruction - move 0 into DX (Data Extended) register
								; DX register: x86 16-bit register often used for various purposes, such as holding data for input/output operations when working with I/O ports. 

loop1:
	div idv						; DIV : division instruction, idv : divisor.
	add dl, '0'					; instruction - add the ASCII value '0' to the value in the DL register. convert a single-digit number (0-9) in DL to its corresponding ASCII character.
	mov nstr[si],dl				; instruction - move the value in the DL register nstr[1].
	dec si						; instruction - Decrement Source Index (0).
	mov dx,0					; instruction - move 0 into DX (Data Extended) register.
	cmp ax,0					; instruction - CMP: compare AX value with 0.
	jne loop1					; instruction - Jump if not equal to loop 1.

listn:
	mov ah, 09h					; instruction - move 09h (display string function ) to AH (high byte of AX) register.
	mov dx, offset nstr			; instruction - move the offset address of variable nstr into the DX register.
	int 21h						; instruction - interupt the function stored in AH register (display string). 

	mov ah,4ch					; instruction - move 4ch (exit) to AH (high byte of AX) register.
	int 21h						; instruction - interupt the function stored in AH register (exit). 
END