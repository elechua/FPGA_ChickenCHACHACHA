module clk_divider(
    input clk, rst,
    output LED1, 
    output reg LED2, LED3
    );
    reg [4-1:0] cnt2;
    reg [7-1:0] cnt3;
    assign LED1 = clk;
    
    always @ (posedge clk) begin
        if (rst) begin
            cnt2 = 4'd0;
            LED2 = 0;
        end
        else if (cnt2 >= 4'd5) begin
            LED2 = ~LED2;
            cnt2 = 4'd0;
        end
        else cnt2 = cnt2 + 4'd1;
    end
    
    always @ (posedge clk) begin
        if (rst) begin
            cnt3 = 6'd0;
            LED3 = 0;
        end
        else if (cnt3 >= 6'd50) begin
            LED3 = ~LED3;
            cnt3 = 6'd0;
        end
        else cnt3 = cnt3 + 6'd1;
    end
endmodule
