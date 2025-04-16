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
inA=32'h45268871;#10;
eopA=1;
#10;
sopA=0;
eopA=0;
#10;

//A to B
sopA=1;
inA=32'h45268872;#10;
eopA=1; 
#10;
inA=32'hx;
sopA=0;
eopA=0;
#10;

//B to A
sopB=1;
inB=32'h79944471;#10;
eopB=1;
#10;
sopB=0;
eopB=0;
#10;

//B to B
sopB=1;
inB=32'h79944472;#10;
eopB=1;
#10;
inB=32'hx;
sopB=0;
eopB=0;
#10;

#50;
$stop;
end
endmodule
