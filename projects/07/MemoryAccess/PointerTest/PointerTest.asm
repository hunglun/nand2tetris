@3030
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 3030
@3
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 pointer 0
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 3040
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
@32
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32
@2
D=A
@3
D=M+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 this 2
@46
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 46
@6
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
M=D //2 that 6
@3
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 pointer 0
@4
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 pointer 1
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
@3
D=M
@2
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 this 2
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D //sub
@4
D=M
@6
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 that 6
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add