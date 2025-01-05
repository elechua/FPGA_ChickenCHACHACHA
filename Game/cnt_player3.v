module cnt_player3(
    input clk,
    input [3-1:0] M,
    input [3-1:0] N,
    input D,
    input p_da3,
    output reg [5-1:0] p3_cnt
);
    always @ (posedge clk) begin
        if (M == 3'b010) begin
            if (N == 3'd2)
                p3_cnt = 5'b11111;
            else if (N == 3'd3)
                p3_cnt = 5'b10000;
            else if (N == 3'd4)
                p3_cnt = 5'b01100;
        end
        else if (D == 1) begin
            if (p_da3 == 1) begin 
            if (p3_cnt <= 5'd22)
                p3_cnt = p3_cnt + 5'd1;
            else if (p3_cnt == 5'd23)
                p3_cnt = 5'd0;
            end
        end
    end
endmodule
