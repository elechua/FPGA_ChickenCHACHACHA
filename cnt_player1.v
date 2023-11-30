module cnt_player1(
    input clk, rst,
    input p_da1,
    output reg [5-1:0] p1_cnt
);
    always @ (posedge clk) begin
        if (p_da1 == 1) { 
            if (p1_cnt <= 22)
                p1_cnt = p1_cnt + 1;
            else if (p1_cnt == 23)
                p1_cnt = 0;
        }
    end
endmodule
