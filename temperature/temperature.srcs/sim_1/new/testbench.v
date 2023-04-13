`timescale 1ns / 1ps

module testbench();
reg[5:0] temp;
reg clk,rst;
wire[10:0] out;
wire valid;

tempe uut(.temp(temp), .clk(clk), .rst(rst), .out(out), .valid(valid));

initial begin
    rst=1;
    temp=6'd0;
    clk=0;
    #15;
    rst=0;
    temp=6'd10;
    #200;
    temp=6'd30;
end
always
#5 clk=~clk;
    
endmodule
