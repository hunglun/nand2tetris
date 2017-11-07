@Sys.init
0;JMP //writeInit
(Main.main)
@0
D=A
@5
M=D
@Main.main$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Main.main$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Main.main$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Main.main$WRITE_FUNCTION_INITIALISE_END) //Function Main.main 0
@12
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 12
@String.new$retAddr0
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
@String.new
0;JMP
(String.new$retAddr0) // call String.new 1
@72
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 72
@String.appendChar$retAddr1
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
@String.appendChar
0;JMP
(String.appendChar$retAddr1) // call String.appendChar 2
@101
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 101
@String.appendChar$retAddr2
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
@String.appendChar
0;JMP
(String.appendChar$retAddr2) // call String.appendChar 2
@108
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 108
@String.appendChar$retAddr3
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
@String.appendChar
0;JMP
(String.appendChar$retAddr3) // call String.appendChar 2
@108
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 108
@String.appendChar$retAddr4
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
@String.appendChar
0;JMP
(String.appendChar$retAddr4) // call String.appendChar 2
@111
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 111
@String.appendChar$retAddr5
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
@String.appendChar
0;JMP
(String.appendChar$retAddr5) // call String.appendChar 2
@32
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32
@String.appendChar$retAddr6
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
@String.appendChar
0;JMP
(String.appendChar$retAddr6) // call String.appendChar 2
@119
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 119
@String.appendChar$retAddr7
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
@String.appendChar
0;JMP
(String.appendChar$retAddr7) // call String.appendChar 2
@111
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 111
@String.appendChar$retAddr8
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
@String.appendChar
0;JMP
(String.appendChar$retAddr8) // call String.appendChar 2
@114
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 114
@String.appendChar$retAddr9
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
@String.appendChar
0;JMP
(String.appendChar$retAddr9) // call String.appendChar 2
@108
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 108
@String.appendChar$retAddr10
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
@String.appendChar
0;JMP
(String.appendChar$retAddr10) // call String.appendChar 2
@100
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 100
@String.appendChar$retAddr11
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
@String.appendChar
0;JMP
(String.appendChar$retAddr11) // call String.appendChar 2
@33
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 33
@String.appendChar$retAddr12
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
@String.appendChar
0;JMP
(String.appendChar$retAddr12) // call String.appendChar 2
@Output.printString$retAddr13
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
@Output.printString
0;JMP
(Output.printString$retAddr13) // call Output.printString 1
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
@Output.println$retAddr14
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
@Output.println
0;JMP
(Output.println$retAddr14) // call Output.println 0
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
@Memory.init$retAddr15
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
@Memory.init
0;JMP
(Memory.init$retAddr15) // call Memory.init 0
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
@Math.init$retAddr16
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
@Math.init
0;JMP
(Math.init$retAddr16) // call Math.init 0
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
@Screen.init$retAddr17
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
@Screen.init
0;JMP
(Screen.init$retAddr17) // call Screen.init 0
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
@Output.init$retAddr18
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
@Output.init
0;JMP
(Output.init$retAddr18) // call Output.init 0
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
@Keyboard.init$retAddr19
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
@Keyboard.init
0;JMP
(Keyboard.init$retAddr19) // call Keyboard.init 0
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
@Main.main$retAddr20
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
@Main.main
0;JMP
(Main.main$retAddr20) // call Main.main 0
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
@Sys.halt$retAddr21
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
@Sys.halt
0;JMP
(Sys.halt$retAddr21) // call Sys.halt 0
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
(Sys.halt)
@0
D=A
@5
M=D
@Sys.halt$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Sys.halt$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Sys.halt$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Sys.halt$WRITE_FUNCTION_INITIALISE_END) //Function Sys.halt 0
(WHILE_EXP0)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
@SP
A=M-1
M=!M // not
@SP
A=M-1
M=!M // not
@SP
M=M-1
A=M
D=M
@WHILE_END0
D;JNE //IfGoto WHILE_END0
@WHILE_EXP0
0;JMP //Goto WHILE_EXP0
(WHILE_END0)
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
(Sys.wait)
@1
D=A
@5
M=D
@Sys.wait$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Sys.wait$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Sys.wait$WRITE_FUNCTION_INITIALISE
D;JGT
@1
D=A
@SP
M=M+D
(Sys.wait$WRITE_FUNCTION_INITIALISE_END) //Function Sys.wait 1
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
@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE25
D;JLT
@SP
A=M-1
M=0
@ADJUSTSP25
0;JMP
(TRUE25)
@SP
A=M-1
M=-1
(ADJUSTSP25) // lt
@SP
M=M-1
A=M
D=M
@IF_TRUE0
D;JNE //IfGoto IF_TRUE0
@IF_FALSE0
0;JMP //Goto IF_FALSE0
(IF_TRUE0)
@1
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 1
@Sys.error$retAddr25
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
@Sys.error
0;JMP
(Sys.error$retAddr25) // call Sys.error 1
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
(IF_FALSE0)
(WHILE_EXP0)
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
@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE27
D;JGT
@SP
A=M-1
M=0
@ADJUSTSP27
0;JMP
(TRUE27)
@SP
A=M-1
M=-1
(ADJUSTSP27) // gt
@SP
A=M-1
M=!M // not
@SP
M=M-1
A=M
D=M
@WHILE_END0
D;JNE //IfGoto WHILE_END0
@50
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 50
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
(WHILE_EXP1)
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
@0
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 0
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE29
D;JGT
@SP
A=M-1
M=0
@ADJUSTSP29
0;JMP
(TRUE29)
@SP
A=M-1
M=-1
(ADJUSTSP29) // gt
@SP
A=M-1
M=!M // not
@SP
M=M-1
A=M
D=M
@WHILE_END1
D;JNE //IfGoto WHILE_END1
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
@WHILE_EXP1
0;JMP //Goto WHILE_EXP1
(WHILE_END1)
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
@WHILE_EXP0
0;JMP //Goto WHILE_EXP0
(WHILE_END0)
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
(Sys.error)
@0
D=A
@5
M=D
@Sys.error$WRITE_FUNCTION_INITIALISE_END
D;JEQ
(Sys.error$WRITE_FUNCTION_INITIALISE)
@5
M=M-1
D=M
@SP
A=M+D
M=0
@Sys.error$WRITE_FUNCTION_INITIALISE
D;JGT
@0
D=A
@SP
M=M+D
(Sys.error$WRITE_FUNCTION_INITIALISE_END) //Function Sys.error 0
@3
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 3
@String.new$retAddr32
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
@String.new
0;JMP
(String.new$retAddr32) // call String.new 1
@69
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 69
@String.appendChar$retAddr33
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
@String.appendChar
0;JMP
(String.appendChar$retAddr33) // call String.appendChar 2
@82
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 82
@String.appendChar$retAddr34
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
@String.appendChar
0;JMP
(String.appendChar$retAddr34) // call String.appendChar 2
@82
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 82
@String.appendChar$retAddr35
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
@String.appendChar
0;JMP
(String.appendChar$retAddr35) // call String.appendChar 2
@Output.printString$retAddr36
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
@Output.printString
0;JMP
(Output.printString$retAddr36) // call Output.printString 1
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
@Output.printInt$retAddr37
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
@Output.printInt
0;JMP
(Output.printInt$retAddr37) // call Output.printInt 1
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
@Sys.halt$retAddr38
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
@Sys.halt
0;JMP
(Sys.halt$retAddr38) // call Sys.halt 0
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