`timescale 1ns / 1ps

module testbench();
reg in,clk,rst;
wire out, valid;

shiftregister uut(.in(in), .clk(clk), .rst(rst), .out(out), .valid(valid));

initial begin
    rst=1;
    in=0;
    clk=0;
    #15
    rst=0;
end

always
#5 clk=!clk;

always
#10 in=$random;
endmodule
