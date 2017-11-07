@2
D=M
@1
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 argument 1
@4
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 pointer 1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
@0
D=A
@4
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 that 0
@1
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 1
@1
D=A
@4
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 that 1
@2
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 argument 0
@2
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 2
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D //sub
@0
D=A
@2
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 argument 0
(MAIN_LOOP_START)
@2
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 argument 0
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JNE //IfGoto COMPUTE_ELEMENT
@END_PROGRAM
0;JMP //Goto END_PROGRAM
(COMPUTE_ELEMENT)
@4
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 that 0
@4
D=M
@1
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 that 1
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
@2
D=A
@4
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 that 2
@4
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 pointer 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 1
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
@4
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 pointer 1
@2
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 argument 0
@1
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 1
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D //sub
@0
D=A
@2
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 argument 0
@MAIN_LOOP_START
0;JMP //Goto MAIN_LOOP_START
(END_PROGRAM)