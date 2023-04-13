`timescale 1ns / 1ps

module testbench();
reg clk,rst,inp;
wire out,valid;

shiftregister uut(.out(out), .clk(clk), .rst(rst), .inp(inp), .valid(valid));

initial begin
    rst=1'b1;
    clk=1'b0;
    inp=1'b0;
    #15
    rst=1'b0; 
end
always 
#5 clk=~clk;
always
#10 inp=$random;

endmodule
