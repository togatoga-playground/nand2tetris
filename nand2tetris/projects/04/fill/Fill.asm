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

(INIT)
  //init addr
  @SCREEN
  D=A
  @addr
  M=D

  @KBD
  D=M
  @BLACK
  D;JGT
  @WHITE
  D;JEQ

  @PAINT
  0;JMP

(BLACK)
  @color
  M=-1

  @PAINT
  0;JMP

(WHITE)
  @color
  M=0

  @PAINT
  0;JMP

(CHECKBLACK)
  @KBD
  D=M
  @INIT
  D;JEQ

  @addr
  M=M+1

  @8192
  D=A
  @SCREEN
  D=D+A
  @addr
  D=D-M

  @PAINT
  D;JGT

  @INIT
  0;JMP

(CHECKWHITE)
  @KBD
  D=M
  @INIT
  D;JGT

  @addr
  M=M+1

  @8192
  D=A
  @SCREEN
  D=D+A
  @addr
  D=D-M

  @PAINT
  D;JGT

  @INIT
  0;JMP

(PAINT)
  //fill
  @color
  D=M
  @addr
  A=M
  M=D

  //check continuous color
  @color
  D=M
  @CHECKBLACK
  D;JLT
  @CHECKWHITE
  D;JEQ
