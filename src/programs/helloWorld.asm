; Hello World 16 bit x86 - Turbo assembler


   .MODEL small                                          ; MODEL directive - Small memory model
   .STACK 100h                                           ; STACK directive - Allocate a 256 bytes stack 
   .DATA                                                 ; DATA Directive - declare and define data elements
		output DB 'Hello World!',13,10           ; Define bytes named output as string with Hello World! CF, LF in Data section
                                                         ; output: name of the variable
                                                         ; DB: "Define Byte" directive
                                                         ;'Hello World!',13,10: value - string, CF, LF

   .CODE                                                 ; CODE directive: executable section of a program. 
                                                         ; the following lines of code contain actual instructions that will be executed by the CPU
   .startup
   
   mov  ax,@data				         ; move data segment to ax register
                                                         ; MOV: move instruction, which copies a value from one location to another
                                                         ; AX: 16-bit general-purpose register in x86 architecture.
                                                         ; @DATA is a special predefined symbol that represents the starting address of the DATA segment. 

   mov  ds,ax                                            ; move data from AX section to DS section
                                                         ; DS: is one of the segment registers in x86 architecture. It is used to specify the data segment, which determines the base address of the memory segment where data is stored.
   
                                                         ; MOV AH stands for "move into AH," which moves a value into the high (or upper) 8 bits of the AX register. 
                                                         ; AH register is often used to store the function code or parameters for interrupt calls in x86 assembly.
   mov  ah,9                                             ; 9 DOS function that prints a null-terminated string. 
                                                         ; When AH is set to 9, it indicates that you want to display a string.
                                           
   mov  dx,OFFSET output                                 ; MOV DX OFFSET output instruction moves the offset or memory address of the variable called "output" into the DX register
                                                         ; DX register is a 16-bit general-purpose register in the x86 assembly language. 
                                                         ; OFFSET: This operator is used to calculate the offset or memory address of a variable
   int  21h                                              ; display "Hello world!"
                                                         ; INT: interrupt - Assembly language instruction used to trigger software interrupts, requesting services/functions from the OS or other privileged software components
                                                         ; INT 21h interrupt request the current service store in the AH (accumulator high) register
   
   mov  ah,4ch                                           ; MOV AH 4Ch: instruction that sets the value of the AH register to 4Ch, which serves as a parameter for the "DOS terminate program" or "exit.
   int  21h                                              ; INT 21h: interrupt - terminate the program
   END                                                   ; END: statement marks the end of the assembly program
