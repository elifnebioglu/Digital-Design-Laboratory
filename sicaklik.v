`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2021 12:23:50
// Design Name: 
// Module Name: sicaklik
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


module sicaklik(
input [2:0] sicaklik,
input [2:0] sinir,
output reg alarm
    );
always@*
begin
    if(sicaklik>=sinir)
    begin
        alarm =1'b1;
    end
    else if(sinir>sicaklik)
    begin
        alarm=1'b0;
    end
end
endmodule
