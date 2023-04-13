`timescale 1ns / 1ps

module testbench();
reg en,clk,rst;
wire[3:0] out;

opertaor uut(.out(out), .en(en), .rst(rst), .clk(clk));

initial begin
    rst=1'b1;
    clk=1'b0;
    en=1'b0;
    #15
    rst=1'b0;
   
end

always
#5 clk=~clk;

always
#10 en=$random;
endmodule
