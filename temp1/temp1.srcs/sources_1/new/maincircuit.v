`timescale 1ns / 1ps

module maincircuit(input wire[5:0] temp, input wire clk, output reg [11:0]avg);

wire[5:0] temp_1, temp_2, temp_3, temp_4;
reg[11:0] avg1;

circuit qqt1(.clk(clk), .k(temp), .t(temp_1));
circuit qqt2(.clk(clk), .k(temp_1), .t(temp_2));
circuit qqt3(.clk(clk), .k(temp_2), .t(temp_3));
circuit qqt4(.clk(clk), .k(temp_3), .t(temp_4));

always@(temp_4)
    if(temp_4!=0) begin
        avg1=temp_1+temp_2+temp_3+temp_4;
        avg=avg1/4;
    end
    else avg=0;

endmodule
