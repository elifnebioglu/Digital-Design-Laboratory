`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2021 14:28:03
// Design Name: 
// Module Name: odev1_soru2
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


module odev1_soru2(
    input A,B,C,D,
    output Q
    );
    wire w1,w2;
    and(w1,A,B);
    and(w2,B,C,D);
    or(Q,w1,w2);
endmodule
