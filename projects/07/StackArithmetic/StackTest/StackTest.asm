@17
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 17
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE1
D;JEQ
@SP
A=M-1
M=0
@ADJUSTSP1
0;JMP
(TRUE1)
@SP
A=M-1
M=-1
(ADJUSTSP1) // eq
@17
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 17
@16
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 16
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE2
D;JEQ
@SP
A=M-1
M=0
@ADJUSTSP2
0;JMP
(TRUE2)
@SP
A=M-1
M=-1
(ADJUSTSP2) // eq
@16
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 16
@17
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 17
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE3
D;JEQ
@SP
A=M-1
M=0
@ADJUSTSP3
0;JMP
(TRUE3)
@SP
A=M-1
M=-1
(ADJUSTSP3) // eq
@892
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 892
@891
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 891
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE4
D;JLT
@SP
A=M-1
M=0
@ADJUSTSP4
0;JMP
(TRUE4)
@SP
A=M-1
M=-1
(ADJUSTSP4) // lt
@891
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 891
@892
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 892
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE5
D;JLT
@SP
A=M-1
M=0
@ADJUSTSP5
0;JMP
(TRUE5)
@SP
A=M-1
M=-1
(ADJUSTSP5) // lt
@891
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 891
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE6
D;JLT
@SP
A=M-1
M=0
@ADJUSTSP6
0;JMP
(TRUE6)
@SP
A=M-1
M=-1
(ADJUSTSP6) // lt
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32767
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32766
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE7
D;JGT
@SP
A=M-1
M=0
@ADJUSTSP7
0;JMP
(TRUE7)
@SP
A=M-1
M=-1
(ADJUSTSP7) // gt
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32766
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32767
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE8
D;JGT
@SP
A=M-1
M=0
@ADJUSTSP8
0;JMP
(TRUE8)
@SP
A=M-1
M=-1
(ADJUSTSP8) // gt
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 32766
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
@TRUE9
D;JGT
@SP
A=M-1
M=0
@ADJUSTSP9
0;JMP
(TRUE9)
@SP
A=M-1
M=-1
(ADJUSTSP9) // gt
@57
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 57
@31
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 31
@53
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 53
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D+M
A=A-1
M=D //add
@112
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 112
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D-M
A=A-1
M=D //sub
@SP
A=M-1
M=-M // neg
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D&M
A=A-1
M=D //and
@82
D=A
@SP
A=M
M=D
@SP
M=M+1 //1 constant 82
@SP
M=M-1
A=M-1
D=M
A=A+1
D=D|M
A=A-1
M=D //or
@SP
A=M-1
M=!M // not