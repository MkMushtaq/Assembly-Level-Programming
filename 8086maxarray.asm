  ASSUME CS:CODE, DS:DATA

  DATA SEGMENT
   ARRAY DB 50H, 20H, 60H, 30H, 75H
   COUNT EQU 05
   MAX DB 01 DUP(?)
   STRING DB 'MAXIMUM NUMBER:$'
  DATA ENDS

 CODE SEGMENT
 
 START: MOV AX, DATA
        MOV DS,AX
        MOV SI, OFFSET ARRAY
        MOV CL, COUNT
        MOV AL,[SI]
 BACK:  CMP AL, [SI+1]
        JNL NEXT
        MOV AL, [SI+1]
 NEXT:  INC SI
        DEC CL
        JNZ BACK  

        MOV SI, OFFSET MAX
        MOV [SI],AL
        
       MOV AH,09H
       MOV DX, OFFSET STRING
       INT 21H

       MOV AL,MAX
       MOV AH,02H
       AND AL,0F0H
       MOV CL, 4
       SHR AL,CL
       ADD AL,48
       MOV DL,AL
       INT 21H

       MOV AL,MAX
       MOV AH,02H
       AND AL,0FH
       ADD AL,48
       MOV DL,AL
       INT 21H   
       
       MOV AH, 4CH
       INT 21H
       CODE ENDS
       END  START
      
