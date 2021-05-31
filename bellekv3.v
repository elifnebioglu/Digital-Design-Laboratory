`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2021 18:21:57
// Design Name: 
// Module Name: bellekv3
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


module bellekv3(
   output reg[31:0] q,
   input [31:0] d,
   input [7:0] a,
   input we, 
   input clk,
   input ke);
   reg [31:0] mem [255:0];
   always@(posedge clk)
   begin
   if(ke)
   begin
        mem[255]=d;
   end
   else
   begin
   if(we)
   begin
        mem[a]=d^mem[255];
   end
   else
   begin
        q=mem[a]^mem[255];
   end
   
   end
   end
   
endmodule
