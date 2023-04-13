`timescale 1ns / 1ps
module tetsbench();
wire[3:0] f;
reg en, clk, rst;

fb uut(.f(f), .en(en), .clk(clk), .rst(rst));

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
