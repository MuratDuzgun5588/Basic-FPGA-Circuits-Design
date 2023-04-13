`timescale 1ns / 1ps

module shiftregister(input wire in,clk,rst, output reg out, output valid);
reg[8:0] p_state, n_state;
reg[8:0]cnt;

always@(posedge clk, posedge rst)
    if(rst) begin p_state<=9'b000000000; cnt<=9'b000000000; end
    else begin p_state<=n_state; cnt<=cnt+9'd1; end

always@(p_state,in) begin
    n_state={p_state[10:0], in};
    if(p_state==9'b101100101)
        out=1;
    else out=0;
end

assign valid= cnt>9'd9 ;
endmodule
