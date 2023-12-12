module clk_oscillator(
    input clk, rst,
    output reg clk_keypad
    );
    reg [5-1:0] cnt;
    
    always @ (posedge clk) begin
        if (rst) begin
            cnt = 5'd0;
            clk_keypad = 0;
        end
        else if (cnt >= 5'd25) begin
            clk_keypad = ~clk_keypad;
            cnt = 5'd0;
        end
        else cnt = cnt + 5'd1;
    end
endmodule
