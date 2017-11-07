@Sys.init
0;JMP //writeInit
(Main.fibonacci)
@0
D=A
@5
M=D
@Main.fibonacci$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Main.fibonacci$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Main.fibonacci$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Main.fibonacci$WRITE_FUNCTION_INITIALISE_END) //Function Main.fibonacci 0
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
@TRUE1
D;JLT
@SP
A=M-1
M=0
@ADJUSTSP1
0;JMP
(TRUE1)
@SP
A=M-1
M=-1
(ADJUSTSP1) // lt
@SP
M=M-1
A=M
D=M
@IF_TRUE
D;JNE //IfGoto IF_TRUE
@IF_FALSE
0;JMP //Goto IF_FALSE
(IF_TRUE)
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
(IF_FALSE)
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
@Main.fibonacci$retAddr2
D=A
@SP
A=M
M=D
@SP
M=M+1 //push return address
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1 // push LCL
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1 // push ARG
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1 // push THIS
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1 // push THAT
@1
D=A
@5
D=A+D
@SP
D=M-D
@ARG
M=D // ARG=SP-n-5
@SP
D=M
@LCL
M=D // LCL = SP
@Main.fibonacci
0;JMP
(Main.fibonacci$retAddr2) // call Main.fibonacci 1
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
@Main.fibonacci$retAddr4
D=A
@SP
A=M
M=D
@SP
M=M+1 //push return address
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1 // push LCL
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1 // push ARG
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1 // push THIS
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1 // push THAT
@1
D=A
@5
D=A+D
@SP
D=M-D
@ARG
M=D // ARG=SP-n-5
@SP
D=M
@LCL
M=D // LCL = SP
@Main.fibonacci
0;JMP
(Main.fibonacci$retAddr4) // call Main.fibonacci 1
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
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
(Sys.init)
@0
D=A
@5
M=D
@Sys.init$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Sys.init$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Sys.init$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Sys.init$WRITE_FUNCTION_INITIALISE_END) //Function Sys.init 0
@4
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 4
@Main.fibonacci$retAddr6
D=A
@SP
A=M
M=D
@SP
M=M+1 //push return address
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1 // push LCL
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1 // push ARG
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1 // push THIS
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1 // push THAT
@1
D=A
@5
D=A+D
@SP
D=M-D
@ARG
M=D // ARG=SP-n-5
@SP
D=M
@LCL
M=D // LCL = SP
@Main.fibonacci
0;JMP
(Main.fibonacci$retAddr6) // call Main.fibonacci 1
(WHILE)
@WHILE
0;JMP //Goto WHILE