`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2021 14:20:10
// Design Name: 
// Module Name: kapilar
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module kapilar(
    input A,B,C,D,E,F,G,H,I,J,K,L,M,N,
    output O
    );
    wire w1,w2,w3,w4,w5,w6,w7,w8;
    wire a1,a2;
    nand(w1,A,B);
    not(w2,C);
    or(w3,D,E);
    and(w4,F,G);
    buf(w5,H);
    nor(w6,I,J);
    xor(w7,K,L);
    xnor(w8,M,N);
    or(a1,w1,w2,w3,w4);
    nor(a2,w5,w6,w7,w8);
    and(O,a1,a2);
    
endmodule
