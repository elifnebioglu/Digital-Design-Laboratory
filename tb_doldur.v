`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2021 12:30:43
// Design Name: 
// Module Name: tb_doldur
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
module tb_doldur( );
reg clk=0;
reg [31:0]veri;
wire [63:0] depo;

doldur uut(.clk(clk),.veri(veri),.depo(depo));

always begin
clk = ~clk;
#10;
end

integer i;
reg [31:0] memory [13:0];
initial
begin
$readmemb("veriler.mem",memory);
#10;
for(i=0;i<14;i=i+1)
begin
veri= memory[i];
#10;
end
$display(depo);
end



endmodule
