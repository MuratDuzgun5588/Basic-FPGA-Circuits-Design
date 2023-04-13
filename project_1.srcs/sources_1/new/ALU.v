`timescale 1ns / 1ps

module ALU(input wire[7:0] A,B,
            input wire[2:0] sel,
            output reg[7:0] C,
            output reg[3:0] flag);
reg[15:0] D;
always@(A,B,sel) begin
    flag=4'b0000;
    C=8'b00000000;
    case(sel)
        3'b000:C=A+B;
        3'b001:C=A-B;
        3'b010:begin
                D=A*B;
                C=D[7:0];
                end
        3'b011:C=A/B;
        3'b100:C=A&B;
        3'b101:C=A|B;
        3'b110:C=A^B;
        3'b111:C=~(A^B);
    endcase
     
     if((sel==3'b000)&&(A>8'b10000000)&&(B>8'b10000000)) //carry
           flag[1]=1;
     if((sel==3'b010)&&(D[8]==1))
           flag[1]=1;
     if(C==0) //zero
        flag[0]=1;
     if(C[7]==1)//negatif
        flag[3]=1;
     if((A[7]==1)&&(B[7]==1)&&(C[7]==0))//overflow
            flag[2]=1;
     if((A[7]==0)&&(B[7]==0)&&(C[7]==1))
            flag[2]=1;    
 end       
endmodule
