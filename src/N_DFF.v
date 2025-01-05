module N_DFF(
    input clk,
    input [4-1:0] key,
    input [3-1:0] M,
    output reg [3-1:0] N
);

  always @ (posedge clk) begin
    if(M == 001)
      N <= key;
    else
      N <= N;
  end

endmodule
