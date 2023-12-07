module two_to_one_MUX(
    input [4-1:0] key,
    input [5-1:0] tile_info,
    input A,
    output reg [6-1:0] ADDR_IN
);
    always @ (*) begin
        case(A)
            1'b0: ADDR_IN = key + 'd23;
            1'b1: ADDR_IN = tile_info;
        endcase
    end
endmodule
