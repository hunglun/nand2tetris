# Wed Oct 18 17:30:32 +08 2017 start tokenizer
# Thu Oct 19 22:17:21 +08 2017 passed one test
# Thu Oct 19 23:32:11 +08 2017 completed tokenizer
# Fri Oct 20 18:34:40 +08 2017 start writing parser on Jetstar 3k695
# Sat Oct 21 07:33:03 +08 2017 passed simple test
# Sun Oct 22 08:08:54 +08 2017 added compiler helper functions
# Sun Oct 22 09:39:16 +08 2017 detect bugs in parameterlist and star
# Mon Oct 23 03:33:17 +08 2017 fixed both bugs
# Tue Oct 24 23:45:53 +08 2017 fixing bugs in parser
# Thu Oct 26 07:00:56 +08 2017 completed Parser!


import sys,re,os,numbers

class Tokenizer:
    def __init__(self,filename):
        self.filename = filename
        self.content = []
        f = open(filename,'r')
        for line in f.readlines():
            line = line.strip()
            if line == "" or line.startswith("//"):
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
    def generateXml(self):
        outfilepath = self.filename.replace(".jack",".P.xml")
        f = open(outfilepath,'w')
        f.write(self.compileClass())
        f.close()
        print outfilepath,"is generated!"
    def compileClass(self):
        rs = "<class>\n"
        rs = rs + self.compileterminal("keyword",["class"])
        rs = rs + self.compileterminal("identifier")
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
        rs = rs + self.compiletype()
        rs = rs + self.compilevarName()
        rs = rs + self.star(self.compilevarName,None,True)
        rs = rs + self.compileterminal("symbol",[";"])
        return "<classVarDec>\n" + rs + "</classVarDec>\n"
    def compiletype(self):
        rs = self.compileterminal("keyword",['int','char','boolean'])
        rs = rs or self.compileterminal("identifier")
	return rs
    def compileterminal(self, expectedType, tokenList=[]):
        tn = self.tn
        if not tn.lookahead(expectedType,tokenList):
            return ""
        tn.advance()
        if tokenList:
            assert(tn.token in tokenList)
        return "<%s> %s </%s>\n" % (tn.tokenType,tn.token,tn.tokenType)
        
    def compilesubroutineDec(self):
        rs = ""
        tn = self.tn
        if not tn.lookahead("keyword",["constructor","function","method"]):
            return ""
        
        rs = "<subroutineDec>\n"
        rs = rs + self.compileterminal("keyword",["constructor","function","method"])
        if self.tn.lookahead("keyword",["void","int","char","boolean"]):
            rs = rs + self.compileterminal("keyword",["void","int","char","boolean"])
        else:
            rs = rs + self.compileclassName()
        rs = rs + self.compileterminal("identifier")
        rs = rs + self.compileterminal("symbol",["("])
        rs = rs + self.compileparameterList()
        rs = rs + self.compileterminal("symbol",[")"])
        rs = rs + self.compilesubroutineBody()
        rs = rs + "</subroutineDec>\n"
        return rs

    def compileparameterList(self):
        rs = ""
        rs = rs + self.compiletype()
        rs = rs + self.compileterminal("identifier")
        rs = rs + self.star(self.compiletype,self.compilevarName,True)
        return "<parameterList>\n" + rs + "</parameterList>\n"

    def star(self,compiler1,compiler2=None,comma=False):
        rs = ""
        temp = ""
        if comma:
            temp = self.compileterminal("symbol",[","])
        temp = temp + compiler1()
        if compiler2:
            temp = temp + compiler2()
        while temp:
            rs = rs + temp
            if comma:
                temp = self.compileterminal("symbol",[","]) + compiler1()
            else:
                temp = compiler1()
            if compiler2:
                temp = temp + compiler2()

        return rs

    def compilesubroutineBody(self):
        rs = "<subroutineBody>\n"
        rs = rs + self.compileterminal("symbol",["{"])
        # varDec*
        rs = rs + self.star(self.compilevarDec)
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
        rs = rs + self.compileterminal("identifier")
        rs = rs + self.star(self.compilevarName,None,True)
        rs = rs + self.compileterminal("symbol",[";"])
        rs = rs + "</varDec>\n"
        return rs
    def compileclassName(self):
	return self.compileterminal("identifier")
    def compilesubroutineName(self):
        return self.compileterminal("identifier")
    def compilevarName(self):
        return self.compileterminal("identifier")
    def compilestatements(self):
        return "<statements>\n" + self.star(self.compilestatement) + "</statements>\n"

    def compilestatement(self):
	return self.compileletStatement() or self.compileifStatement() or self.compilewhileStatement() or self.compiledoStatement() or self.compilereturnStatement()
    def compileletStatement(self):
        if not self.tn.lookahead("keyword",["let"]):
            return ""
        rs = self.compileterminal("keyword",["let"])
        rs = rs + self.compilevarName()
        if self.tn.lookahead("symbol",["["]):
            rs = rs + self.compileterminal("symbol","[")
            rs = rs + self.compileexpression()
            rs = rs + self.compileterminal("symbol","]")
        rs = rs + self.compileterminal("symbol","=")
        rs = rs + self.compileexpression()
        rs = rs + self.compileterminal("symbol",";")
	return "<letStatement>\n" + rs + "</letStatement>\n"
    def compileifStatement(self):
        if not self.tn.lookahead("keyword",["if"]):
            return ""

        rs = self.compileterminal("keyword",["if"])
        rs = rs + self.compileterminal("symbol",["("])
        rs = rs + self.compileexpression()
        rs = rs + self.compileterminal("symbol",[")"])
        rs = rs + self.compileterminal("symbol",["{"])
        rs = rs + self.compilestatements()
        rs = rs + self.compileterminal("symbol",["}"])

        if self.tn.lookahead("keyword",["else"]):
            rs = rs + self.compileterminal("keyword",["else"])
            rs = rs + self.compileterminal("symbol",["{"])
            rs = rs + self.compilestatements()
            rs = rs + self.compileterminal("symbol",["}"])
	return "<ifStatement>\n" + rs + "</ifStatement>\n"
    def compilewhileStatement(self):
        if not self.tn.lookahead("keyword",["while"]):
            return ""

        rs = self.compileterminal("keyword",["while"])
        rs = rs + self.compileterminal("symbol",["("])
        rs = rs + self.compileexpression()
        rs = rs + self.compileterminal("symbol",[")"])
        rs = rs + self.compileterminal("symbol",["{"])
        rs = rs + self.compilestatements()
        rs = rs + self.compileterminal("symbol",["}"])
	return "<whileStatement>\n" + rs + "</whileStatement>\n"
    def compiledoStatement(self):
        if not self.tn.lookahead("keyword",["do"]):
            return ""

	rs = self.compileterminal("keyword",["do"])
        rs = rs + self.compilesubroutineCall()
        rs = rs + self.compileterminal("symbol",[";"])
        return  "<doStatement>\n" + rs + "</doStatement>\n"
    def compilereturnStatement(self):
        if not self.tn.lookahead("keyword",["return"]):
            return ""

	rs = self.compileterminal("keyword",["return"])
        rs = rs + self.compileexpression()
        rs = rs + self.compileterminal("symbol",[";"])

        return  "<returnStatement>\n" + rs + "</returnStatement>\n"
    def compileexpression(self):
        rs = self.compileterm()
        opsymbols = "+ - * / &amp; | &lt; &gt; =".split(" ")
        if self.tn.lookahead("symbol",opsymbols):
            rs = rs + self.star(self.compileop,self.compileterm)
        if rs:
            return "<expression>\n" + rs + "</expression>\n"
        return ""
    def compileterm(self):
        rs = self.compileterminal("integerConstant")
        rs = rs or self.compileterminal("stringConstant")
        rs = rs or self.compileterminal("keyword",["true","false","null","this"])
        if self.tn.lookahead2("symbol","["):
            rs = rs or (self.compilevarName()
                        + self.compileterminal("symbol",["["])
                        + self.compileexpression()
                        + self.compileterminal("symbol",["]"]))

        if self.tn.lookahead("symbol","("):
            rs = rs or (self.compileterminal("symbol",["("])
                        + self.compileexpression()
                        + self.compileterminal("symbol",[")"]))

        if self.tn.lookahead("symbol",["~","-"]):
            rs = rs or (self.compileunaryOp() + self.compileterm())

        rs = rs or self.compilesubroutineCall()

        rs = rs or self.compilevarName()
        if rs:
	    return "<term>\n" + rs + "</term>\n"
        else:
            return ""
    def compilesubroutineCall(self):
        rs = ""
        if self.tn.lookahead2("symbol",["."]):
            rs = self.compileclassName() or self.compilevarName()
            rs = rs + self.compileterminal("symbol",["."])
            rs = rs + self.compilesubroutineName()
            rs = rs + self.compileterminal("symbol",["("])
            rs = rs + self.compileexpressionList()
            rs = rs + self.compileterminal("symbol",[")"])
        elif self.tn.lookahead2("symbol",["("]):
            rs = self.compilesubroutineName()
            rs = rs + self.compileterminal("symbol","(")
            rs = rs + self.compileexpressionList()
            rs = rs + self.compileterminal("symbol",")")
        else:
            rs = ""
	return rs
    def compileexpressionList(self):
        rs = ""
        if not self.tn.lookahead("symbol",[")"]):
            rs = self.compileexpression()
        if self.tn.lookahead("symbol",[","]):
            rs = rs + self.star(self.compileexpression,None,True)
        return "<expressionList>\n" + rs + "</expressionList>\n"

    def compileop(self):
        opsymbols = "+ - * / &amp; | &lt; &gt; =".split(" ")
	return self.compileterminal("symbol",opsymbols)
    def compileunaryOp(self):
        return self.compileterminal("symbol",["-","~"])

    

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
