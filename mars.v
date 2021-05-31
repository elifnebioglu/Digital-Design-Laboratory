`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2021 14:34:45
// Design Name: 
// Module Name: mars
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


module mars(
input Kasif,Korkusuz,Hayalperest,Merakli,Aktif,
output C0,C1,C2
    );
    wire w1,w2,w3,w4,w5,w6;
    wire nA,nB,nC,nD,nAktif;
    not(nA,Kasif);
    not(nB,Korkusuz);
    not(nC,Hayalperest);
    not(nD,Merakli);
    not(nAktif,Aktif);
    and(w1,nA,nB,nC,nD);
    or(C0,Aktif,w1);
    and(w2,Hayalperest,nD);
    or(w3,Merakli,w2);
    and(C1,nAktif,w3);
    and(w4,Korkusuz,Hayalperest,nD);
    and(w5,Korkusuz,nC,nD);
    or(w6,Merakli,w4,w5);
    and(C2,nAktif,w6);
    
endmodule
