`timescale 1ns / 1ps

module testbench();
reg[5:0] temp;
reg clk;
wire[11:0] avg;

circuit uut(.avg(avg), .temp(temp), .clk(clk));

initial begin
    clk=1;
    temp=6'd10;
    #70
    temp=6'd30;
    #70
    temp=6'd40;
end

always
#10 clk=~clk;
endmodule
