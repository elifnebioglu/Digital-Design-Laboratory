`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 18:58:23
// Design Name: 
// Module Name: kodon_kontrol
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


module kodon_kontrol(
input clk,
input [5:0] kodon1,
input [5:0] kodon2,
output reg [1:0] skor
    );
    wire  cikis1,cikis2,cikis3;
    nukleotid_kontrol u0 (clk,kodon1[5:4],kodon2[5:4],cikis1);
    nukleotid_kontrol u1 (clk,kodon1[3:2],kodon2[3:2],cikis2);
    nukleotid_kontrol u2 (clk,kodon1[1:0],kodon2[1:0],cikis3);
    always@(posedge clk) //Tüm karþýlaþtýrma iþleminin saatin bir yükselen kenarda yapýlmasý gerektiðine dikkat ediniz. yazdigi icin butun karsilatirme isemini ayni yukselen kenarda yapmaya calistim.
    begin
    if(cikis1==1'b0&&cikis2==1'b0&&cikis3==1'b0)
     skor = 2'b00;
    else if (cikis1==1'b1&&cikis2==1'b1&&cikis3==1'b1) //toplama islemini kapi duzeyinde yapmamak icin boyle yaptim.
     skor = 2'b11;
     else if (cikis1==1'b0&&cikis2==1'b0&&cikis3==1'b1)
     skor = 2'b01;
     else if (cikis1==1'b0&&cikis2==1'b1&&cikis3==1'b0)
     skor = 2'b01;
     else if (cikis1==1'b1&&cikis2==1'b0&&cikis3==1'b0)
     skor = 2'b01;
     else
     skor = 2'b10;
    end
endmodule
