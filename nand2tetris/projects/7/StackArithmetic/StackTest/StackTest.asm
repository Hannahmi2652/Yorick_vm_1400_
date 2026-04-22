//push constant 17
 @17
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 17
 @17
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//eq
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @EQ_IF_TRUE_1
 D;JEQ
 D=0
 @EQ_CONTINUE_1
 0;JMP
 (EQ_IF_TRUE_1)
 D=-1
 (EQ_CONTINUE_1)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 17
 @17
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 16
 @16
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//eq
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @EQ_IF_TRUE_2
 D;JEQ
 D=0
 @EQ_CONTINUE_2
 0;JMP
 (EQ_IF_TRUE_2)
 D=-1
 (EQ_CONTINUE_2)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 16
 @16
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 17
 @17
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//eq
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @EQ_IF_TRUE_3
 D;JEQ
 D=0
 @EQ_CONTINUE_3
 0;JMP
 (EQ_IF_TRUE_3)
 D=-1
 (EQ_CONTINUE_3)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 892
 @892
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 891
 @891
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//lt
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @LT_IF_TRUE_1
 D;JLT
 D=0
 @LT_CONTINUE_1
 0;JMP
 (LT_IF_TRUE_1)
 D=-1
 (LT_CONTINUE_1)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 891
 @891
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 892
 @892
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//lt
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @LT_IF_TRUE_2
 D;JLT
 D=0
 @LT_CONTINUE_2
 0;JMP
 (LT_IF_TRUE_2)
 D=-1
 (LT_CONTINUE_2)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 891
 @891
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 891
 @891
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//lt
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @LT_IF_TRUE_3
 D;JLT
 D=0
 @LT_CONTINUE_3
 0;JMP
 (LT_IF_TRUE_3)
 D=-1
 (LT_CONTINUE_3)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 32767
 @32767
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 32766
 @32766
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//gt
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @GT_IF_TRUE_1
 D;JGT
 D=0
 @GT_CONTINUE_1
 0;JMP
 (GT_IF_TRUE_1)
 D=-1
 (GT_CONTINUE_1)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 32766
 @32766
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 32767
 @32767
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//gt
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @GT_IF_TRUE_2
 D;JGT
 D=0
 @GT_CONTINUE_2
 0;JMP
 (GT_IF_TRUE_2)
 D=-1
 (GT_CONTINUE_2)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 32766
 @32766
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 32766
 @32766
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//gt
 @SP
 A=M-1
 D=M
 A=A-1
 D=M-D
 @GT_IF_TRUE_3
 D;JGT
 D=0
 @GT_CONTINUE_3
 0;JMP
 (GT_IF_TRUE_3)
 D=-1
 (GT_CONTINUE_3)
 @SP
 M=M-1
 A=M-1
 M=D

//push constant 57
 @57
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 31
 @31
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 53
 @53
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

 //add
 @SP
 A=M-1
 D=M
 A=A-1
 M=D+M
 @SP
 M=M-1

//push constant 112
 @112
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

 //sub
 @SP
 A=M-1
 D=M
 A=A-1
 M=M-D
 @SP
 M=M-1

 @SP
 A=M-1
 M=-M

 @SP
 A=M-1
 D=M
 A=A-1
 M=M&D
 @SP
 M=M-1

//push constant 82
 @82
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

 @SP
 A=M-1
 D=M
 A=A-1
 M=M|D
 @SP
 M=M-1

 @SP
 A=M-1
 M=!M

 (END)
 @END
 0;JMP
