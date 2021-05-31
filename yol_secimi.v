`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 18:42:31
// Design Name: 
// Module Name: yol_secimi
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


module yol_secimi(
input tasli_yol_uzunlugu,
input [2:0] asfalt_yol_uzunlugu,
output tercih
    );
    wire nA2;
    not(nA2,asfalt_yol_uzunlugu[2]);
    and(tercih,tasli_yol_uzunlugu,nA2);
endmodule
