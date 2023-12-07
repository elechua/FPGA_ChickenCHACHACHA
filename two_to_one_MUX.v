module two_to_one_MUX(
    input [4-1:0] key,
    input [5-1:0] tile_info,
    input A,
    output reg [6-1:0] ADDR_IN
);
    always @ (*) begin
        case(A)
            1'b0: stop_increase = 0;
            1'b1: stop_increase = 1;
        endcase
    end

    assign ADDR_IN = //비트수가 다른데 어카지
endmodule
