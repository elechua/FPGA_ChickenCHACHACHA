module cnt_player3(
    input B,
    input [2-1:0] N,
    input p_da3,
    output reg [5-1:0] p3_cnt
);
    always @ (N) begin
        if(N == 2'd0)
            p3_cnt = 5'b00000;
        else if(N == 2'd1)
            p3_cnt = 5'b10000;
        else if(N == 2'd2)
            p3_cnt = 5'b01100;
    end
    always @ (posedge B) begin
        if (p_da3 == 1) begin 
            if (p3_cnt <= 5'd22)
                p3_cnt = p3_cnt + 5'd1;
            else if (p3_cnt == 5'd23)
                p3_cnt = 5'd0;
        end
    end
endmodule
