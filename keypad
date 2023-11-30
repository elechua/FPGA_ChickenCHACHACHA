module keypad(
    input clk, rst,
    input [3-1:0] key_col,
    output reg [4-1:0] key_row,
    output reg [4-1:0] key_value
);
    reg [2-1:0] key_counter;
    always @ (posedge clk) begin
        if (rst) key_counter = 2'b00;
        else key_counter = key_counter + 2'd1;
    end
    always @ (posedge clk) begin
        if (rst) key_row = 4'b0000;
        else begin
            case (key_counter)
                2'b00: key_row = 4'b1000;
                2'b01: key_row = 4'b0100;
                2'b10: key_row = 4'b0010;
                2'b11: key_row = 4'b0001;
            endcase
        end
    end
    always @ (posedge clk) begin
    if (rst) key_value = 4'hf;
    else
        case (key_row)
            4'b1000: case (key_col)
                        3'b100: key_value = 4'h1;
                        3'b010: key_value = 4'h2;
                        3'b001: key_value = 4'h3;
                        default: key_value = 4'hf;
                     endcase
            4'b0100: case (key_col)
                        3'b100: key_value = 4'h4;
                        3'b010: key_value = 4'h5;
                        3'b001: key_value = 4'h6;
                        default: key_value = 4'hf;
                     endcase                        
            4'b0010: case (key_col)
                        3'b100: key_value = 4'h7;
                        3'b010: key_value = 4'h8;
                        3'b001: key_value = 4'h9;
                        default: key_value = 4'hf;
                     endcase
            4'b0001: case (key_col)
                        3'b100: key_value = 4'hc;
                        3'b010: key_value = 4'h0;
                        3'b001: key_value = 4'hd;
                        default: key_value = 4'hf;
                     endcase
        endcase
    end
endmodule
