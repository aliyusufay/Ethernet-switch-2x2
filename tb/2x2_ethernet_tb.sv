//TB
module ethernet_tb();
logic [31:0]inA, inB, outA, outB;
logic clk, resetN;
logic sopA, sopB, eopA, eopB;
logic portAStall, portBStall;

ethernet dut(
.inA(inA),
.inB(inB),
.clk(clk),
.resetN(resetN),
.outA(outA),
.outB(outB),
.sopA(sopA),
.eopA(eopA),
.sopB(sopB),
.eopB(eopB),
.portAStall(portAStall),
.portBStall(portBStall)
);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
$display("INPortA  | INPortB  | OUTPortA | OUTPortB | PortAStall | PortBStall");
$monitor("%h | %h | %h | %h |     %b      |     %b   ",inA,inB,outA,outB,portAStall,portBStall);
resetN=1;#10;
sopA<=0;
eopA<=0;
sopB<=0;
eopB<=0;
resetN=0;#10;
resetN=1;#10;
//A to A
sopA=1;
inA=32'hFEDBEEF1;
//B to B
sopB=1;
inB=32'hDEC0_DED2;
#10;
eopA=1;
sopA=0;
eopB=1;
sopB=0;
#10;
eopA=0;
eopB=0;
//A to B
sopA=1;
inA=32'hFEDBEEF2;
//B to A
sopB=1;
inB=32'hDEC0_DED1;
#10;
eopA=1; 
sopA=0;
eopB=1;
sopB=0;
#10;
eopA=0;
eopB=0;
inA='bx;
inB='bx;
#30;
$finish;
end
endmodule
