//push argument 1         // sets THAT, the base address of the
 @ARG
 A=M
 A=A+1
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1

//pop pointer 1           // that segment, to argument[1]
 @SP
 A=M-1
 D=M
 @THAT
 M=D
 @SP
 M=M-1

//push constant 0         // sets the series' first and second
 @0         // sets the series' first and second
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//pop that 0              // elements to 0 and 1, respectively       
 @SP
 A=M-1
 D=M
 @THAT
 A=M
 M=D
 @SP
 M=M-1

//push constant 1   
 @1   
 D=A
 @SP
 A=M
 M=D
 @SP
 M=M+1

//pop that 1              
 @SP
 A=M-1
 D=M
 @THAT
 A=M
 A=A+1
 M=D
 @SP
 M=M-1

//push argument 0         // sets n, the number of remaining elements
 @ARG
 A=M
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push constant 2         // to be computed, to argument[0] minus 2,
 @2         // to be computed, to argument[0] minus 2,
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

//pop argument 0          
 @SP
 A=M-1
 D=M
 @ARG
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

//if-goto COMPUTE_ELEMENT // if n > 0, goto COMPUTE_ELEMENT
 @SP
 AM=M-1
 D=M
 @COMPUTE_ELEMENT // if n > 0, goto COMPUTE_ELEMENT
 D;JGT

//Goto END                // otherwise, goto END
 @END                // otherwise, goto END
 0;JMP

//label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)

//push that 0
 @THAT
 A=M
 D=M
 @SP
 A=M
 M=D
 @SP
 M=M+1

//push that 1
 @THAT
 A=M
 A=A+1
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

//pop that 2
 @SP
 A=M-1
 D=M
 @THAT
 A=M
 A=A+1
 A=A+1
 M=D
 @SP
 M=M-1

//push pointer 1
 @THAT
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

 //add
 @SP
 A=M-1
 D=M
 A=A-1
 M=D+M
 @SP
 M=M-1

//pop pointer 1 
 @SP
 A=M-1
 D=M
 @THAT
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

//pop argument 0          
 @SP
 A=M-1
 D=M
 @ARG
 A=M
 M=D
 @SP
 M=M-1

//Goto LOOP
 @LOOP
 0;JMP

//label END
(END)

 (END)
 @END
 0;JMP
