// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
    @R2
    M=0        // R2を0に初期化
    @R1
    D=M        // R1の値をDに代入
    @END
    D;JLE      // R1 <= 0のときENDにジャンプして終了
(LOOP)
    @R0
    D=M        // R0の値をDに代入
    @R2
    M=D+M      // R0の値をR2に加算
    @R1
    M=M-1      // R1からを1を減算
    D=M
    @LOOP
    D;JGT
(END)