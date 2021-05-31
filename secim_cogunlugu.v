`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 18:46:09
// Design Name: 
// Module Name: secim_cogunlugu
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


module secim_cogunlugu(
input tasli_yol_uzunlugu1,
input tasli_yol_uzunlugu2,
input tasli_yol_uzunlugu3,
input [2:0] asfalt_yol_uzunlugu1,
input [2:0] asfalt_yol_uzunlugu2,
input [2:0] asfalt_yol_uzunlugu3,
output tercih_cogunlugu
    );
    wire birinci,ikinci,ucuncu;
    yol_secimi u0 (tasli_yol_uzunlugu1,asfalt_yol_uzunlugu1,birinci);
    yol_secimi u1 (tasli_yol_uzunlugu2,asfalt_yol_uzunlugu2,ikinci);
    yol_secimi u2 (tasli_yol_uzunlugu3,asfalt_yol_uzunlugu3,ucuncu);
    wire w1,w2,w3;
    and(w1,birinci,ikinci); //dogruluk tablosundan cikan degerlere gore.
    and(w2,ikinci,ucuncu);
    and(w3,birinci,ucuncu);
    or(tercih_cogunlugu,w1,w2,w3);
    
endmodule
