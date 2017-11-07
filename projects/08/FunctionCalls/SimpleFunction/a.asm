@256
D=A
@0
M=D
@Sys.init
0;JMP// function SimpleFunction.test 2
(SimpleFunction.test)
@2
D=A
@5
M=D
(SimpleFunction.test$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@0
A=M+D
M=0
@0
M=M+1
@SimpleFunction.test$WRITE_FUNCTION_INITIALISE
D;JGT
// push local 0
@1
D=M
@0
A=A+D
D=M
@0
A=M
M=D
@0
M=M+1
// push local 1
@1
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
// not
@0
A=M-1
M=!M
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
// add
@0
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D
// push argument 1
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
// sub
@0
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D
// return
@1
D=M
@frame
M=D //FRAME = LCL
@5
D=A
@frame
A=M
A=A-D
D=M
@retAddr
M=D // RET = *(FRAME-5)
@0
M=M-1
A=M
D=M
@2
A=M
M=D //*ARG=pop()
D=A
@0
M=D+1 //SP=ARG+1
@1
D=A
@frame
A=M
A=A-D
D=M
@4
M=D // THAT = *(FRAME-1)
@2
D=A
@frame
A=M
A=A-D
D=M
@3
M=D // THIS = *(FRAME-2)
@3
D=A
@frame
A=M
A=A-D
D=M
@2
M=D // ARG = *(FRAME-3)
@4
D=A
@frame
A=M
A=A-D
D=M
@1
M=D // LCL = *(FRAME-4)
@retAddr
A=M
0;JMP
