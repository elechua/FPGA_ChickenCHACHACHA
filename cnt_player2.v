module cnt_player2(
    input clk,
    input [3-1:0] M,
    input [3-1:0] N,
    input D,
    input p_da2,
    output reg [5-1:0] p2_cnt
);
    always @ (posedge clk) begin
        if (M == 3'b010) begin
            if (N == 3'd2)
                p2_cnt = 5'b01100;
            else if (N == 3'd3)
                p2_cnt = 5'b01000;
            else if (N == 3'd4)
                p2_cnt = 5'b00110;
        end
        else if (D == 1) begin
            if (p_da2 == 1) begin 
            if (p2_cnt <= 5'd22)
                p2_cnt = p2_cnt + 5'd1;
            else if (p2_cnt == 5'd23)
                p2_cnt = 5'd0;
            end
        end
    end
endmodule
