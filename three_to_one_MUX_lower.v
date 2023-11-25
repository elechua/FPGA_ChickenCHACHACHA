module three_to_one_MUX_lower(
    input [2-1:0] T,
    input [5-1:0] p1_cnt, p2_cnt, p3_cnt,
    output reg [5-1:0] out
);
    always @ (*) begin
        case (T)
            2'b00: out = p2_cnt;
            2'b01: out = p3_cnt;
            2'b10: out = p1_cnt;
        endcase
    end
endmodule