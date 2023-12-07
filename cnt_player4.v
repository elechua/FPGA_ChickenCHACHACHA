module cnt_player4(
    input B,
    input [2-1:0] N,
    input p_da4,
    output reg [5-1:0] p4_cnt
);
    always @ (N) begin
        if(N == 2'd0)
            p4_cnt = 5'b00000;
        else if(N == 2'd1)
            p4_cnt = 5'b00000;
        else if(N == 2'd2)
            p4_cnt = 5'b11000;
    end
    always @ (posedge B) begin
        if (p_da4 == 1) begin 
            if (p4_cnt <= 5'd22)
                p4_cnt = p4_cnt + 5'd1;
            else if (p4_cnt == 5'd23)
                p4_cnt = 5'd0;
        end
    end
endmodule
