.MODEL SMALL
.STACK 100H
.DATA
    INP DW 0
    GCD DW 0
    G DW 0
    I DW 1
    J DW 0 
    MSG1 DB 'ENTER N: $' 
    MSG2 DB 'THE OUTPUT IS: $'
    
.CODE 

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX 
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    LOOP1:
        MOV AH,1
        INT 21H 
        MOV BL,AL
        
        CMP BL,0DH
        JE STOP
        SUB BL,48
        MOV BH,0
        
        MOV AX,10
        MUL INP  
        MOV INP, AX
        ADD INP, BX
        
        JMP LOOP1
    STOP:

        CMP INP,0
        JE DISP
    
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
        
        MOV CX,INP 
        
    LOOP2:
        CMP I,CX
        JNL EXIT2
        
        MOV BX,I
        MOV J, BX
        ADD J, 1
        
        LOOP3:
            CMP J,CX
            JG EXIT3
            
            MOV AX,J
            MOV BX,I 
            LOOP4:
            DIV BX
            CMP DX,0
            JE ENDL
            
            MOV AX,BX
            MOV BX,DX
            XOR DX,DX
            JMP LOOP4
            
            ENDL:
            MOV GCD, BX
            MOV DX,GCD
            ADD G,DX
            XOR DX,DX
            
            INC J
            JMP LOOP3
        EXIT3:
        INC I
        JMP LOOP2
     EXIT2:
        
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H 
        
        LEA DX, MSG2
        MOV AH, 9
        INT 21H
        
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
        
        CMP G,9999
        JG SPACE1 
        
        CMP G,999
        JG SPACE2
        
        CMP G,99
        JG SPACE3
        
        CMP G,9
        JG SPACE4
        JNG ELSE
        
        
        SPACE1:
        MOV AX,G
        MOV BX,10000
        DIV BX
        MOV G,DX
        XOR DX,DX
        MOV DX,AX
        ADD DL,48
        MOV AH,2
        INT 21H
        JMP SPACE2
        
        SPACE2:
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
        
        MOV AX,G
        MOV BX,1000
        DIV BX
        MOV G,DX
        XOR DX,DX
        MOV DX,AX
        ADD DL,48
        MOV AH,2
        INT 21H
        JMP SPACE3
        
        SPACE3:
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
        
        MOV AX,G
        MOV BX,100
        DIV BX
        MOV G,DX
        XOR DX,DX
        MOV DX,AX
        ADD DL,48
        MOV AH,2
        INT 21H
        JMP SPACE4
        
        
        SPACE4:
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
        
        MOV AX,G
        MOV BX,10
        DIV BX
        MOV G,DX
        XOR DX,DX
        MOV DX,AX
        ADD DL,48
        MOV AH,2
        INT 21H
        JMP ELSE
        
        ELSE:
        XOR DX,DX
        MOV DX,G
        ADD DL,48
        MOV AH,2
        INT 21H
        
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        LEA DX, MSG1
        MOV AH, 9
        INT 21H
        
        XOR AX,AX
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX
        MOV INP,0
        MOV GCD,0
        MOV G,0
        MOV I,1
        MOV J,0
        JMP LOOP1
        
        
        
    DISP:    
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
