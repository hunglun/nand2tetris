@10
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 10
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
@21
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 21
@22
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 22
@2
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
M=D //2 argument 2
@1
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
M=D //2 argument 1
@36
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 36
@6
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
M=D //2 this 6
@42
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 42
@45
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 45
@5
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
M=D //2 that 5
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
@510
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 510
@6
D=A
@5
D=A+D
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 temp 6
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
@4
D=M
@5
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 that 5
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
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
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D //sub
@3
D=M
@6
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 this 6
@3
D=M
@6
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 this 6
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D //sub
@5
D=A
@6
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 temp 6
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add