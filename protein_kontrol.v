`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 19:21:31
// Design Name: 
// Module Name: protein_kontrol
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


module protein_kontrol(
input clk,
input [5:0] kodon1,
input [5:0] kodon2,
output reg [63:0] puan,
output reg [9:0] uzunluk,
output reg bitti_mi
    );
    wire cikis;
    kodon_kontrol u0 (clk,kodon1,kodon2,cikis);
    reg [9:0] uzunluk_next;
    reg [63:0] puan_next;
    reg bitti_mi_next;
    reg basla,basla_next; // baslangic kodonu geldi mi.
    initial begin
    uzunluk=0;
    uzunluk_next=0;
    puan =0;
    puan_next =0;
    bitti_mi_next =0;
    bitti_mi=0;
    basla=0;
    basla_next =0;
    end
    always@* begin
    uzunluk_next = uzunluk;
    puan_next = puan;
    bitti_mi_next = bitti_mi;
    basla_next = basla;
    if(kodon1==6'b000110)
        basla_next = 1'b1;
    if(uzunluk > 1000)
        bitti_mi_next = 1'b1;
    if(kodon1 == 6'b011000 || kodon1 == 6'b010000 || kodon1 == 6'b010010) // bitis kodonlarindan biri geldi mi.
        bitti_mi_next = 1'b1;
    if(basla && !bitti_mi)
    begin
        uzunluk_next = uzunluk + 1;
        puan_next = puan + cikis;
        basla_next = 1'b1; // baslangic kodonu geldikten sonra bitene kadar hep devam edebilsin diye.
    end
    if(bitti_mi)
    begin
        uzunluk_next =0;
        puan_next = 0;
        bitti_mi_next = 0; // bir sonrakinde yeniden baslayabilmesi icin.
        basla_next = 0; //bir sonrakide baslangic kodonu gelmeden basla girisinin 1 olmamasi gerek.
    end
    end
    always@(posedge clk)
    begin
    basla <= basla_next;
    bitti_mi <= bitti_mi_next;
    uzunluk <= uzunluk_next;
    puan <= puan_next;
    end
    
    
endmodule
