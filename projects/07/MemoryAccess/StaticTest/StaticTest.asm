@111
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 111
@333
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 333
@888
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 888
@StaticTest.vm.8
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 static 8
@StaticTest.vm.3
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 static 3
@StaticTest.vm.1
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 static 1
@StaticTest.vm.3
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 static 3
@StaticTest.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 static 1
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D //sub
@StaticTest.vm.8
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 static 8
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add