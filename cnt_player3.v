module cnt_player3(
    input p_da3,
    output reg [5-1:0] p3_cnt
);
    always @ (*) begin
        if (p3_cnt <= 22)
            p3_cnt = p3_cnt + 1;
        else if (p3_cnt == 23)
            p3_cnt = 0;    
    end
endmodule