`timescale 1ns / 1ps

module circuit(input wire[5:0] k, input wire clk, output reg[5:0] t);

always@(posedge clk)
    t<=k;
endmodule
