module clk_oscillator(
    input clk, rst,
    output reg clk_keypad
    );
    reg [4-1:0] cnt;
    
    always @ (posedge clk) begin
        if (rst) begin
            cnt = 4'd0;
            clk_keypad = 0;
        end
        else if (cnt >= 4'd25) begin
            clk_keypad = ~clk_keypad;
            cnt = 4'd0;
        end
        else cnt = cnt + 4'd1;
    end
endmodule
