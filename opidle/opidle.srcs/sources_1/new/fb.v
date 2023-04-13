`timescale 1ns / 1ps
`timescale 1ns / 1ps

module fb #(parameter WIDTH = 4)(
input rst,
input clk,
input en,
output reg [WIDTH-1:0] f
);


localparam [1:0] idle = 2'b00, op = 2'b01, done = 2'b10;
reg [1:0] pstate, nstate;
reg [WIDTH-1:0] a, d, f2;

always @ (posedge clk) begin
    if(rst) begin pstate<=0; a=0; d=1; end
    else begin pstate<=nstate; f <= f2; end
end

always @ (*) begin
    case(pstate)
    idle:
        if (en) nstate = op;
        else nstate = idle;
     op: begin
        if(en) begin
            if ( (a+d) < 2**WIDTH) begin
            f2 = a + d;
            a = d;
            d = f2;
            end
            else nstate = done;
        end
        else nstate=op;
        end
    // done: begin
    // a = 0;
    // d = 0;
    // end
    endcase
end
endmodule