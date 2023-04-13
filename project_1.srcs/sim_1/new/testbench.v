`timescale 1ns / 1ps


module testbench();
reg[7:0] A,B;
reg[2:0] sel;
wire[7:0] C;
wire[3:0] flag;
integer i,k,l;

ALU uut(.A(A), .B(B), .flag(flag), .sel(sel), .C(C));

initial begin
   for(i=0;i<8;i=i+1)
      for(k=0;k<256;k=k+1)
        for(l=0;l<256;l=l+1) begin
            sel=i; A=k; B=l;
            #10;
            end
    
            
    
    
end
endmodule
