`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2021 12:05:49
// Design Name: 
// Module Name: carpici
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

module carpici(
input clk,
input en,
input [2:0] sayi1,
input [2:0] sayi2,
output reg [2:0] sonuc
    );
reg [5:0] carpim;
always@(posedge clk)
begin
if(en)
begin
carpim=sayi1*sayi2;
sonuc=carpim[2:0];
end
else
begin
sonuc=3'b0;
end
end
endmodule
