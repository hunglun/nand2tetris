(SimpleFunction.test)
@2
D=A
@5
M=D
@SimpleFunction.test$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(SimpleFunction.test$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@SimpleFunction.test$WRITE_FUNCTION_INITIALISE
D;JGT
@2
D=A
@SP
M=M+D
(SimpleFunction.test$WRITE_FUNCTION_INITIALISE_END) //Function SimpleFunction.test 2
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
@1
D=M
@1
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 local 1
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
@SP
A=M-1
M=!M // not
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
@LCL
D=M
@8
M=D //FRAME = LCL
@5
D=A
@8
A=M
A=A-D
D=M
@7
M=D // RET = *(FRAME - 5)
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D //*ARG=pop()
D=A
@SP
M=D+1 //SP=ARG+1
@LCL
D=A
@8
A=M
A=A-D
D=M
@THAT
M=D // THAT = *(FRAME-1)
@ARG
D=A
@8
A=M
A=A-D
D=M
@THIS
M=D // THIS = *(FRAME-2)
@THIS
D=A
@8
A=M
A=A-D
D=M
@ARG
M=D // ARG = *(FRAME-3)
@THAT
D=A
@8
A=M
A=A-D
D=M
@LCL
M=D // LCL = *(FRAME-4)
@7
A=M
0;JMP //return to *(Frame-5)