@Sys.init
0;JMP //writeInit
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
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 4000
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
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 5000
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
@Sys.main$retAddr0
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
@0
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
@Sys.main
0;JMP
(Sys.main$retAddr0) // call Sys.main 0
@1
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
M=D //2 temp 1
(LOOP)
@LOOP
0;JMP //Goto LOOP
(Sys.main)
@5
D=A
@5
M=D
@Sys.main$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Sys.main$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Sys.main$WRITE_FUNCTION_INITIALISE
D;JGT
@5
D=A
@SP
M=M+D
(Sys.main$WRITE_FUNCTION_INITIALISE_END) //Function Sys.main 5
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 4001
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
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 5001
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
@200
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 200
@1
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
M=D //2 local 1
@40
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 40
@2
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
M=D //2 local 2
@6
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 6
@3
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
M=D //2 local 3
@123
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 123
@Sys.add12$retAddr1
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
@Sys.add12
0;JMP
(Sys.add12$retAddr1) // call Sys.add12 1
@0
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
M=D //2 temp 0
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
@1
D=M
@2
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 local 2
@1
D=M
@3
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 local 3
@1
D=M
@4
A=A+D
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 local 4
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
D=D+M
A=A-1
M=D //add
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
(Sys.add12)
@0
D=A
@5
M=D
@Sys.add12$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Sys.add12$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Sys.add12$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Sys.add12$WRITE_FUNCTION_INITIALISE_END) //Function Sys.add12 0
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 4002
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
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 5002
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
@12
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 12
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