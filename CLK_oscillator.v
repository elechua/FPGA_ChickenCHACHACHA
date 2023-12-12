module C_controller(
    input clk,
    input [2:0] M,
    output reg C
);

	reg [15-1:0] cnt;

	initial begin
		cnt <= 15'b000000000000000;
		C <= 0;
	end
	
	always @(posedge clk) begin
		if( M == 3'b000 | M == 3'b010 | M == 3'b101 ) begin
			if ( cnt == 15'b100000000000000 ) begin
				C <= 1;
				cnt <= 15'b000000000000000;
			end
			else begin
				cnt <= cnt + 15'b000000000000001;
			end
		end
		else
			C <= 0;
		end

endmodule
