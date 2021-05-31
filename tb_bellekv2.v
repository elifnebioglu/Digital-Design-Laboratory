`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2021 21:55:24
// Design Name: 
// Module Name: tb_bellekv2
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


module tb_bellekv2(

    );
 reg clk=0;  
 //reg [31:0] tb_memory [0:255];//You can use this for 2. question
 reg tb_we=0; //write enable 1:write 0:read
 reg [7:0] address=0; // number of target memory row
 reg [31:0] write_in=0; //write data input
 wire [31:0] read_out; // read data output
 integer i=0;
 bellekv1 uut(read_out,
  write_in,address,
   tb_we, clk);
   
   always begin
   clk=~clk;
   #5;
   end
   reg [31:0] bellek [255:0];
   initial begin
   #10;
   $readmemb("ornek_bellek.mem", bellek);
   tb_we=1; //write mode on
   address=8'h0F; 
   write_in=32'hABCDEF00; 
   #10;
   tb_we=1;//write mode on
   address=8'h00;
   write_in=32'hFBE0015A;
   #10;   
   tb_we=0;//write mode off
   address=8'h0F;
   #10;
   if(read_out!=32'hABCDEF00) 
        $display("Basarisiz: %d. bellek satirindaki deger %d'dir.",address,read_out);
   else
        $display("Basarili: %d. bellek satirindaki deger %h'dir.",address,read_out);
   
   end
  
   always@(posedge clk)
   begin
        bellekv1.mem[i]=bellek[i];
        i=i+1;
   end
endmodule
