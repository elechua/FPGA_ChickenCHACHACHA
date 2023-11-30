module cnt_player3(
    input B, rst,
    input [4-1:0] N,
    input p_da3,
    output reg [5-1:0] p3_cnt
);
    always @ (posedge B or posedge rst) begin
        if (rst) begin
            if(N==2)
                p3_cnt=5'b00000;
            else if(N==3)
                p3_cnt=5'b10000;
            else if(N==4)
                p3_cnt=5'b01100;
        end
        else if (p_da3 == 1) begin 
            if (p3_cnt <= 22)
                p3_cnt = p3_cnt + 1;
            else if (p3_cnt == 23)
                p3_cnt = 0;
        end
    end
endmodule
