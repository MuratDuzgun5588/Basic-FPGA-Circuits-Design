`timescale 1ns / 1ps

module testbench();
reg x,clk,rst;
wire out;

detector uut(.x(x), .clk(clk), .rst(rst), .out(out));

initial begin
    rst=1;
    x=0;
    clk=0;
    #15
    rst=0;
 end
 
 always
 #5 clk=~clk;
 
 always
 #10 x=$random;
endmodule
