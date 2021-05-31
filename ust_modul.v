`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2021 11:49:27
// Design Name: 
// Module Name: alici_verici
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
module ust_modul(
input clk,//: 1-bitlik saat giriþi
input rx,//: 1-bitlik dýþarýdan alýnan deðer giriþi
output reg  tx//: 1-bitlik dýþarýya verilecek deðer çýkýþý
    );
reg [3:0] cevrim,cevrim_next;
wire [5:0] sayilar;
reg [2:0] giden_sayi;
reg tx_next;
reg rx_en;
reg rx_en_next;
reg tx_en;
reg tx_en_next;
reg en;
reg en_next;
initial 
begin
cevrim=0;
cevrim_next=0;
tx=0;
tx_next=0;
rx_en=0;
rx_en_next=0;
tx_en=0;
tx_en_next=0;
en=0;
en_next=0;
end
carpici i1 (clk,en_next,sayilar[5:3],sayilar[2:0],giden_sayi);
alici_verici i0 (clk,rx,rx_en_next,tx_en_next,giden_sayi,tx,sayilar[alici_verici.count-1:alici_verici.count-3]);//zaten 3 cevrimde bir sonuc verdigi icin diger moduldeki 
//count degeriyle [5:3] ve [2:0]'i saglamaya calistim.ama senkronize oldugundan emin olamadim.
//tx_en ve rx_en'e asagidaki sekilde dogru zamanda 1 verdigimizde modulu bir kere cagirmak yeterli diye dusundum.
always@*
begin
cevrim_next=cevrim+1;
tx_next=tx;
rx_en_next=rx_en;
tx_en_next=tx_en;
en_next=en;
if(cevrim_next==4'b0000)//en basta rx_en 1
rx_en_next=1;
if(cevrim_next==4'b0110)//6. cevrimde  
rx_en_next=0;
if(cevrim_next==4'b0111)//carpiciya gonderilebilir artik.
en_next=1;
if(cevrim_next==4'b1000)//sonuc disariya gonderilebilir.
tx_en_next=1;
if(cevrim_next==4'b1010)//10. adimdan sonra disariya sayi gonderme duruyor.
tx_en_next=0;
if(cevrim_next==4'b1011)//11. cevrimde en bastan basliyor.
begin
cevrim=0;
cevrim_next=0;
tx=0;
tx_next=0;
rx_en=0;
rx_en_next=0;
tx_en=0;
tx_en_next=0;
en=0;
en_next=0;
end
end
always@(posedge clk)
begin
cevrim<= cevrim_next;
rx_en<= rx_en_next;
tx_en<= tx_en_next;
en<=en_next;
end

    
endmodule
