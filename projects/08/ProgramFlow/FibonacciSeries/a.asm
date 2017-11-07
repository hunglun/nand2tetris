@256
D=A
@0
M=D
@Sys.init
0;JMP// push argument 1
@2
D=M
@1
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// pop pointer 1
@4
D=A
@13
M=D
@0
M=M-1
A=M
D=M
@13
A=M
M=D
// push constant 0
@0
D=A
@0
A=M
M=D
@0
M=M+1
// pop that 0
@0
D=A
@4
D=M+D
@13
M=D
@0
M=M-1
A=M
D=M
@13
A=M
M=D
// push constant 1
@1
D=A
@0
A=M
M=D
@0
M=M+1
// pop that 1
@1
D=A
@4
D=M+D
@13
M=D
@0
M=M-1
A=M
D=M
@13
A=M
M=D
// push argument 0
@2
D=M
@0
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push constant 2
@2
D=A
@0
A=M
M=D
@0
M=M+1
// sub
@0
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D
// pop argument 0
@0
D=A
@2
D=M+D
@13
M=D
@0
M=M-1
A=M
D=M
@13
A=M
M=D
// label MAIN_LOOP_START
(MAIN_LOOP_START)
// push argument 0
@2
D=M
@0
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// if-goto COMPUTE_ELEMENT
@0
M=M-1
@256
D=M
@COMPUTE_ELEMENT
D;JNE
// goto END_PROGRAM
@END_PROGRAM
0;JMP
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// push that 0
@4
D=M
@0
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push that 1
@4
D=M
@1
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// add
@0
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D
// pop that 2
@2
D=A
@4
D=M+D
@13
M=D
@0
M=M-1
A=M
D=M
@13
A=M
M=D
// push pointer 1
@4
D=M
@0
A=M
M=D
@0
M=M+1
// push constant 1
@1
D=A
@0
A=M
M=D
@0
M=M+1
// add
@0
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D
// pop pointer 1
@4
D=A
@13
M=D
@0
M=M-1
A=M
D=M
@13
A=M
M=D
// push argument 0
@2
D=M
@0
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push constant 1
@1
D=A
@0
A=M
M=D
@0
M=M+1
// sub
@0
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D
// pop argument 0
@0
D=A
@2
D=M+D
@13
M=D
@0
M=M-1
A=M
D=M
@13
A=M
M=D
// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
// label END_PROGRAM
(END_PROGRAM)
