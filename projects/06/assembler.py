# Edit History
# Mon Oct  2 21:11:33 +08 2017 - created a symbol-less assembler
# Tue Oct  3 05:43:37 +08 2017 - completed symbol-less assembler
# Tue Oct  3 21:08:13 +08 2017 - completed on symbol assembler

#1 ignore comment, whitespace and empty lines
#2 symbol consists of letters, digits, _, . , $,:, and it does not begin with digit
import sys,re
def save(filename, content):
    f=open(filename.replace('.asm','.hack1'),'w')
    f.write(content)
    f.close()

def lookupdest(dest):
    if dest == '':
        return '000'
    if dest == 'M':
        return '001'
    if dest == 'D':
        return '010'
    if dest == 'MD':
        return '011'
    if dest == 'A':
        return '100'
    if dest == 'AM':
        return '101'
    if dest == 'AD':
        return '110'
    if dest == 'AMD':
        return '111'
    assert(False)

def lookupcomp(comp):
    if comp == '0':
        return '0101010'
    if comp == '1':
        return '0111111'
    if comp == '-1':
        return '0111010'
    if comp == 'D':
        return '0001100'
    if comp == 'A':
        return '0110000'
    if comp == '!D':
        return '0001101'
    if comp == '!A':
        return '0110001'
    if comp == '-D':
        return '0001111'
    if comp == '-A':
        return '0110011'
    if comp == 'D+1':
        return '0011111'
    if comp == 'A+1':
        return '0110111'
    if comp == 'D-1':
        return '0001110'
    if comp == 'A-1':
        return '0110010'
    if comp == 'D+A':
        return '0000010'
    if comp == 'D-A':
        return '0010011'
    if comp == 'A-D':
        return '0000111'
    if comp == 'D&A':
        return '0000000'
    if comp == 'D|A':
        return '0010101'

    if comp == 'M':
        return '1110000'
    if comp == '!M':
        return '1110001'
    if comp == '-M':
        return '1110011'
    if comp == 'M+1':
        return '1110111'
    if comp == 'M-1':
        return '1110010'
    if comp == 'D+M':
        return '1000010'
    if comp == 'D-M':
        return '1010011'
    if comp == 'M-D':
        return '1000111'
    if comp == 'D&M':
        return '1000000'
    if comp == 'D|M':
        return '1010101'
    print comp
    assert(False)

def lookupjump(jump):
    if jump == '':
        return '000'
    if jump == 'JGT':
        return '001'
    if jump == 'JEQ':
        return '010'
    if jump == 'JGE':
        return '011'
    if jump == 'JLT':
        return '100'
    if jump == 'JNE':
        return '101'
    if jump == 'JLE':
        return '110'
    if jump == 'JMP':
        return '111'
    assert(False)

def cparser(line):
    # c instruction parser
    dest = ''
    jump = ''
    comp = ''
    line = line.replace(' ','')
    line = line.replace('    ','')
    tokens_eq = line.split('=')
    if len(tokens_eq) == 2:
        dest = tokens_eq[0]

    tokens_sc = line.split(';')
    if len(tokens_sc) == 2:
        jump = tokens_sc[1]

    # extract cmp
    if jump == '' and dest == '': # comp
        comp = line
    if jump == '' and dest: # dest=comp
        comp = tokens_eq[1]
    if jump and dest == '': # comp;jump
        comp = tokens_sc[0]
    return [comp,dest,jump]

VAR_COUNT = 16

def translate(line):
    global VAR_COUNT
    global SYMTABLE
    if line.startswith('@'):
        val=line.split('@')[1]
        if not val.isdigit():
            # check for symbol
            key=SYMTABLE.get(val)
            if key==None:
                SYMTABLE[val]=VAR_COUNT
                key = VAR_COUNT
                VAR_COUNT = VAR_COUNT + 1
            return '{:016b}'.format(key)
        return '{:016b}'.format(int(val))
    else: # C-Instruction : dest=comp;jump
        [comp,dest,jump] = cparser(line)
        return "111" + lookupcomp(comp) + lookupdest(dest) + lookupjump(jump)

SYMTABLE = {
    "SP": 0,
    "LCL": 1,
    "ARG": 2,
    "THIS": 3,
    "THAT": 4,
    "R0": 0,
    "R1": 1,
    "R2": 2,
    "R3": 3,
    "R4": 4,
    "R5": 5,
    "R6": 6,
    "R7": 7,
    "R8": 8,
    "R9": 9,
    "R10": 10,
    "R11": 11,
    "R12": 12,
    "R13": 13,
    "R14": 14,
    "R15": 15,
    "SCREEN": 0x4000,
    "KBD": 0x6000,
    "KEYBOARD": 0x6000
    }
LABEL_COUNT = 0
def update_symboltable(line):
    global LABEL_COUNT
    global SYMTABLE
    if line.startswith('('):
        label=line.replace('(','').replace(')','')
        SYMTABLE[label]=LABEL_COUNT
    else:
        LABEL_COUNT = LABEL_COUNT + 1

if __name__ == "__main__":
    filename = sys.argv[1]
    print "Assembling "+ filename
    f=open(filename,'r')
    # first pass to populate symbol-table
    for line in f.readlines():
        line = line.strip()
        if line == "" or line.startswith("//"):
            continue
        m=re.match(r"(.+?)//.*", line)
        if m:
            line=m.group(1).strip()
        update_symboltable(line)
    f.close()
    f=open(filename,'r')

    content = ""
    for line in f.readlines():
        line = line.strip()
        if line == "" or line.startswith("//") or line.startswith('('):
            continue
        m=re.match(r"(.+?)//.*", line)
        if m:
            line=m.group(1).strip()

        content = content + translate(line) + "\n"
    save(filename,content)
