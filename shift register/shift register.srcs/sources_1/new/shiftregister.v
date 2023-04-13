`timescale 1ns / 1ps


module shiftregister(input wire clk,rst,inp, output reg out, output valid);
reg[7:0]p_state, n_state, cnt;
always@(posedge rst, posedge clk)
    if(rst) begin
        p_state<=8'b00000000; cnt=0;
        end
    else begin
        p_state<=n_state; cnt=cnt+8'd1;
        end
always@(p_state,inp) begin
    n_state={ p_state[6:0], inp };
    if(p_state==8'b01000000)
         out=1;
    else out=0;
    end
assign valid= cnt>=8'd8;
endmodule
