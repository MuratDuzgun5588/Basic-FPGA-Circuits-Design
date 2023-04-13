`timescale 1ns / 1ps

module counter(input wire clk, rst, en, output reg y);

reg[3:0] p_state, n_state;
always @(posedge clk, posedge rst)
    if(rst) p_state<=4'b0000;
    else p_state<=n_state;

always@(p_state, en) begin
    if(en) n_state=p_state+1;
    else n_state=p_state;
    assign y = ((p_state==4'b1111)&& (en==1'b1));
 end
endmodule
