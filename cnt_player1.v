module cnt_player1(
    input B,
    input [2-1:0] N,
    input p_da1,
    output reg [5-1:0] p1_cnt
);
    always @ (N) begin
        if(N == 2'd0)
            p1_cnt = 5'b00000;
        else if(N == 2'd1)
            p1_cnt = 5'b00000;
        else if(N == 2'd2)
            p1_cnt = 5'b00000;
    end
    always @ (posedge B) begin
        if (p_da1 == 1) begin 
            if (p1_cnt <= 5'd22)
                p1_cnt = p1_cnt + 5'd1;
            else if (p1_cnt == 5'd23)
                p1_cnt = 5'd0;
        end
    end
endmodule
