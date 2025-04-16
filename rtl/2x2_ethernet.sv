//ethernet
module ethernet(
input logic [31:0]inA,
input logic [31:0]inB,
input logic clk,
input logic resetN,
output logic [31:0]outA,
output logic [31:0]outB,
input logic sopA,
input logic eopA,
input logic sopB,
input logic eopB,
output logic portAStall,
output logic portBStall
);

logic [3:0]DA_A, DA_B;
logic [31:0]dsoutA, dsoutB; //output of switch & input for out fifo
logic [31:0]dsinA, dsinB; //input for switch & output of in fifo
logic wr_en_inA, wr_en_inB, wr_en_outA, wr_en_outB;
logic rd_en_inA, rd_en_inB, rd_en_outA, rd_en_outB;
logic full_inA, full_inB, empty_in_fifoA, empty_in_fifoB, empty_out_fifoA, empty_out_fifoB;

always_ff @ (negedge resetN)
if (~resetN)
begin
portAStall<=0;
portBStall<=0;
end
else
begin
if (full_inA)
portAStall<=1;
if (full_inB)
portBStall<=1;
end

/*
initial begin
$monitor("%t | inA = %h | dsinA = %h | dsoutA = %h | inB = %h | dsinB = %h | dsoutB = %h | outA=%h | outB=%h",$time,inA,dsinA,dsoutA,inB,dsinB,dsoutB,outA,outB);
end
*/ 

fifo INportA (
.din(inA),
.clk(clk),
.resetN(resetN),
.wr_en(wr_en_inA),
.rd_en(rd_en_inA),
.full(full_inA),
.empty(empty_in_fifoA),
.dout(dsinA)
);

fifo INportB (
.din(inB),
.clk(clk),
.resetN(resetN),
.wr_en(wr_en_inB),
.rd_en(rd_en_inB),
.full(full_inB),
.empty(empty_in_fifoB),
.dout(dsinB)
);

fifo OUTPortA (
.din(dsoutA),
.clk(clk),
.resetN(resetN),
.wr_en(wr_en_outA),
.rd_en(rd_en_outA),
.empty(empty_out_fifoA),
.dout(outA)
);

fifo OUTPortB (
.din(dsoutB),
.clk(clk),
.resetN(resetN),
.wr_en(wr_en_outB),
.rd_en(rd_en_outB),
.empty(empty_out_fifoB),
.dout(outB)
);

switch_2x2 s1(
.dinA(dsinA),
.dinB(dsinB),
.DA_A(DA_A),
.DA_B(DA_B),
.clk(clk),
.resetN(resetN),
.doutA(dsoutA),
.doutB(dsoutB)
);

always_comb
begin

DA_A=dsinA[3:0];
DA_B=dsinB[3:0];

wr_en_inA=(sopA && !eopA && !full_inA) ? 1:0;
wr_en_inB=(sopB && !eopB && !full_inB) ? 1:0;
wr_en_outA=(DA_A==1 || DA_B==1) ? 1:0;
wr_en_outB=(DA_A==1 || DA_B==2) ? 1:0;
rd_en_inA=(!empty_in_fifoA) ? 1:0;
rd_en_inB=(!empty_in_fifoB) ? 1:0;
rd_en_outA=(!empty_out_fifoA) ? 1:0;
rd_en_outB=(!empty_out_fifoB) ? 1:0;

end

endmodule
