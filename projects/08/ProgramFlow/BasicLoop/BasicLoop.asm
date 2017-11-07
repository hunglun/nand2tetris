@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
@0
D=A
@1
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 local 0
(LOOP_START)
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
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 local 0
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
@0
D=A
@1
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 local 0
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
@LOOP_START
D;JNE //IfGoto LOOP_START
@1
D=M
@0
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 local 0