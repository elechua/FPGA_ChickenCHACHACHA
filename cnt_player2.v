module cnt_player2(
    input B, rst,
    input [5-1:0] N,
    input p_da2,
    output reg [5-1:0] p2_cnt
);
    always @ (posedge B or posedge rst) begin
        if (rst) begin
            if(N==2)
                p2_cnt=5'b01100;
            else if(N==3)
                p2_cnt=5'b01000;
            else if(N==4)
                p2_cnt=5'b00110;
        end
        else if (p_da2 == 1) begin 
            if (p2_cnt <= 22)
                p2_cnt = p2_cnt + 1;
            else if (p2_cnt == 23)
                p2_cnt = 0;
        end
    end
endmodule
