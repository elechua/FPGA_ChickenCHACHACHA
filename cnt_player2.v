module cnt_player2(
    input p_da2,
    output reg [5-1:0] p2_cnt
);
    always @ (*) begin
        if (p2_cnt <= 22)
            p2_cnt = p2_cnt + 1;
        else if (p2_cnt == 23)
            p2_cnt = 0;    
    end
endmodule