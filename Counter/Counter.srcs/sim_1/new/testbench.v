`timescale 1ns / 1ps

module testbench();
reg clk, rst, en;
wire y;

counter uut(.clk(clk), .rst(rst), .en(en), .y(y));

initial begin
    rst=1'b1;
    en=1'b0;
    clk=1'b0;
    #15
    rst=1'b0;
end

always
#5 clk=~clk;

always
#10 en=$random;
endmodule
