# Thu Oct  5 21:52:59 +08 2017 - created
# Fri Oct  6 07:22:29 +08 2017 - replace @sp with @0, passed SimpleAdd test
# Sun Oct  8 11:59:58 +08 2017 - passed StackTest
# Mon Oct  9 20:47:33 +08 2017 - completed Memory Access & Arithmetic Operation


import sys,re
C_ARITHMETIC = 0
C_PUSH = 1
C_POP = 2
C_FUNCTION = 3
C_CALL = 4
C_UNKNOWN = 99
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
        self.programcounter=0
        self.programsize = len(self.content)
        self.tokens = self.content[self.programcounter].split(' ')

    def hasMoreCommands(self):
        return self.programcounter < self.programsize

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

    def arg1(self):
        if self.commandType() == C_ARITHMETIC:
            return self.tokens[0]
        assert len(self.tokens) > 0
        return self.tokens[1]

    def arg2(self):
        assert len(self.tokens) == 3
        assert self.commandType() in [C_PUSH,C_POP,C_FUNCTION,C_CALL]
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
    "static": "16"
    

}

class CodeWriter:

    def __init__(self, filepath):
        self.filename = filepath.replace('.vm','.asm')
        self.file=open(self.filename,'w')
        self.buffer = []
        self.buffer.append("@256") # initialise stack pointer to 256
        self.buffer.append("D=A")
        self.buffer.append("@0")
        self.buffer.append("M=D")
        self.counter = 0
    def setFileName(self,fileName):
        self.filename = filename
    def writeArithmetic(self,command):
        self.counter = self.counter + 1
        if command in ["add","sub","and","or"]:
            self.buffer.append("@0")
            self.buffer.append("M=M-1")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("D=M") # assign deferenced value to D
            self.buffer.append("A=A+1") # access sp+1
            self.buffer.append("D=D%sM" % MAP1[command]) # add up, and other binary operation
            self.buffer.append("A=A-1") # access sp
            self.buffer.append("M=D")
        elif command in ["eq","gt","lt"]:
            self.buffer.append("@0")
            self.buffer.append("M=M-1")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("D=M") # assign deferenced value to D
            self.buffer.append("A=A+1") # access sp+1
            self.buffer.append("D=D-M") # add up, and other binary operation
            self.buffer.append("@TRUE%d" % self.counter)
            self.buffer.append("D;"+MAP1[command])
            self.buffer.append("@0") # if FALSE
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("M=0")
            self.buffer.append("@ADJUSTSP%d" % self.counter)
            self.buffer.append("0;JMP")
            self.buffer.append("(TRUE%d)" % self.counter) # if TRUE
            self.buffer.append("@0")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("M=-1")
            self.buffer.append("(ADJUSTSP%d)" % self.counter)
        elif command in ["neg", "not"]:
            self.buffer.append("@0")
            self.buffer.append("A=M-1") # access value at addressed pointed by sp
            self.buffer.append("M=%sM" % MAP1[command]) # assign deferenced value to D
        else:
            assert(False)

    def writePushPop(self, command, segment, index):
        if command == C_PUSH:
            if segment == "pointer":
                self.buffer.append("@" + str(3+int(index)))
                self.buffer.append("D=M")
            else:
                if segment == "constant":
                    self.buffer.append("@" + index)
                    self.buffer.append("D=A")
                else:
                    
                    self.buffer.append("@%s"% MAP1[segment])
                    if segment == "temp" or segment == "static":
                        self.buffer.append("D=A")
                    else:
                        self.buffer.append("D=M")
                    self.buffer.append("@"+index)
                    self.buffer.append("A=A+D")
                    self.buffer.append("D=M") 
            self.buffer.append("@0")
            self.buffer.append("A=M")
            self.buffer.append("M=D")
            self.buffer.append("@0")
            self.buffer.append("M=M+1")
        if command == C_POP:
            if segment == "pointer":
                self.buffer.append("@" + str(3+int(index)))
                self.buffer.append("D=A")
            else:
                self.buffer.append("@"+index)
                self.buffer.append("D=A")
                self.buffer.append("@%s" % MAP1[segment])
                if segment == "temp" or segment == "static":
                    self.buffer.append("D=A+D")
                else:
                    self.buffer.append("D=M+D")
            self.buffer.append("@13")
            self.buffer.append("M=D") # store the address at @13
            
            self.buffer.append("@0")
            self.buffer.append("M=M-1")
            self.buffer.append("A=M")
            self.buffer.append("D=M") # pop latest entry
            self.buffer.append("@13")
            self.buffer.append("A=M")
            self.buffer.append("M=D") # store popped value to target segment

            
                
    def close(self):
        print self.filename, "created"
        self.file.write("\n".join(self.buffer))
        self.file.close()
        

if __name__ == "__main__":
    filepath = sys.argv[1]
    parser = Parser(filepath)
    wrt = CodeWriter(filepath)
    while parser.hasMoreCommands():
        parser.advance()
        if parser.commandType() == C_ARITHMETIC:
            wrt.writeArithmetic(parser.arg1())
        elif parser.commandType() == C_PUSH:
            wrt.writePushPop(C_PUSH, parser.arg1(), parser.arg2())
        elif parser.commandType() == C_POP:
            wrt.writePushPop(C_POP, parser.arg1(), parser.arg2())
        else:
            assert(False)
    wrt.close()
