`timescale 1ns / 1ps

module testbench();

wire[8:0] out;
reg en,rst,clk;

m uut(.out(out), .en(en), .rst(rst), .clk(clk));

initial begin
    rst=1;
    en=0;
    clk=0;
    #15
    rst=0;
end

always
#5 clk=~clk;

always  
#10 en=$random;
endmodule
