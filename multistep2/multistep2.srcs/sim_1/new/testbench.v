`timescale 1ns / 1ps

module testbench();
reg en,clk,rst;
wire[15:0] f;

multistep uut(.en(en), .clk(clk), .rst(rst), .f(f));

initial begin
    rst=1;
    clk=0;
    en=0;
    #15
    rst=0;
end
always
#5 clk=~clk;

always
#10 en=$random;
endmodule
