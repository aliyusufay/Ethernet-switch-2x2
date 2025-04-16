//2x2 32 bit Switching logic
module switch_2x2(
input logic [31:0]dinA,
input logic [31:0]dinB,
input logic [3:0]DA_A,
input logic [3:0]DA_B,
input logic clk,
input logic resetN,
output logic [31:0]doutA,
output logic [31:0]doutB
);


always_ff @ (posedge clk or negedge resetN)
begin
if (~resetN)
begin
doutA<=32'b0;
doutB<=32'b0;
end
else
begin
if (DA_A==4'b0001)
doutA<=dinA;
if (DA_A==4'b0010)
doutB<=dinA;
if (DA_B==4'b0001)
doutA<=dinB;
if (DA_B==4'b0010)
doutB<=dinB;
end
end
endmodule
