ASSUME CS:CODE,DS:DATA

DATA SEGMENT
KEY EQU 25H
STRING DB 10H, 05H, 35H, 45H, 25H
COUNT EQU 05
STRING1 DB 'NUMBER FOUND$'
STRING2 DB 'NUMBER NOT FOUND$'
DATA ENDS

CODE SEGMENT

START: MOV AX,DATA
       MOV DS,AX
       MOV ES,AX
       MOV CX,COUNT
       MOV DI, OFFSET STRING
       MOV BL, 00H
       MOV AL,KEY
BACK:  NOP
       SCASB
       JZ NEXT
       INC BL
       LOOP BACK
NEXT:  CMP CX,00H
       JZ NEXT1
       MOV AH,09H
       MOV DX, OFFSET STRING1
       INT 21H
       JMP LAST
NEXT1: MOV AH,09H
       MOV DX,OFFSET STRING2
       INT 21H

LAST:  MOV AH,4CH
       INT 21H
CODE ENDS
END START 
