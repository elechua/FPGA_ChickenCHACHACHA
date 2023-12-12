module C_controller(
    input clk, rst,
    input [2:0] M,
    output reg C
);

	reg [28-1:0] cnt;

	initial begin
		cnt <= 28'd0;
		C <= 0;
	end
	
	always @(posedge clk) begin
	   if (rst) begin
	       cnt <= 28'd0;
	       C <= 0;
	    end
		else if( M == 3'b000 | M == 3'b010 | M == 3'b101 ) begin
			if ( cnt == 28'b1000111100001101000110000000 ) begin
				C <= 1;
				cnt <= 28'd0;
			end
			else begin
				cnt <= cnt + 28'd1;
			end
		end
		else
			C <= 0;
		end

endmodule
