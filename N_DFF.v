module N_DFF(
  input [4-1:0]key,
  input [3-1:0]M,
  output reg [2-1:0]N
);

  always @ (M or key) begin
    if( M == 001 )
      N <= key;
    else
      N <= N;
  end

endmodule
