module cnt_player1(
    input B, rst,
    input [5-1:0] N,
    input p_da1,
    output reg [5-1:0] p1_cnt
);
    always @ (posedge B or posedge rst) begin
        if (rst) begin
            if(N==2)
                p1_cnt=5'b00000;
            else if(N==3)
                p1_cnt=5'b00000;
            else if(N==4)
                p1_cnt=5'b00000;
        end
        else if (p_da1 == 1) begin 
            if (p1_cnt <= 22)
                p1_cnt = p1_cnt + 1;
            else if (p1_cnt == 23)
                p1_cnt = 0;
        end
    end
endmodule
