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

// 塗りつぶし終えるまでキーボード入力を受け付けない仕様にした
// CPUEmulatorのAnimateをNo Animationにして動かすと動作確認できる

// SCREENENDという変数を作ってスクリーン範囲の最後のアドレスを代入
    @24575          // スクリーン範囲の最後のアドレス
    D=A
    @SCREENEND
    M=D
// CNTというカウンタ変数を作ってスクリーン範囲の最初のアドレスを代入
    @SCREEN
    D=A
    @CNT
    M=D

(LOOP)
// キーボード入力値の確認
    @KBD
    D=M
    @WHITE
    D;JEQ
(BLACK)
    // すでに塗りつぶし終えていたら（SCREENEND - CNT < 0）
    // キーボード入力を受け付ける
    @SCREENEND
    D=M
    @CNT
    D=D-M       
    @LOOP
    D;JLT

    // CNTに1を加算する
    @CNT
    M=M+1
    // 黒で塗りつぶす
    @CNT
    A=M
    M=-1

    @BLACK
    0;JMP
(WHITE)
    // すでに塗りつぶし終えていたら（CNT - SCREEN < 0）
    // キーボード入力を受け付ける
    @CNT
    D=M
    @SCREEN
    D=D-A       
    @LOOP
    D;JLT

    // CNTに1を減算する
    @CNT
    M=M-1
    // 白で塗りつぶす
    @CNT
    A=M
    M=0

    @WHITE
    0;JMP