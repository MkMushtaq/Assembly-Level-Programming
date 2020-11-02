ASSUME CS:CODE, DS:DATA

DATA SEGMENT
NUM1 DB 20H
NUM2 DB 25H
RESULT DB 01 DUP(?)
DATA ENDS

CODE SEGMENT

START: MOV AX,DATA
       MOV DS,AX
       MOV AL,NUM1
       MOV BL,NUM2
       CLC ; clear carry
       ADD AL,BL
       MOV RESULT,AL

       MOV AH,02H		;These 3 lines will print E
       MOV DL,RESULT
       INT 21H

       MOV DL,10
       INT 21H

       
       MOV AH,02H
       MOV AL,RESULT
       AND AL,0F0H
       MOV CL,4
       SHR AL,CL
       ADD AL,48
       MOV DL,AL
       INT 21H

       MOV AL,RESULT
       AND AL,0FH
       ADD AL,48
       MOV DL,AL
       INT 21H   
       MOV AL, RESULT
           
       MOV AH, 4CH; Return to DOS prompt
       INT 21H
         
       CODE ENDS
       END

