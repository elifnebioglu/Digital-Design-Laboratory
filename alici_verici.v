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


module alici_verici(
input clk,
input rx,
input rx_en,
input tx_en,
input [2:0] giden_sayi,// tx ile aktarýlacak 3-bitlik sayý giriþi.
output reg tx,//: 1-bitlik dýþarýya verilecek deðer çýkýþý
output reg [2:0]gelen_sayi//: rx toplamda 3 çevrimde alýnan bitleri 3-bit deðer olarak verecek çýkýþ
    );
reg rx_next,tx_next;
reg [1:0] cevrim,cevrim_next;
reg [1:0] count,count_next;//ustmodul icin yazdim.
reg [2:0] gelen_sayi_next;

initial begin
rx_next =0;
tx_next=0;
cevrim=0;
count=0;
count_next=0;
cevrim_next=0;
gelen_sayi_next=0;
end
always@*
begin
rx_next=rx;
tx_next=tx;
cevrim_next=cevrim+1;
count_next=count+1;
gelen_sayi_next=gelen_sayi;
if(rx_en==1'b1 && tx_en ==1'b0)
begin
    if(cevrim_next==2'b00)
    begin
        gelen_sayi_next[0]=rx_next;
    end
    else if(cevrim_next==2'b01)
    begin
        gelen_sayi_next[1]=rx_next;
    end
    else if(cevrim_next==2'b10)
    begin
        gelen_sayi_next[2]=rx_next;
        cevrim=0; //tekrar sayi alinabilir veya disari verilebilir.
        cevrim_next=0;
    end
end
if(rx_en==1'b0 && tx_en ==1'b1)
begin
    if(cevrim_next==2'b00)
    begin
        tx_next=giden_sayi[0];
    end
    else if(cevrim_next==2'b01)
    begin
        tx_next=giden_sayi[1];
    end
    else if(cevrim_next==2'b10)
    begin
        tx_next=giden_sayi[2];
        cevrim=0; //tekrar sayi alinabilir veya disari verilebilir.
        cevrim_next=0;
    end
end
end
always@(posedge clk)
begin
gelen_sayi<= gelen_sayi_next;
tx<=tx_next;
cevrim<=cevrim_next;
count<=count_next;
end
endmodule
