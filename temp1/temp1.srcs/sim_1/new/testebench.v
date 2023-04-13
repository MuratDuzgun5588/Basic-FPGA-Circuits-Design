`timescale 1ns / 1ps

module testebench();

reg clk;
reg[5:0] temp;
wire[11:0] avg;

maincircuit uut(.clk(clk), .temp(temp), .avg(avg));

initial begin
    temp=6'd10;
    #20;
    temp=6'd15;
end
always
#10 clk=!clk;
  
endmodule
