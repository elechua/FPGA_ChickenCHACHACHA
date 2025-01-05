module text_lcd(
    input clk, rst,
    output lcd_enb,
    output reg lcd_rs, lcd_rw,
    output reg [8-1:0] lcd_data
);
    reg [3-1:0] state;
    parameter delay = 3'b000,
    function_set = 3'b001,
    entry_mode = 3'b010,
    display_onoff = 3'b011,
    line1 = 3'b100,
    line2 = 3'b101,
    delay_t = 3'b110,
    clear_display = 3'b111;
    integer counter;
    
    always @ (posedge clk or posedge rst) begin
        if (rst) counter = 0;
        else
            case (state)
                delay: begin
                    if (counter == 70) counter = 0;
                    else counter = counter + 1;
                end
                function_set: begin
                    if (counter == 30) counter = 0;
                    else counter = counter + 1;
                end
                display_onoff: begin
                    if (counter == 30) counter = 0;
                    else counter = counter + 1;
                end
                entry_mode: begin
                    if (counter == 30) counter = 0;
                    else counter = counter + 1;
                end
                line1: begin
                    if (counter == 20) counter = 0;
                    else counter = counter + 1;
                end
                line2: begin
                    if (counter == 20) counter = 0;
                    else counter = counter + 1;
                end
                delay_t: begin
                    if (counter == 400) counter = 0;
                    else counter = counter + 1;
                end
                clear_display: begin
                    if (counter == 200) counter = 0;
                    else counter = counter + 1;
                end
            endcase
    end
    always @ (posedge clk or posedge rst) begin
        if (rst) state = delay;
        else
            case (state)
                delay: if (counter == 70) state = function_set;
                function_set: if (counter == 30) state = display_onoff;
                display_onoff: if (counter == 30) state = entry_mode;
                entry_mode: if (counter == 30) state = line1;
                line1: if (counter == 20) state = line2;
                line2: if (counter == 20) state = delay_t;
                delay_t: if (counter == 400) state = clear_display;
                clear_display: if (counter == 200) state = line1;
            endcase
    end
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            lcd_rs = 1'b1;
            lcd_rw = 1'b1;
            lcd_data = 8'b0000_0000;
        end
        else begin
            case (state)
                function_set: begin
                    lcd_rs = 1'b0;
                    lcd_rw = 1'b0;
                    lcd_data = 8'b0011_1100;
                end
                display_onoff: begin
                    lcd_rs = 1'b0;
                    lcd_rw = 1'b0;
                    lcd_data = 8'b0000_1100;
                end
                entry_mode: begin
                    lcd_rs = 1'b0;
                    lcd_rw = 1'b0;
                    lcd_data = 8'b0000_0110;
                end
                line1: begin
                    lcd_rw = 1'b0;
                    case (counter)
                        0: begin
                            lcd_rs = 1'b0;
                            lcd_data = 8'b1000_0000;
                            end
                        1: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0010_0000;
                            end
                        2: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0100_1000;
                            end
                        3: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0110_0101;
                            end
                        4: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0110_1100;
                            end
                        5: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0110_1100;
                            end
                         6: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0110_1111;
                            end
                        default: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0010_0000;
                        end
                    endcase
                end
                line2: begin
                    lcd_rw = 1'b0;
                    case (counter)
                    0: begin
                            lcd_rs = 1'b0;
                            lcd_data = 8'b1100_1000;
                            end
                        1: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0101_0111;
                            end
                        2: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0110_1111;
                            end
                        3: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0111_0010;
                            end
                        4: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0110_1100;
                            end
                        5: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0110_0100;
                            end
                        default: begin
                            lcd_rs = 1'b1;
                            lcd_data = 8'b0010_0000;
                        end
                    endcase
                end
                delay_t: begin
                    lcd_rs = 1'b0;
                    lcd_rw = 1'b0;
                    lcd_data = 8'b0000_0010;
                end
                clear_display: begin
                    lcd_rs = 1'b0;
                    lcd_rw = 1'b0;
                    lcd_data = 8'b0000_0001;
                end
                default: begin
                    lcd_rs = 1'b1;
                    lcd_rw = 1'b1;
                    lcd_data = 8'b0000_0000;
                end
            endcase
        end
    end
    assign lcd_enb = clk;
endmodule
