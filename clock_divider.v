module clk_divider(
    input clk, rst,
    output clk_keypad
    );
    reg [4-1:0] cnt;
    
    always @ (posedge clk) begin
        if (rst) begin
            cnt = 4'd0;
        end
        else if (cnt2 >= 4'd25) begin
            cnt = 4'd0;
        end
        else cnt = cnt + 4'd1;
    end
endmodule
