module cnt_player4(
    input B, rst,
    input [5-1:0] N,
    input p_da4,
    output reg [5-1:0] p4_cnt
);
    always @ (posedge B or posedge rst) begin
        if (rst) begin
            if(N==2)
                p4_cnt=5'b00000;
            else if(N==3)
                p4_cnt=5'b00000;
            else if(N==4)
                p4_cnt=5'b11000;
        end
        else if (p_da4 == 1) begin 
             if (p4_cnt <= 22)
                p4_cnt = p4_cnt + 1;
            else if (p4_cnt == 23)
                p4_cnt = 0;
        end
    end
endmodule
