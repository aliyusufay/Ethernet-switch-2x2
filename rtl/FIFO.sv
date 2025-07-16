//FIFO_32x4_bit_x_word
module fifo(
input logic [31:0]din,
input logic clk,
input logic resetN,
input logic wr_en,
input logic rd_en,
output logic full,
output logic empty,
output logic [31:0]dout
);


//fifo storage
logic [31:0] mem [3:0]; // 32bit x 4elements memory array
logic [1:0] wr_ptr; //write pointer
logic [1:0] rd_ptr; // read pointer
logic [2:0] count; // no of elements in fifo
assign full=(count==4);
assign empty=(count==0);
//fifo operation
  always_ff @(posedge clk or negedge resetN)
begin


if (~resetN)
begin
wr_ptr<=0;
rd_ptr<=0;
count<=0;
end

else
begin

//write
if(wr_en && !full)
begin
mem[wr_ptr] <= din;
wr_ptr<=wr_ptr+1;
count<=count+1;
end

if(rd_en && !empty)
begin
dout <= mem[rd_ptr];
rd_ptr <= rd_ptr + 1;
count<=count-1;
end

if (wr_en && full)
$display("FIFO is full");

if (rd_en && empty)
$display("FIFO is empty");

if (count == 0) dout <= 32'bx;

end

end

endmodule
