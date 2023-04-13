`timescale 1ns / 1ps

module detector(input wire x,clk,rst, output reg out);
localparam start=4'b0000,
           got1=4'b0001,
           got10=4'b0010,
           got101=4'b0011,
           got1011=4'b0100,
           got10110=4'b0101,
           got101100=4'b0110,
           got1011001=4'b0111,
           got10110010=4'b1000,
           finish=4'b1001;
reg[3:0] p_state, n_state;

always@(posedge rst, posedge clk)
    if(rst) p_state<=4'b0000;
    else p_state<=n_state;
    
always@(p_state,x) begin
    out=0;
    case(p_state)
        start:if(x) n_state=got1;
              else n_state=start;
        got1:if(~x) n_state=got10;
              else n_state=got1;
        got10:if(x) n_state=got101;
              else n_state=start;
        got101:if(x) n_state=got1011;
              else n_state=got10;
        got1011:if(~x) n_state=got10110;
              else n_state=got1;
        got10110:if(~x) n_state=got101100;
              else n_state=got101;
        got101100:if(x) n_state=got1011001;
              else n_state=start;
        got1011001:if(~x) n_state=got10110010;
              else n_state=got1;
        got10110010:if(x) n_state=finish;
              else n_state=start;
        start:begin
              out=1;
              if(x) n_state=got1011;
              else n_state=got10;
              end
        default:n_state=start;
    endcase
  end

endmodule
