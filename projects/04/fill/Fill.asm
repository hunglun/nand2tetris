// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    // Put your code here.
(LOOP)
    @SCREEN
    D=A
    @R2   // initialise screen pointer
    M=D    // screen pointer=SCREEN

    @24576 // listen to keyboard
    D=M
    @CLEAR
    D;JEQ  // clear screen if 0
    @PAINT
    0;JMP  // else paint screen

    (CLEAR)
    @R1   // pixel value variable
    M=0
    @FORLOOP
    0;JMP

    (PAINT)
    @R1   // pixel value variable
    M=-1
    @FORLOOP
    0;JMP

    (FORLOOP)
       @R2
       D=M    // D=screen pointer
       @24576
       D=D-A  // D=screen pointer-24576
       @LOOP  // go back to main loop!
       D;JEQ  // If (screen pointer=24576) goto END
       @R1  // this is the value to be assigned to target pixel
       D=M
       @R2
       A=M
       M=D  // set pixel to D
       @R2
       M=M+1  // screen pointer=screen pointer+1
    @FORLOOP
    0;JMP  // Goto LOOP
 
