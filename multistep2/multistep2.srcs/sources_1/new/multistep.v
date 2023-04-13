`timescale 1ns / 1ps

module multistep(input wire en, clk, rst, output reg [15:0] f);
localparam IDLE=2'b00, OP=2'b01, DONE=2'b10;
reg[15:0]f2,a,b;
reg[1:0] p_state, n_state;

always@(posedge clk, posedge rst)
    if(rst)begin p_state<=IDLE; f2<=15'd0; end
    else begin p_state<=n_state; f<=f2; end
always@(p_state,en)
    case(p_state)
        IDLE:begin
             a=0;
             b=1;
             if(en)n_state=OP;
             else n_state=IDLE;
             end
         OP:begin
            if(en)
                if(a+b<=15'b111111111111) begin
                    f2=a+b;
                    a=b;
                    b=f2;
                end
                else n_state=DONE;
            else n_state=OP;
            end
       DONE:f2=f2;
       endcase
endmodule
