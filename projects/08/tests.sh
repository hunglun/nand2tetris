python VMTranslator.py ../07/StackArithmetic/SimpleAdd/SimpleAdd.vm 
/Users/hl/nand2tetris/tools/CPUEmulator.sh ../07/StackArithmetic/SimpleAdd/SimpleAdd.tst 
python VMTranslator.py ../07/StackArithmetic/StackTest/StackTest.vm 
/Users/hl/nand2tetris/tools/CPUEmulator.sh ../07/StackArithmetic/StackTest/StackTest.tst 

python VMTranslator.py ../07/MemoryAccess/BasicTest/BasicTest.vm 
/Users/hl/nand2tetris/tools/CPUEmulator.sh ../07/MemoryAccess/BasicTest/BasicTest.tst 

python VMTranslator.py ../07/MemoryAccess/PointerTest/PointerTest.vm 
/Users/hl/nand2tetris/tools/CPUEmulator.sh ../07/MemoryAccess/PointerTest/PointerTest.tst 

python VMTranslator.py ../07/MemoryAccess/StaticTest/StaticTest.vm 
/Users/hl/nand2tetris/tools/CPUEmulator.sh ../07/MemoryAccess/StaticTest/StaticTest.tst 


python VMTranslator.py ProgramFlow/BasicLoop
/Users/hl/nand2tetris/tools/CPUEmulator.sh ProgramFlow/BasicLoop/BasicLoop.tst
python VMTranslator.py ProgramFlow/FibonacciSeries
/Users/hl/nand2tetris/tools/CPUEmulator.sh ProgramFlow/FibonacciSeries/FibonacciSeries.tst

python VMTranslator.py FunctionCalls/SimpleFunction
/Users/hl/nand2tetris/tools/CPUEmulator.sh FunctionCalls/SimpleFunction/SimpleFunction.tst

python VMTranslator.py FunctionCalls/FibonacciElement
/Users/hl/nand2tetris/tools/CPUEmulator.sh FunctionCalls/FibonacciElement/FibonacciElement.tst

python VMTranslator.py FunctionCalls/NestedCall
/Users/hl/nand2tetris/tools/CPUEmulator.sh FunctionCalls/NestedCall/NestedCall.tst

python VMTranslator.py FunctionCalls/StaticsTest
/Users/hl/nand2tetris/tools/CPUEmulator.sh FunctionCalls/StaticsTest/StaticsTest.tst
