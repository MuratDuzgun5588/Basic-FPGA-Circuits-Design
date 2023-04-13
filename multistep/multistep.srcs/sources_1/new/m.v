`timescale 1ns / 1ps

module m(input wire en, clk, rst, output reg[8:0] out);
localparam Idle=2'b00, Op=2'b01, Done=2'b10;
reg[8:0] a,b,f;
reg[1:0] p_state,n_state;

always@(posedge rst, posedge clk)
    if(rst) begin p_state<=Idle; a=3'd0; b=3'd1; end
    else begin p_state<=n_state; out<=f; end
    
always@(p_state, en) begin

    case(p_state)
        Idle:if(en) n_state=Op;
             else n_state=Idle;
        Op:if(en)
               if((a+b)<512) begin
                    f=a+b;
                    a=b;
                    b=f;
               end
               else n_state=Done;
           else n_state=Op;
       Done:begin
            a=0; b=0;
            end
       default:n_state=Idle;
       endcase
     end

endmodule
