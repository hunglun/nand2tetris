@Sys.init
0;JMP //writeInit
(Class1.set)
@0
D=A
@5
M=D
@Class1.set$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Class1.set$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Class1.set$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Class1.set$WRITE_FUNCTION_INITIALISE_END) //Function Class1.set 0
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
@Class1.vm.0
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 static 0
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
@Class1.vm.1
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
@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
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
(Class1.get)
@0
D=A
@5
M=D
@Class1.get$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Class1.get$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Class1.get$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Class1.get$WRITE_FUNCTION_INITIALISE_END) //Function Class1.get 0
@Class1.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 static 0
@Class1.vm.1
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
(Class2.set)
@0
D=A
@5
M=D
@Class2.set$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Class2.set$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Class2.set$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Class2.set$WRITE_FUNCTION_INITIALISE_END) //Function Class2.set 0
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
@Class2.vm.0
D=A
@13
M=D
@SP
M=M-1
A=M
D=M
@13
A=M
M=D //2 static 0
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
@Class2.vm.1
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
@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
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
(Class2.get)
@0
D=A
@5
M=D
@Class2.get$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Class2.get$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Class2.get$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Class2.get$WRITE_FUNCTION_INITIALISE_END) //Function Class2.get 0
@Class2.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1 //1 static 0
@Class2.vm.1
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
@6
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 6
@8
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 8
@Class1.set$retAddr2
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
@2
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
@Class1.set
0;JMP
(Class1.set$retAddr2) // call Class1.set 2
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
@23
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 23
@15
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 15
@Class2.set$retAddr3
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
@2
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
@Class2.set
0;JMP
(Class2.set$retAddr3) // call Class2.set 2
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
@Class1.get$retAddr4
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
@Class1.get
0;JMP
(Class1.get$retAddr4) // call Class1.get 0
@Class2.get$retAddr5
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
@Class2.get
0;JMP
(Class2.get$retAddr5) // call Class2.get 0
(WHILE)
@WHILE
0;JMP //Goto WHILE