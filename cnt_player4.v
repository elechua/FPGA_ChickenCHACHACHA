module cnt_player4(
    input clk,
    input [3-1:0] M,
    input [3-1:0] N,
    input D,
    input p_da4,
    output reg [5-1:0] p4_cnt
);
    always @ (posedge clk) begin
        if (M == 3'b010) begin
            if (N == 3'd2)
                p4_cnt = 5'b11111;
            else if (N == 3'd3)
                p4_cnt = 5'b11111;
            else if (N == 3'd4)
                p4_cnt = 5'b11000;
        end
        else if (D == 1) begin
            if (p_da4 == 1) begin 
            if (p4_cnt <= 5'd22)
                p4_cnt = p4_cnt + 5'd1;
            else if (p4_cnt == 5'd23)
                p4_cnt = 5'd0;
            end
        end
    end
endmodule
