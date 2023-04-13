`timescale 1ns / 1ps

module tempe(input wire[5:0] temp, input wire clk, rst, output reg[10:0] out, output reg valid);
reg[10:0] p_state,n_state,cnt_p,cnt_n;


always@(posedge clk, posedge rst)
    if(rst) begin p_state<=11'b00000000000; cnt_p<=11'b00000000000; end
    else begin p_state<=n_state; cnt_p<=cnt_n; end

always@(p_state, cnt_p, temp) begin
    n_state=p_state+temp;
    cnt_n=cnt_p+1;
    out=p_state/cnt_p;
    if(cnt_p>=11'd20)
        valid=1;
    else valid=11'd0;
    
end
    
            
endmodule
