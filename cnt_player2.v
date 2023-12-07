module cnt_player2(
    input B,
    input [2-1:0] N,
    input p_da2,
    output reg [5-1:0] p2_cnt
);
    always @ (N) begin
        if(N == 2'd0)
            p2_cnt = 5'b01100;
        else if(N == 2'd1)
            p2_cnt = 5'b01000;
        else if(N == 2'd2)
            p2_cnt = 5'b00110;
    end
    always @ (posedge B) begin
        if (p_da2 == 1) begin 
            if (p2_cnt <= 5'd22)
                p2_cnt = p2_cnt + 5'd1;
            else if (p2_cnt == 5'd23)
                p2_cnt = 5'd0;
        end
    end
endmodule
