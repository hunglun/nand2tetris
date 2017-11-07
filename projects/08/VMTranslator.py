# Thu Oct  5 21:52:59 +08 2017 - created
# Fri Oct  6 07:22:29 +08 2017 - replace @sp with @0, passed SimpleAdd test
# Sun Oct  8 11:59:58 +08 2017 - passed StackTest
# Mon Oct  9 20:47:33 +08 2017 - completed Memory Access & Arithmetic Operation
# Tue Oct 10 01:01:37 +08 2017 - Completed program flow, if-goto requires popping the stack
# Tue Oct 10 21:09:51 +08 2017 - started working on function call
# Thu Oct 12 07:29:04 +08 2017 - completed simple function
# Thu Oct 12 21:32:22 +08 2017 - process a folder of vm files
#                              - place bootstrap code in writeInit
# Sun Oct 15 13:02:47 +08 2017 - fixed bug in writeCall
#                              - fixed bugs in several write* methond.
#                              - correct inconsistent sp bootcode in tst file
# Sun Oct 15 18:18:02 +08 2017 - completed all vm tests!



import sys,re,os
C_ARITHMETIC = 0
C_PUSH = 1
C_POP = 2
C_FUNCTION = 3
C_CALL = 4
C_UNKNOWN = 99
C_LABEL = 101
C_GOTO = 102
C_IFGOTO = 103
C_FUNCTION = 104
C_CALL = 105
C_RETURN = 106

class Parser:
    def __init__(self, filepath):
        self.content = []
        f=open(filepath,'r')
        for line in f.readlines():
            line = line.strip()
            if line == "" or line.startswith("//"):
                continue
            m=re.match(r"(.+?)//.*", line)
            if m:
                line=m.group(1).strip()
            self.content.append(line)
        f.close()
        print filepath
        assert self.content != []
        self.programcounter=0
        self.programsize = len(self.content)
        self.tokens = self.content[self.programcounter].split(' ')

    def hasMoreCommands(self):
        return self.programcounter < self.programsize
    def debugInfo(self):
        return self.content[self.programcounter]
    def advance(self):
        self.tokens = self.content[self.programcounter].split(' ')
        self.programcounter = self.programcounter + 1
    def commandType(self):
        cmd = self.tokens[0]
        if cmd in MAP1.keys():
            return C_ARITHMETIC
        if cmd == 'push':
            return C_PUSH
        if cmd == 'pop':
            return C_POP
        if cmd == 'label':
            return C_LABEL
        if cmd == 'goto':
            return C_GOTO
        if cmd == 'if-goto':
            return C_IFGOTO
        if cmd == 'function':
            return C_FUNCTION
        if cmd == 'call':
            return C_CALL
        if cmd == 'return':
            return C_RETURN

    def arg1(self):
        if self.commandType() == C_ARITHMETIC:
            return self.tokens[0]
        if self.commandType() == C_RETURN:
            assert(False)
        assert len(self.tokens) > 0
        return self.tokens[1]

    def arg2(self):
        assert len(self.tokens) == 3
        assert self.commandType() in [C_PUSH,C_POP,C_FUNCTION, C_CALL]
        return self.tokens[2]

    
MAP1 = {
    "add" : "+",
    "sub" : "-",
    "and" : "&",
    "or"  : "|",
    "eq"  : "JEQ",
    "gt"  : "JGT",
    "lt"  : "JLT",
    "neg" : "-",
    "not" : "!",

    "local": "1",
    "argument": "2",
    "this" : "3",
    "that" : "4",
    "temp" : "5",

}

class CodeWriter:
    def __init__(self, filename):
        self.file=open(filename,'w')
        self.buffer = []
        self.counter = 0
        print filename, "created"

    def setFileName(self,filename):
        self.filename = filename
    def writeInit(self):
#        self.buffer.append("@256") # initialise stack pointer to 256
#        self.buffer.append("D=A")
#        self.buffer.append("@SP")
#        self.buffer.append("M=D")
        self.buffer.append("@Sys.init")
        self.buffer.append("0;JMP //writeInit")
    def writeDebugInfo(self,debuginfo):
        self.buffer.append("// "+ debuginfo)
    def writeLabel(self,command):
        self.buffer.append("(%s)" % command)
    def writeGoto(self,command):
        comment = "Goto" + " " + command
        self.buffer.append("@%s" % command)
        self.buffer.append("0;JMP //" + comment)
    def writeIfGoto(self,command):
        comment = "IfGoto" + " " + command
        self.buffer.append("@SP")
        self.buffer.append("M=M-1")
        self.buffer.append("A=M")
        self.buffer.append("D=M")
        self.buffer.append("@%s" % command)
        self.buffer.append("D;JNE //" + comment)

    def writeFunction(self,name,numLocals):
        comment = "Function" + " " + name + " " + numLocals
        self.buffer.append("(%s)" % name)
        self.buffer.append("@"+numLocals)
        self.buffer.append("D=A")
        self.buffer.append("@5")
        self.buffer.append("M=D")
        self.buffer.append("@%s$WRITE_FUNCTION_INITIALISE_END" % name)
        self.buffer.append("D;JEQ")
        self.buffer.append("(%s$WRITE_FUNCTION_INITIALISE)" % name)
        self.buffer.append("@5")
        self.buffer.append("M=M-1")
        self.buffer.append("D=M")
        self.buffer.append("@SP")
        self.buffer.append("A=M+D")
        self.buffer.append("M=0")
        self.buffer.append("@%s$WRITE_FUNCTION_INITIALISE" % name)
        self.buffer.append("D;JGT")
        self.buffer.append("@"+numLocals)
        self.buffer.append("D=A")
        self.buffer.append("@SP")
        self.buffer.append("M=M+D")
        self.buffer.append("(%s$WRITE_FUNCTION_INITIALISE_END) //%s" % (name,comment))
    def writeCall(self,name, numArgs):
        self.buffer.append("@%s$retAddr%d" % (name, self.counter))
        self.buffer.append("D=A")
        self.buffer.append("@SP")
        self.buffer.append("A=M")
        self.buffer.append("M=D")
        self.buffer.append("@SP")
        self.buffer.append("M=M+1 //push return address")
        self.buffer.append("@LCL")
        self.buffer.append("D=M")
        self.buffer.append("@SP")
        self.buffer.append("A=M")
        self.buffer.append("M=D")
        self.buffer.append("@SP")
        self.buffer.append("M=M+1 // push LCL")
        self.buffer.append("@ARG")
        self.buffer.append("D=M")
        self.buffer.append("@SP")
        self.buffer.append("A=M")
        self.buffer.append("M=D")
        self.buffer.append("@SP")
        self.buffer.append("M=M+1 // push ARG")
        self.buffer.append("@THIS")
        self.buffer.append("D=M")
        self.buffer.append("@SP")
        self.buffer.append("A=M")
        self.buffer.append("M=D")
        self.buffer.append("@SP")
        self.buffer.append("M=M+1 // push THIS")
        self.buffer.append("@THAT")
        self.buffer.append("D=M")
        self.buffer.append("@SP")
        self.buffer.append("A=M")
        self.buffer.append("M=D")
        self.buffer.append("@SP")
        self.buffer.append("M=M+1 // push THAT")
        self.buffer.append("@"+numArgs)
        self.buffer.append("D=A")
        self.buffer.append("@5")
        self.buffer.append("D=A+D")
        self.buffer.append("@SP")
        self.buffer.append("D=M-D")
        self.buffer.append("@ARG")
        self.buffer.append("M=D // ARG=SP-n-5")
        self.buffer.append("@SP")
        self.buffer.append("D=M")
        self.buffer.append("@LCL")
        self.buffer.append("M=D // LCL = SP")
        self.buffer.append("@"+name)
        self.buffer.append("0;JMP")
        self.buffer.append("(%s$retAddr%d) // %s" % (name, self.counter,"call " + name + " " + numArgs))
        self.counter = self.counter + 1
                           

    def writeReturn(self):
        self.buffer.append("@LCL")
        self.buffer.append("D=M")
        self.buffer.append("@8")
        self.buffer.append("M=D //FRAME = LCL")

        self.buffer.append("@5")
        self.buffer.append("D=A")
        self.buffer.append("@8")
        self.buffer.append("A=M")
        self.buffer.append("A=A-D")
        self.buffer.append("D=M")
        self.buffer.append("@7")
        self.buffer.append("M=D // RET = *(FRAME - 5)")

        self.buffer.append("@SP")
        self.buffer.append("M=M-1")
        self.buffer.append("A=M")
        self.buffer.append("D=M")
        self.buffer.append("@ARG")
        self.buffer.append("A=M")
        self.buffer.append("M=D //*ARG=pop()")
        self.buffer.append("D=A")
        self.buffer.append("@SP")
        self.buffer.append("M=D+1 //SP=ARG+1")
        self.buffer.append("@LCL")
        self.buffer.append("D=A")
        self.buffer.append("@8")
        self.buffer.append("A=M")
        self.buffer.append("A=A-D")
        self.buffer.append("D=M")
        self.buffer.append("@THAT")
        self.buffer.append("M=D // THAT = *(FRAME-1)")
        self.buffer.append("@ARG")
        self.buffer.append("D=A")
        self.buffer.append("@8")
        self.buffer.append("A=M")
        self.buffer.append("A=A-D")
        self.buffer.append("D=M")
        self.buffer.append("@THIS")
        self.buffer.append("M=D // THIS = *(FRAME-2)")
        self.buffer.append("@THIS")
        self.buffer.append("D=A")
        self.buffer.append("@8")
        self.buffer.append("A=M")
        self.buffer.append("A=A-D")
        self.buffer.append("D=M")
        self.buffer.append("@ARG")
        self.buffer.append("M=D // ARG = *(FRAME-3)")
        self.buffer.append("@THAT")
        self.buffer.append("D=A")
        self.buffer.append("@8")
        self.buffer.append("A=M")
        self.buffer.append("A=A-D")
        self.buffer.append("D=M")
        self.buffer.append("@LCL")
        self.buffer.append("M=D // LCL = *(FRAME-4)")
        self.buffer.append("@7")
        self.buffer.append("A=M")
        self.buffer.append("0;JMP //return to *(Frame-5)")
    def writeArithmetic(self,command):
        self.counter = self.counter + 1
        if command in ["add","sub","and","or"]:
            self.buffer.append("@SP")
            self.buffer.append("M=M-1")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("D=M") # assign deferenced value to D
            self.buffer.append("A=A+1") # access sp+1
            self.buffer.append("D=D%sM" % MAP1[command]) # add up, and other binary operation
            self.buffer.append("A=A-1") # access sp
            self.buffer.append("M=D //"+command )
        elif command in ["eq","gt","lt"]:
            self.buffer.append("@SP")
            self.buffer.append("M=M-1")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("D=M") # assign deferenced value to D
            self.buffer.append("A=A+1") # access sp+1
            self.buffer.append("D=D-M") # add up, and other binary operation
            self.buffer.append("@TRUE%d" % self.counter)
            self.buffer.append("D;"+MAP1[command])
            self.buffer.append("@SP") # if FALSE
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("M=0")
            self.buffer.append("@ADJUSTSP%d" % self.counter)
            self.buffer.append("0;JMP")
            self.buffer.append("(TRUE%d)" % self.counter) # if TRUE
            self.buffer.append("@SP")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("M=-1")
            self.buffer.append("(ADJUSTSP%d) // %s" % (self.counter, command))
        elif command in ["neg", "not"]:
            self.buffer.append("@SP")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("M=%sM // %s" % (MAP1[command], command)) # assign deferenced value to D
        else:
            assert(False)

    def writePushPop(self, command, segment, index):
        comment = str(command) + " " + segment + " " + index
        if command == C_PUSH:
            if segment == "pointer":
                self.buffer.append("@" + str(3+int(index)))
                self.buffer.append("D=M")
            else:
                if segment == "constant":
                    self.buffer.append("@" + index)
                    self.buffer.append("D=A")
                else:
                    if segment == "static":
                        self.buffer.append("@%s.%s" % (self.filename,index))
                        self.buffer.append("D=M")
                    else:
                        self.buffer.append("@%s"% MAP1[segment])
                        if segment == "temp":
                            self.buffer.append("D=A")
                        else:
                            self.buffer.append("D=M")
                        self.buffer.append("@"+index)
                        self.buffer.append("A=A+D")
                        self.buffer.append("D=M")
            self.buffer.append("@SP")
            self.buffer.append("A=M")
            self.buffer.append("M=D")
            self.buffer.append("@SP")
            self.buffer.append("M=M+1 //" + comment)
        if command == C_POP:
            if segment == "pointer":
                self.buffer.append("@" + str(3+int(index)))
                self.buffer.append("D=A")
            else:
                if segment == "static":
                    self.buffer.append("@%s.%s" % (self.filename,index))
                    self.buffer.append("D=A")
                else:
                    self.buffer.append("@"+index)
                    self.buffer.append("D=A")
                    self.buffer.append("@%s" % MAP1[segment])
                    if segment == "temp":
                        self.buffer.append("D=A+D")
                    else:
                        self.buffer.append("D=M+D")
            self.buffer.append("@13")
            self.buffer.append("M=D") # store the address at @13
            
            self.buffer.append("@SP")
            self.buffer.append("M=M-1")
            self.buffer.append("A=M")
            self.buffer.append("D=M") # pop latest entry
            self.buffer.append("@13")
            self.buffer.append("A=M")
            self.buffer.append("M=D //" + comment) # store popped value to target segment

            
                
    def close(self):
        self.file.write("\n".join(self.buffer))
        self.file.close()

if __name__ == "__main__":
    dirpath=None
    vmfiles = []
    wrt = None
    if sys.argv[1].endswith('.vm'): # overwrite the above options
        dirpath=os.path.dirname(sys.argv[1])
        vmfiles = [sys.argv[1]]
        wrt = CodeWriter(sys.argv[1].replace(".vm",".asm"))
    else:
        dirpath = sys.argv[1]
        vmfiles = [os.path.join(dirpath, f) for f in os.listdir(dirpath) if f.endswith(".vm")]
        foldername = os.path.basename(dirpath)
        wrt = CodeWriter(os.path.join(dirpath,foldername + ".asm"))

    if 'Sys.vm' in os.listdir(dirpath):
        wrt.writeInit()
    for filepath in vmfiles:
        parser = Parser(filepath)
        wrt.setFileName(os.path.basename(filepath))
        while parser.hasMoreCommands():
            if len(sys.argv) == 3 and sys.argv[2] == 'debug':
                wrt.writeDebugInfo(parser.debugInfo())
            parser.advance()
            if parser.commandType() == C_ARITHMETIC:
                wrt.writeArithmetic(parser.arg1())
            elif parser.commandType() == C_PUSH:
                wrt.writePushPop(C_PUSH, parser.arg1(), parser.arg2())
            elif parser.commandType() == C_POP:
                wrt.writePushPop(C_POP, parser.arg1(), parser.arg2())
            elif parser.commandType() == C_LABEL:
                wrt.writeLabel(parser.arg1())
            elif parser.commandType() == C_GOTO:
                wrt.writeGoto(parser.arg1())
            elif parser.commandType() == C_IFGOTO:
                wrt.writeIfGoto(parser.arg1())
            elif parser.commandType() == C_FUNCTION:
                wrt.writeFunction(parser.arg1(),parser.arg2())
            elif parser.commandType() == C_CALL:
                wrt.writeCall(parser.arg1(),parser.arg2())
            elif parser.commandType() == C_RETURN:
                wrt.writeReturn()
            else:
                assert(False)
    wrt.close()
