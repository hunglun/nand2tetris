# Fri Oct 27 04:27:04 +08 2017 use JackAnalyzer as baseline
# Fri Oct 27 04:42:30 +08 2017 starting symbol table
# Fri Nov 10 23:57:46 +08 2017 added type local for var declaration
# Sat Nov 11 10:03:20 +08 2017 added type field, static and arg for var dec
#                              added type info
# Sat Nov 11 13:58:36 +08 2017 create and populate 2 symbol tables
# Sat Nov 11 20:52:22 +08 2017 fix index in symbol table
# Sat Nov 11 23:17:01 +08 2017 remove multi-line comments
# Sun Nov 12 11:58:53 +08 2017 add getNVars function
#                              add SymbolTable and VMWriter class skeletons
# Sun Nov 12 14:22:48 +08 2017 implemented symbol table class
#                              apply symbol table class and refactor
# Mon Nov 13 08:23:32 +08 2017 implemented VMWriter
# Mon Nov 13 22:16:52 +08 2017 apply VMWriter return
# Thu Nov 16 01:41:12 +08 2017 apply writeArithmetic, writeCall
# Fri Nov 17 22:12:41 +08 2017 apply writePush(CONST, *), writeCall(library_function, *)
# Sat Nov 18 02:58:52 +08 2017 completed Seven
# Sat Nov 18 22:31:53 +08 2017 store return function value in a variable
# Sat Nov 18 23:46:04 +08 2017 every call add a return value to stack. pop temp 0 if return void
# Sun Nov 19 00:58:30 +08 2017 push argument to stack
# Sun Nov 19 09:56:24 +08 2017 handle true and false
#                              handle while
#                              write identifier
# Mon Nov 20 22:01:25 +08 2017 write if command
#                              avoid redundant write
#                              fix double 'gt'
#                              place 'and' correctly
#                              place 'add' correctly
#                              refactor
# Wed Nov 22 00:59:56 +08 2017 place 'not' correctly
#                              fix if-statement bugs
# Thu Nov 23 04:02:01 +08 2017 fix STATIC key error in transfer symbol table
# Thu Nov 23 04:58:24 +08 2017 distinguish object subroutine
#                              object subroutine has one implicit argument
#                              compile Square/Main.jack successfully
# Fri Nov 24 06:08:05 +08 2017 use THIS for field variables
#                              return this
#                              update THIS in method
#                              allocate memory in new constructor
#                              remove redundant labels
#                              add while counter
# TODO:
# - compile Square correctly

import sys,re,os,numbers

class Symboltable:
    def __init__(self):
        self.cls={}
        self.subroutine={}
        self.indices={
            "STATIC":-1,
            "FIELD":-1,
            "ARG":-1,
            "VAR":-1
        }

    def startSubroutine(self):
        self.subroutine={}
        self.indices["ARG"] = -1
        self.indices["VAR"] = -1

    def define(self, name, _type, kind):
        assert kind in ["STATIC","FIELD","ARG","VAR"]
        self.indices[kind] = self.indices[kind] + 1
        index = self.indices[kind]
        if kind in ["ARG","VAR"]:
            self.subroutine[name]=[_type,kind,index]
        else:
            self.cls[name]=[_type,kind,index]
    def varCount(self, kind):
        assert kind in ["STATIC","FIELD","ARG","VAR"]
        return self.indices[kind]+1

    def _template(self,name, symtableindex):
        if name in self.cls.keys():
            return self.cls[name][symtableindex]
        elif name in self.subroutine.keys():
            return self.subroutine[name][symtableindex]
        else:
            return None

    def typeOf(self, name):
        return self._template(name,0)

    def kindOf(self, name):
        return self._template(name,1)

    def indexOf(self, name):
        return self._template(name,2)

    def segmentOf(self, name):
        _dict = {"VAR":"LOCAL","ARG":"ARG","STATIC":"STATIC","FIELD":"THIS",None:None}
        return _dict[self.kindOf(name)]

class VMWriter:
    def __init__(self, vmfile):
        self.vmfile = open(vmfile,'w')
        self._dict = {
            "CONST": "constant",
            "LOCAL" : "local",
            "ARG": "argument",
            "TEMP": "temp",
            "STATIC": "static",
            "THIS": 'this',
            "POINTER": 'pointer'
        }

    def writePush(self, segment, index):
        assert segment in ["CONST","ARG","LOCAL","STATIC","THIS","THAT","POINTER","TEMP"]
        code = "push %s %d\n" % (self._dict[segment], index)
        self.vmfile.write(code)

    def writePop(self, segment, index):
        assert segment in ["CONST","ARG","LOCAL","STATIC","THIS","THAT","POINTER","TEMP"]
        code = "pop %s %d\n" % (self._dict[segment], index)
        self.vmfile.write(code)
        
    def writeArithmetic(self, command):
        assert command in ["ADD","SUB","AND","OR" ,"EQ" ,"GT" ,"LT" ,"NEG","NOT"]
        code = command.lower() + "\n"
        self.vmfile.write(code)

    def writeLabel(self, label):
        code = "label %s\n" % label
        self.vmfile.write(code)
        
    def writeGoto(self, label):
        code = "goto %s\n" % label
        self.vmfile.write(code)
        
    def writeIf(self, label):
        code = "if-goto %s\n" % label
        self.vmfile.write(code)
        
    def writeCall(self, name, nArgs):
        code = "call %s %d\n" % (name, nArgs)
        self.vmfile.write(code)

    def writeFunction(self, name,nLocals):
        code = "function %s %d\n" % (name, nLocals)
        self.vmfile.write(code)

    def writeReturn(self):
        self.vmfile.write("return\n")
        
    def close(self):
        self.vmfile.close()

def setCurrentScope(value):
    global CURRENTSCOPE
    CURRENTSCOPE = value
    return ""

def getCurrentScope():
    return CURRENTSCOPE


class Tokenizer:
    def __init__(self,filename):
        self.filename = filename
        self.content = []
        f = open(filename,'r')
        for line in f.readlines():
            line = line.strip()
            if line == "" or line.startswith("//"):
                continue
            if  line.startswith("*") or line.startswith("/*"):
                continue
            m=re.match(r"(.*?)//.*", line) or re.match(r"(.*?)/\**.*\*/", line)
            if m:
                line=m.group(1).strip()
            self.content.append(line)
        self.content = " ".join(self.content)
        m=re.match(r"/\**.*?\*/", self.content)
        if m:
            self.content=self.content.replace(m.group(0),"")
        self.token=None
        self.tokenType = None
        self.index = 0

    def hasMoreTokens(self):
        return len(self.content) > self.index
    
    def lookahead(self,expectedTokenType, tokenList=[]):
        # back up object attributes
        index = self.index
        token = self.token
        tokenType = self.tokenType
        if self.advance():
            _token = self.token
            _tokenType = self.tokenType
        else:
            _token = ""
            _tokenType = ""
        # restore object attributes
        self.index = index
        self.token = token
        self.tokenType = tokenType

        rs = _tokenType == expectedTokenType
        if tokenList:
            return rs and _token in tokenList
        else:
            return rs

    def lookahead2(self,expectedTokenType, tokenList=[]):
        # back up object attributes
        index = self.index
        token = self.token
        tokenType = self.tokenType
        if self.advance():
            _token = self.token
            _tokenType = self.tokenType
        else:
            _token = ""
            _tokenType = ""
        # second token
        if self.advance():
            _token = self.token
            _tokenType = self.tokenType
        else:
            _token = ""
            _tokenType = ""

        # restore object attributes
        self.index = index
        self.token = token
        self.tokenType = tokenType

        rs = _tokenType == expectedTokenType
        if tokenList:
            return rs and _token in tokenList
        else:
            return rs
        
    def advance(self):
        if not self.hasMoreTokens():
            assert(False)
        while self.content[self.index] in [' ', '\t', '\n']:
            self.index = self.index + 1
        self.token = self.keyword() or self.symbol() or self.integerConstant() or self.stringConstant() or self.identifier()
        if (self.token == None):
            assert False
#        print self.token,self.tokenType
        return True

    def keyword(self):
        p = r"(class )|(method )|(function )|(constructor )|(int )|(boolean )|(char )"
        p = p + r"|(void )|(var )|(static )|(field )|(let )|(do )|(if)|(else)|(while)"
        p = p + r"|(return)|(true)|(false)|(null)|(this)"
        m = re.match(p,self.content[self.index:])
        if m:
            token = m.group(0)
            self.index = self.index + len(token)
            self.tokenType = "keyword"
            return token.strip()
        return None

    def symbol(self):
        p = r"\{|\}|\(|\)|\[|\]|\.|,|;|\+|-|\*|/|&|\||<|>|=|~"
        m = re.match(p,self.content[self.index:])
        if m:
            token = m.group(0)
            self.index = self.index + len(token)
            self.tokenType = "symbol"
            if token == '<':
                return '&lt;'
            if token == '>':
                return '&gt;'
            if token == '&':
                return '&amp;'

            return token
        return None
    def integerConstant(self):
        p = r"[0-9]+"
        m = re.match(p,self.content[self.index:])
        if m:
            token = m.group(0)
            self.index = self.index + len(token)
            self.tokenType = "integerConstant"
            return token
        return None
    def stringConstant(self):
        p = r'"[^"]+"'
        m = re.match(p,self.content[self.index:])
        if m:
            token = m.group(0)
            self.index = self.index + len(token)
            self.tokenType = "stringConstant"
            return token.replace('"','')
        return None

    def identifier(self):
        p = r"[^0-9]{1}[0-9A-Za-z_]*"
        m = re.match(p,self.content[self.index:])
        if m:
            token = m.group(0)
            self.index = self.index + len(token)
            self.tokenType = "identifier"
            return token
        return None

    def generateXml(self):
        outbuf = ["<tokens>"]
        while(self.hasMoreTokens()):
            self.advance()
            outbuf.append("<%s> %s </%s>" % (self.tokenType,self.token,self.tokenType))
        outbuf.append("</tokens>")
        tempfile = open(self.filename.replace('.jack','.T.xml'),'w')
        tempfile.write("\n".join(outbuf))
        tempfile.close()

class CompilationEngine:
    def __init__(self, filename):
        self.filename = filename
        self.tn = Tokenizer(filename)
        self.symtable = Symboltable()
        self.classname = ""
        self.subroutine_name = ""
        self.operators_table = {
            "*" : ["Math.multiply",2],
            "/" : ["Math.divide",2],
            "+" : ["ADD"],
            "-" : ["SUB"],
            "&amp;" : ["AND"],
            "|" : ["OR"],
            "&lt;" : ["LT"],
            "&gt;" : ["GT"],
            "="  : ["EQ"],
            "~"  : ["NOT"]
        }
        self.opsymbols = self.operators_table.keys()
        self.ifcounter = -1
        self.whilecounter = -1
        self.nargs = 0
        self.subroutine_type = None

    def generateXml(self):
        self.vm = VMWriter(self.filename.replace(".jack",".2.vm"))

        outfilepath = self.filename.replace(".jack",".P.xml")
        f = open(outfilepath,'w')
        f.write(self.compileClass())
        f.close()
        print outfilepath,"is generated!"

        self.vm.close()

    def compileClass(self):
        rs = "<class>\n"
        rs = rs + self.compileterminal("keyword",["class",None])
        rs = rs + self.compileterminal("identifier",declare=["class",None])
        setCurrentScope(self.tn.token)
        self.classname = self.tn.token
        rs = rs + self.compileterminal("symbol",["{"])
        # classVarDec*
        rs = rs + self.star(self.compileclassVarDec)
        # subroutineDec*
        rs = rs + self.star(self.compilesubroutineDec)
        rs = rs + self.compileterminal("symbol",["}"])
        rs = rs + "</class>"
        return rs

    def compileclassVarDec(self):
        rs = ""
        tn = self.tn
        if not tn.lookahead("keyword",["static","field"]):
            return ""

        rs = rs + self.compileterminal("keyword",["static","field"])
        kind = self.tn.token.upper()
        rs = rs + self.compiletype()
        _type = self.tn.token
        declare=[kind,_type]
        rs = rs + self.compilevarName(declare=declare)
        rs = rs + self.star(self.compilevarName,None,True,declare)
        rs = rs + self.compileterminal("symbol",[";"])
        return "<classVarDec>\n" + rs + "</classVarDec>\n"
    def compiletype(self):
        rs = self.compileterminal("keyword",['int','char','boolean'])
        rs = rs or self.compileclassName()
	return rs

    def compileterminal(self, expectedType, tokenList=[],declare=[]):
        tn = self.tn
        if not tn.lookahead(expectedType,tokenList):
            return ""
        tn.advance()
        if tokenList:
            assert(tn.token in tokenList)
        if tn.tokenType == "identifier":
            if declare:
                kind = declare[0]
                _type = declare[1]
                if kind in ["VAR","ARG","STATIC","FIELD"]:
                    self.symtable.define(tn.token,_type,kind)
            if declare and declare[0] == "subroutine":
                name = getCurrentScope() + "." + tn.token
                return "<%s> %s </%s>%s\n" % (tn.tokenType,tn.token,tn.tokenType,name)
            
        if expectedType == "keyword" and tn.token in ["constructor","function","method"]:
            return "<%s> %s </%s>%s\n" % (tn.tokenType,tn.token,tn.tokenType,"function")
        return "<%s> %s </%s>\n" % (tn.tokenType,tn.token,tn.tokenType)
        
    def compilesubroutineDec(self):
        rs = ""
        tn = self.tn
        if not tn.lookahead("keyword",["constructor","function","method"]):
            return ""
        self.ifcounter = -1

        self.symtable.startSubroutine()

        rs = "<subroutineDec>\n"
        rs = rs + self.compileterminal("keyword",["constructor","function","method"])
        self.subroutine_type = self.tn.token
        if self.tn.lookahead("keyword",["void","int","char","boolean"]):
            rs = rs + self.compileterminal("keyword",["void","int","char","boolean"])
        else:
            rs = rs + self.compileclassName()
        _type = self.tn.token
        rs = rs + self.compileterminal("identifier",declare=["subroutine",_type])
        self.subroutine_name = self.tn.token
        rs = rs + self.compileterminal("symbol",["("])
        rs = rs + self.compileparameterList()
        rs = rs + self.compileterminal("symbol",[")"])
        rs = rs + self.compilesubroutineBody()
        rs = rs + "</subroutineDec>\n"
        return rs

    def compileparameterList(self):
        rs = ""
        rs = rs + self.compiletype()
        _type = self.tn.token
        kind = "ARG"
        declare = [kind,_type]
        rs = rs + self.compileterminal("identifier",declare=declare)
        rs = rs + self.star(self.compiletype,self.compilevarName,True,[],declare)
        return "<parameterList>\n" + rs + "</parameterList>\n"

    # TODO simplify this function
    def chainops(self,operator,operand):
        rs = ""
        temp = ""

        temp = temp + operator()
        f = self.operators_table[self.tn.token]
        temp = temp + operand()
        if len(f) == 1:
            self.vm.writeArithmetic(f[0])
        else:
            self.vm.writeCall(f[0],f[1])

        while temp:
            rs = rs + temp
            temp = operator()
            if temp:
                f = self.operators_table[self.tn.token]
                temp = temp + operand()
                if len(f) == 1:
                    self.vm.writeArithmetic(f[0])
                else:
                    self.vm.writeCall(f[0],f[1])

        return rs
        
    def star(self,compiler1,compiler2=None,comma=False,declare1=[],declare2=[]):

        rs = ""
        temp = ""
        if comma:
            temp = self.compileterminal("symbol",[","])
        if declare1:
            temp = temp + compiler1(declare=declare1)
        else:
            temp = temp + compiler1()

        if compiler2:
            if declare2:
                temp = temp + compiler2(declare=declare2)
            else:
                temp = temp + compiler2()
        while temp:
            rs = rs + temp
            if comma:
                self.nargs = self.nargs + 1
                if declare1:
                    temp = self.compileterminal("symbol",[","]) + compiler1(declare1)
                else:
                    temp = self.compileterminal("symbol",[","]) + compiler1()
            else:
                if declare1:
                    temp = compiler1(declare1)
                else:
                    temp = compiler1()
            if compiler2:
                if declare2:
                    temp = temp + compiler2(declare2)
                else:
                    temp = temp + compiler2()

        return rs

    def compilesubroutineBody(self):
        rs = "<subroutineBody>\n"
        rs = rs + self.compileterminal("symbol",["{"])
        # varDec*
        rs = rs + self.star(self.compilevarDec)
        nlocals = self.symtable.varCount("VAR")
        self.vm.writeFunction(self.classname + "." + self.subroutine_name, nlocals)
        if self.subroutine_type == "method":
            self.vm.writePush("ARG",0)
            self.vm.writePop("POINTER",0)
        if self.subroutine_type == "constructor":
            nfields = self.symtable.varCount("FIELD")
            self.vm.writePush("CONST", nfields)
            self.vm.writeCall("Memory.alloc",1)
            self.vm.writePop("POINTER", 0)
        rs = rs + self.compilestatements()
        rs = rs + self.compileterminal("symbol",["}"])
        rs = rs + "</subroutineBody>\n"
	return rs
    def compilevarDec(self):
        if not self.tn.lookahead("keyword",["var"]):
            return ""
        
        rs = "<varDec>\n"
        rs = rs + self.compileterminal("keyword",["var"])
        rs = rs + self.compiletype()
        _type = self.tn.token
        kind = "VAR"
        declare=[kind,_type]
        rs = rs + self.compileterminal("identifier",declare)
        rs = rs + self.star(self.compilevarName,None,True,declare)
        rs = rs + self.compileterminal("symbol",[";"])
        rs = rs + "</varDec>\n"
        return rs
    def compileclassName(self):
	return self.compileterminal("identifier",declare=["class",None])
    def compilesubroutineName(self):
        return self.compileterminal("identifier")
    def compilevarName(self, declare=[]):
        return self.compileterminal("identifier",declare=declare)
    def compilestatements(self):
        return "<statements>\n" + self.star(self.compilestatement) + "</statements>\n"

    def compilestatement(self):
	return self.compileletStatement() or self.compileifStatement() or self.compilewhileStatement() or self.compiledoStatement() or self.compilereturnStatement()
    def compileletStatement(self):
        if not self.tn.lookahead("keyword",["let"]):
            return ""
        rs = self.compileterminal("keyword",["let"])
        rs = rs + self.compilevarName()
        varname = self.tn.token
        if self.tn.lookahead("symbol",["["]):
            rs = rs + self.compileterminal("symbol","[")
            
            rs = rs + self.compileexpression()

            rs = rs + self.compileterminal("symbol","]")
        rs = rs + self.compileterminal("symbol","=")
        
        rs = rs + self.compileexpression()        

        rs = rs + self.compileterminal("symbol",";")
        self.vm.writePop(self.symtable.segmentOf(varname),self.symtable.indexOf(varname))
	return "<letStatement>\n" + rs + "</letStatement>\n"
    def compileifStatement(self):
        if not self.tn.lookahead("keyword",["if"]):
            return ""
        self.ifcounter = self.ifcounter + 1
        ifcounter = self.ifcounter
        rs = self.compileterminal("keyword",["if"])
        rs = rs + self.compileterminal("symbol",["("])
        
        rs = rs + self.compileexpression()

#        self.vm.writeArithmetic("NOT")
        self.vm.writeIf("IF_TRUE%d" % ifcounter)
        self.vm.writeGoto("IF_FALSE%d" % ifcounter)
        self.vm.writeLabel("IF_TRUE%d" % ifcounter)

        rs = rs + self.compileterminal("symbol",[")"])
        rs = rs + self.compileterminal("symbol",["{"])
        rs = rs + self.compilestatements()
        rs = rs + self.compileterminal("symbol",["}"])
        if self.tn.lookahead("keyword",["else"]):
            self.vm.writeGoto("IF_END%d" % ifcounter)
        self.vm.writeLabel("IF_FALSE%d" % ifcounter)
        if self.tn.lookahead("keyword",["else"]):
            rs = rs + self.compileterminal("keyword",["else"])
            rs = rs + self.compileterminal("symbol",["{"])
            rs = rs + self.compilestatements()
            rs = rs + self.compileterminal("symbol",["}"])
            self.vm.writeLabel("IF_END%d" % ifcounter)
	return "<ifStatement>\n" + rs + "</ifStatement>\n"
    def compilewhileStatement(self):
        if not self.tn.lookahead("keyword",["while"]):
            return ""
        self.whilecounter = self.whilecounter + 1
        whilecounter = self.whilecounter

        self.vm.writeLabel("WHILE_EXP%d" % whilecounter) # assign a running index to label
        rs = self.compileterminal("keyword",["while"])
        rs = rs + self.compileterminal("symbol",["("])
        
        _exp = self.compileexpression()

        self.vm.writeArithmetic("NOT")
        self.vm.writeIf("WHILE_END%d" % whilecounter)
        rs = rs + _exp
        rs = rs + self.compileterminal("symbol",[")"])
        rs = rs + self.compileterminal("symbol",["{"])
        rs = rs + self.compilestatements()
        rs = rs + self.compileterminal("symbol",["}"])
        self.vm.writeGoto("WHILE_EXP%d" % whilecounter)
        self.vm.writeLabel("WHILE_END%d" % whilecounter) # assign a running index to label
	return "<whileStatement>\n" + rs + "</whileStatement>\n"
    def compiledoStatement(self):
        if not self.tn.lookahead("keyword",["do"]):
            return ""

	rs = self.compileterminal("keyword",["do"])
        
        rs = rs + self.compilesubroutineCall()
        rs = rs + self.compileterminal("symbol",[";"])
        self.vm.writePop("TEMP",0)
        return  "<doStatement>\n" + rs + "</doStatement>\n"
    def compilereturnStatement(self):
        if not self.tn.lookahead("keyword",["return"]):
            return ""
	rs = self.compileterminal("keyword",["return"])

        if self.tn.lookahead("symbol",[";"]):
            self.vm.writePush("CONST",0)
        
        rs = rs + self.compileexpression()

        rs = rs + self.compileterminal("symbol",[";"])

        self.vm.writeReturn()

        return  "<returnStatement>\n" + rs + "</returnStatement>\n"
    def compileexpression(self):

        rs = self.compileterm()
        if self.tn.lookahead("symbol",self.opsymbols):
            rs = rs + self.chainops(self.compileop,self.compileterm)

        if rs:
            return "<expression>\n" + rs + "</expression>\n"
        return ""
    def compileterm(self):
        if self.compileterminal("integerConstant"):
            self.vm.writePush("CONST",int(self.tn.token))
        elif self.compileterminal("stringConstant"):
            pass
        elif self.compileterminal("keyword",["true","false","null","this"]):
            if self.tn.token == "false":
                self.vm.writePush("CONST",0)
            if self.tn.token == "true":
                self.vm.writePush("CONST",0)
                self.vm.writeArithmetic("NOT")
            if self.tn.token == "this":
                self.vm.writePush("POINTER",0)
            
        elif self.tn.lookahead2("symbol","["): 
            ( self.compilevarName()
              + self.compileterminal("symbol",["["])
              + self.compileexpression()
              + self.compileterminal("symbol",["]"]))
        elif self.tn.lookahead("symbol","("):
            (self.compileterminal("symbol",["("])
             + self.compileexpression()
             + self.compileterminal("symbol",[")"]))
        elif self.tn.lookahead("symbol",["~","-"]):
            self.compileunaryOp()
            token = self.tn.token
            self.compileterm()
            _dict = {"-" : "NEG", "~" : "NOT" }
            self.vm.writeArithmetic(_dict[token])
        elif self.compilesubroutineCall():
            pass
        elif self.compilevarName():
            segment = self.symtable.segmentOf(self.tn.token)
            index = self.symtable.indexOf(self.tn.token)
            self.vm.writePush(segment,index)

        else:
            return ""
        return "TRUE"
    def compilesubroutineCall(self):
        rs = ""

        name = ""
        if self.tn.lookahead2("symbol",["."]):
            rs = self.compileclassName() or self.compilevarName()
            implicit_arg = 0
            name = self.tn.token
            if self.symtable.typeOf(name):
                segment = self.symtable.segmentOf(name)
                index = self.symtable.indexOf(name)
                self.vm.writePush(segment,index)
                name = self.symtable.typeOf(name)
                implicit_arg = 1
            rs = rs + self.compileterminal("symbol",["."])
            rs = rs + self.compilesubroutineName()
            name = name + "." + self.tn.token
            rs = rs + self.compileterminal("symbol",["("])
            _explist = self.compileexpressionList()
            rs = rs + _explist
            rs = rs + self.compileterminal("symbol",[")"])
            self.vm.writeCall(name,self.nargs + implicit_arg)
        elif self.tn.lookahead2("symbol",["("]):
            rs = self.compilesubroutineName()
            name = self.tn.token
            rs = rs + self.compileterminal("symbol","(")
            _explist = self.compileexpressionList()
            rs = rs + _explist
            self.vm.writeCall(name,self.nargs)
            rs = rs + self.compileterminal("symbol",")")
        else:
            rs = ""

	return rs
    def compileexpressionList(self):
        rs = ""
        self.nargs = 0
        if not self.tn.lookahead("symbol",[")"]):
            rs = self.compileexpression()
            if rs:
                self.nargs = 1
        if self.tn.lookahead("symbol",[","]):
            _exps= self.star(self.compileexpression,None,True)
            rs = rs + _exps

        return "<expressionList>\n" + rs + "</expressionList>\n"

    def compileop(self):
        rs = self.compileterminal("symbol",self.opsymbols)
	return rs
    
    def compileunaryOp(self):
        rs = self.compileterminal("symbol",["-","~"])
        return rs


    

if __name__ == "__main__":
    dirpath=None
    jackfiles = []
    tn = None
    prgarg1 = sys.argv[1]
    if prgarg1.endswith('.jack'): # overwrite the above options
        dirpath=os.path.dirname(prgarg1)
        jackfiles = [prgarg1]
    else:
        dirpath = prgarg1
        jackfiles = [os.path.join(dirpath, f) for f in os.listdir(dirpath) if f.endswith(".jack")]

    for f in jackfiles:
        tn = Tokenizer(f)
        tn.generateXml()
        ce = CompilationEngine(f)
#        print ce.compileClass()
        ce.generateXml()
        print "Class Symbol Table"
        print ce.symtable.cls
        print "Transfer Symbol Table"
        print ce.symtable.subroutine
