module three_to_one_MUX_upper(
    input [2-1:0] T,
    input [5-1:0] p1_cnt, p2_cnt, p3_cnt, p4_cnt,
    output reg [5-1:0] out
);
    always @ (T or p1_cnt or p2_cnt or p3_cnt or p4_cnt) begin
        case (T)
            2'b00: out = p1_cnt;
            2'b01: out = p2_cnt;
            2'b10: out = p3_cnt;
            2'b11: out = p4_cnt;
        endcase
    end
endmodule
