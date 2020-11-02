ASSUME CS:CODE, DS:DATA

DATA SEGMENT
STRING1 DB "ODD COUNT:", "$"
STRING2 DB "EVEN COUNT:", "$"
ARRAY DW 2005H, 2011H, 3012H, 3014H, 4017H, 1519H
COUNT EQU 6
DATA ENDS

CODE SEGMENT

START: MOV AX, DATA
       MOV DS, AX
       MOV CL, COUNT
       MOV SI, OFFSET ARRAY
       MOV BL,0; EVEN COUNT
       MOV BH,0;ODD COUNT
       
BACK: MOV AX, [SI]
      ROR AX, 01
      JC ODD
      INC BL
      JMP NEXT
ODD:  INC BH
NEXT: ADD SI,02
      DEC CL
      JNZ BACK
    
      
      MOV AH,09H
      MOV DX, OFFSET STRING1
      INT 21H
     
      
      MOV DL, BH 
      ADD DL,48    
      MOV AH,02H
      INT 21H


      MOV DL,10
      MOV AH,02H
      INT 21H

      MOV AH,09H
      MOV DX, OFFSET STRING2
      INT 21H
     
      
      MOV DL, BL
      ADD DL,48    
      MOV AH,02H
      INT 21H

      
      MOV AH,4CH
      INT 21H

      CODE ENDS
      END START
     
