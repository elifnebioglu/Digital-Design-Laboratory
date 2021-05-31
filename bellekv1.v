`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2021 17:00:35
// Design Name: 
// Module Name: bellekv1
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
module bellekv1(
   output reg[31:0] q,
   input [31:0] d,
   input [7:0] a,
   input we, 
   input clk);
   reg [31:0] mem [255:0];
   integer i;
   initial begin
    for(i=0;i<256;i=i+1)
    begin
        mem[i]=32'b0;
       // mem_next[i]=32'b0;
    end
   end
   always @(posedge clk)
   begin
   if(we)
   begin
        mem[a]=d;
   end
   else
   begin
        q=mem[a];
   end
   end
   
endmodule
