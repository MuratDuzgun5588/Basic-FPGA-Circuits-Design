`timescale 1ns / 1ps

module circuit(input wire[5:0] temp, input wire clk, output reg[11:0] avg);
reg[5:0] temp_1, temp_2, temp_3, temp_4;
reg[11:0]avg1;


always@(posedge clk) begin
//    if(rst==0) begin
        temp_1<=temp;
        temp_2<=temp_1;
        temp_3<=temp_2;
        temp_4<=temp_3;
        avg1=temp_1+temp_2+temp_3+temp_4;
        avg=avg1/4;
//    end
//    else temp<=0;
end

//always@(temp_4)
//    if(temp_4!=6'b000000)begin
//        avg1=temp_1+temp_2+temp_3+temp_4;
//        avg=avg1/4;
//    end
        
endmodule
