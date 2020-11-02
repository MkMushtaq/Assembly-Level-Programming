
ASSUME CS:CODE, DS:DATA, SS:STACK

DATA SEGMENT

DIM EQU 09H
MAT1 DB 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H, 01H
MAT2 DB 01, 02, 03, 04, 05, 06, 07, 08, 09
RESMAT DB 09H DUP(?)
DATA ENDS

STACK SEGMENT
STACKDATA DB 100H DUP(?)
STACK ENDS

CODE SEGMENT

START:  MOV AX, DATA
        MOV DS, AX
        MOV AX, STACK
        MOV SS,AX
        MOV SP,OFFSET STACKDATA
        MOV CX, DIM
        MOV SI, OFFSET MAT1
        MOV DI, OFFSET MAT2
        MOV BX, OFFSET RESMAT
BACK:   MOV AL,[SI]
        ADD AL, [DI]
        DAA 
        MOV [BX], AL
        INC SI
        INC DI
        INC BX
        LOOP BACK

        MOV CX,DIM
        MOV SI, OFFSET RESMAT
BACK1:  CALL DISPDIGIT
        INC SI
        LOOP BACK1

        MOV AH,4CH
        INT 21H

DISPDIGIT PROC NEAR

        MOV DL, [SI]
        AND DL,0F0H
        PUSH CX
        MOV CL, 4
        SHR DL, CL
        ADD DL,48
        MOV AH, 02H
        INT 21H
        MOV DL,[SI]
        AND DL,0FH
        ADD DL,48
        INT 21H
        MOV DL,32
        INT 21H
        POP CX
        RET
DISPDIGIT  ENDP

CODE ENDS
END START
