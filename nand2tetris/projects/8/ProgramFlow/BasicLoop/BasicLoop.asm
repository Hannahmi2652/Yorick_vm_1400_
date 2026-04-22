//push constant 0    
 @0    
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//pop local 0         // sum = 0
 @SP
 A=M-1
 D=M
 @LCL
 A=M
 M=D
 @SP
 M=M-1

//label LOOP
(LOOP)

//push argument 0     
 @ARG
 A=M
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push local 0
 @LCL
 A=M
 D=M
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

//pop local 0	        // sum = sum + n
 @SP
 A=M-1
 D=M
 @LCL
 A=M
 M=D
 @SP
 M=M-1

//push argument 0
 @ARG
 A=M
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 1
 @1
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

//pop argument 0      // n--
 @SP
 A=M-1
 D=M
 @ARG
 A=M
 M=D
 @SP
 M=M-1

//push argument 0
 @ARG
 A=M
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push local 0        // else, pushes sum to the stack's top
 @LCL
 A=M
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1

 (END)
 @END
 0;JMP
