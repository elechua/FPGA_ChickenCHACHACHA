module cnt_player1(
    input clk,
    input [3-1:0] M,
    input [3-1:0] N,
    input D,
    input p_da1,
    output reg [5-1:0] p1_cnt
);
    always @ (posedge clk) begin
        if (M == 3'b010) begin
            if (N == 3'd2)
                p1_cnt = 5'b00000;
            else if (N == 3'd3)
                p1_cnt = 5'b00000;
            else if (N == 3'd4)
                p1_cnt = 5'b00000;
        end
        else if (D == 1) begin
            if (p_da1 == 1) begin 
            if (p1_cnt <= 5'd22)
                p1_cnt = p1_cnt + 5'd1;
            else if (p1_cnt == 5'd23)
                p1_cnt = 5'd0;
            end
        end
    end
endmodule
