`timescale 1ns / 1ps



module opertaor(input wire en, clk, rst, output reg[3:0] out);
reg[1:0] p_state,n_state;
reg[3:0] a,b,f;
localparam IDLE=2'b00, OP=2'b01, DONE=2'b10;

always@(posedge clk, posedge rst)
    if(rst) begin p_state<=0; a=0; b=1; end
    else begin p_state<=n_state; out<=f; end

always@(p_state,en,a,b) begin
    case(p_state)
        IDLE:begin
              if(en) n_state=OP;
              else n_state=IDLE;
             end
        OP:begin
            if(en) begin
              if((a+b)<16) begin
                    f=a+b;
                    a=b;
                    b=f;
               end
             else n_state=DONE;
            end
          else n_state=OP;
          end
       DONE: begin
             a=0;
             b=0;
             end
       default:f=0;
    endcase
 end                   
    
endmodule
