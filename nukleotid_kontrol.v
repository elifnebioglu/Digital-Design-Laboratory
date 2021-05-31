`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 18:54:54
// Design Name: 
// Module Name: nukleotid_kontrol
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


module nukleotid_kontrol(
input clk,
input [1:0] nukleotid1,
input [1:0] nukleotid2,
output reg cikis
    );
    always@(posedge clk)
    begin
    if(nukleotid1==nukleotid2)
        cikis = 1'b1;
    else
        cikis = 1'b0;
    end
    
    
endmodule
