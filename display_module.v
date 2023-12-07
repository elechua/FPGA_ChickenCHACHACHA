module display_module(
    input clk, rst,
    input [96-1:0] edge_order,
    input [48-1:0] center_order,
    input [4-1:0] P1_pos, P2_pos, P3_pos, P4_pos,
    //input board,
    output den, hsync, vsync, 
    output [8-1:0] R, G, B,
    output dclk, disp_en
);
    wire [11-1:0] counter_h;
    wire [10-1:0] counter_v;
    tft_lcd_controller ctl(.clk(clk), .rst(rst), .counter_h(counter_h), .counter_v(counter_v), .disp_den(den), .disp_hsync(hsync), .disp_vsync(vsync), .disp_clk(dclk), .disp_enb(disp_en));
    
    wire [3:0] edge_0_color,
    edge_1_color,
    edge_2_color,
    edge_3_color,
    edge_4_color,
    edge_5_color,
    edge_6_color,
    edge_7_color,
    edge_8_color,
    edge_9_color,
    edge_10_color,
    edge_11_color,
    edge_12_color,
    edge_13_color,
    edge_14_color,
    edge_15_color,
    edge_16_color,
    edge_17_color,
    edge_18_color,
    edge_19_color,
    edge_20_color,
    edge_21_color,
    edge_22_color,
    edge_23_color;

    assign edge_0_color = edge_order[95:92];
    assign edge_1_color = edge_order[91:88];
    assign edge_2_color = edge_order[87:84];
    assign edge_3_color = edge_order[83:80];
    assign edge_4_color = edge_order[79:76];
    assign edge_5_color = edge_order[75:72];
    assign edge_6_color = edge_order[71:68];
    assign edge_7_color = edge_order[67:64];
    assign edge_8_color = edge_order[63:60];
    assign edge_9_color = edge_order[59:56];
    assign edge_10_color = edge_order[55:52];
    assign edge_11_color = edge_order[51:48];
    assign edge_12_color = edge_order[47:44];
    assign edge_13_color = edge_order[43:40];
    assign edge_14_color = edge_order[39:36];
    assign edge_15_color = edge_order[35:32];
    assign edge_16_color = edge_order[31:28];
    assign edge_17_color = edge_order[27:24];
    assign edge_18_color = edge_order[23:20];
    assign edge_19_color = edge_order[19:16];
    assign edge_20_color = edge_order[15:12];
    assign edge_21_color = edge_order[11:8];
    assign edge_22_color = edge_order[7:4];
    assign edge_23_color = edge_order[3:0];
    
    reg [4-1:0] color;
    
    reg [24-1:0] output_color;
    assign R = output_color[23:16];
    assign G = output_color[15:8];
    assign B = output_color[7:0];

    localparam RED = 4'b0000;
    localparam ORANGE = 4'b0001;
    localparam YELLOW = 4'b0010;
    localparam GREEN = 4'b0011;
    localparam BLUE = 4'b0100;
    localparam NAVY = 4'b0101;
    localparam PURPLE = 4'b0110;
    localparam WHITE = 4'b0111;
    localparam BLACK = 4'b1000;
    localparam SKYBLUE = 4'b1001;
    localparam FORESTGREEN = 4'b1010;
    localparam GRAY = 4'b1011;
    localparam BROWN = 4'b1100;
    
    //edgetile 76*76px
    localparam [24-1:0] RGB_TILE_RED = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_ORANGE = {8'd255, 8'd140, 8'd0};
    localparam [24-1:0] RGB_TILE_YELLOW = {8'd255, 8'd255, 8'd0};
    localparam [24-1:0] RGB_TILE_GREEN = {8'd50, 8'd205, 8'd50};
    localparam [24-1:0] RGB_TILE_BLUE = {8'd0, 8'd0, 8'd255};
    localparam [24-1:0] RGB_TILE_NAVY = {8'd0, 8'd0, 8'd128};
    localparam [24-1:0] RGB_TILE_PURPLE = {8'd148, 8'd0, 8'd211};
    localparam [24-1:0] RGB_TILE_WHITE = {8'd255, 8'd255, 8'd255};
    localparam [24-1:0] RGB_TILE_BLACK = {8'd0, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_SKYBLUE = {8'd135, 8'd206, 8'd235};
    localparam [24-1:0] RGB_TILE_FORESTGREEN = {8'd0, 8'd100, 8'd0};
    localparam [24-1:0] RGB_TILE_GRAY = {8'd128, 8'd128, 8'd128};
    localparam [24-1:0] RGB_TILE_BROWN = {8'd165, 8'd42, 8'd165};

    always @ (color) begin
        case (color)
            TILE_RED : output_color = RGB_TILE_RED;
            TILE_ORANGE : output_color = RGB_TILE_ORANGE;
            TILE_YELLOW : output_color = RGB_TILE_YELLOW;
            TILE_GREEN : output_color = RGB_TILE_GREEN;
            TILE_BLUE : output_color = RGB_TILE_BLUE;
            TILE_NAVY : output_color = RGB_TILE_NAVY;
            TILE_PURPLE : output_color = RGB_TILE_PURPLE;
            TILE_WHITE : output_color = RGB_TILE_WHITE;
            TILE_BLACK : output_color = RGB_TILE_BLACK;
            TILE_SKYBLUE : output_color = RGB_TILE_SKYBLUE;
            TILE_FORESTGREEN : output_color = RGB_TILE_FORESTGREEN;
            TILE_GRAY : output_color = RGB_TILE_GRAY;
            TILE_BRWON : output_color = RGB_TILE_BROWN;
        endcase
    end
           
    //localparam RGB_BORDERLINE = 8'b;
    //localparam RGB_RIGHTEDGE = 8'b;
    //localparam RGB_GAPSPACE = 8'b;

    reg [8-1:0] TILE_ZERO_ART [8-1:0];
    initial begin
        TILE_ZERO_ART[0] = 8'b00000000;
        TILE_ZERO_ART[1] = 8'b00000000;
        TILE_ZERO_ART[2] = 8'b00111100;
        TILE_ZERO_ART[3] = 8'b00100100;
        TILE_ZERO_ART[4] = 8'b00100100;
        TILE_ZERO_ART[5] = 8'b00100100;
        TILE_ZERO_ART[6] = 8'b00111100;
        TILE_ZERO_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_ONE_ART [8-1:0];
    initial begin
        TILE_ONE_ART[0] = 8'b00000000;
        TILE_ONE_ART[1] = 8'b00010000;
        TILE_ONE_ART[2] = 8'b00010000;
        TILE_ONE_ART[3] = 8'b00010000;
        TILE_ONE_ART[4] = 8'b00010000;
        TILE_ONE_ART[5] = 8'b00010000;
        TILE_ONE_ART[6] = 8'b00000000;
        TILE_ONE_ART[7] = 8'b00000000;
    end


    reg [8-1:0] TILE_TWO_ART [8-1:0];
    initial begin
        TILE_TWO_ART[0] = 8'b00000000;
        TILE_TWO_ART[1] = 8'b00111100;
        TILE_TWO_ART[2] = 8'b00100000;
        TILE_TWO_ART[3] = 8'b00111100;
        TILE_TWO_ART[4] = 8'b00000100;
        TILE_TWO_ART[5] = 8'b00111100;
        TILE_TWO_ART[6] = 8'b00000000;
        TILE_TWO_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_THREE_ART [8-1:0];
    initial begin
        TILE_THREE_ART[0] = 8'b00000000;
        TILE_THREE_ART[1] = 8'b00111100;
        TILE_THREE_ART[2] = 8'b00100000;
        TILE_THREE_ART[3] = 8'b00111100;
        TILE_THREE_ART[4] = 8'b00100000;
        TILE_THREE_ART[5] = 8'b00111100;
        TILE_THREE_ART[6] = 8'b00000000;
        TILE_THREE_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_FOUR_ART [8-1:0];
    initial begin
        TILE_FOUR_ART[0] = 8'b00000000;
        TILE_FOUR_ART[1] = 8'b00100100;
        TILE_FOUR_ART[2] = 8'b00100100;
        TILE_FOUR_ART[3] = 8'b01111100;
        TILE_FOUR_ART[4] = 8'b00100000;
        TILE_FOUR_ART[5] = 8'b00100000;
        TILE_FOUR_ART[6] = 8'b00000000;
        TILE_FOUR_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_FIVE_ART [8-1:0];
    initial begin
        TILE_FIVE_ART[0] = 8'b00000000;
        TILE_FIVE_ART[1] = 8'b00111100;
        TILE_FIVE_ART[2] = 8'b00000100;
        TILE_FIVE_ART[3] = 8'b00111100;
        TILE_FIVE_ART[4] = 8'b00100000;
        TILE_FIVE_ART[5] = 8'b00111100;
        TILE_FIVE_ART[6] = 8'b00000000;
        TILE_FIVE_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_SIX_ART [8-1:0];
    initial begin
        TILE_SIX_ART[0] = 8'b00000000;
        TILE_SIX_ART[1] = 8'b00111100;
        TILE_SIX_ART[2] = 8'b00000100;
        TILE_SIX_ART[3] = 8'b00111100;
        TILE_SIX_ART[4] = 8'b00100100;
        TILE_SIX_ART[5] = 8'b00111100;
        TILE_SIX_ART[6] = 8'b00000000;
        TILE_SIX_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_SEVEN_ART [8-1:0];
    initial begin
        TILE_SEVEN_ART[0] = 8'b00000000;
        TILE_SEVEN_ART[1] = 8'b00000000;
        TILE_SEVEN_ART[2] = 8'b00111100;
        TILE_SEVEN_ART[3] = 8'b00100100;
        TILE_SEVEN_ART[4] = 8'b00100000;
        TILE_SEVEN_ART[5] = 8'b00100000;
        TILE_SEVEN_ART[6] = 8'b00100000;
        TILE_SEVEN_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_EIGHT_ART [8-1:0];
    initial begin
        TILE_EIGHT_ART[0] = 8'b00000000;
        TILE_EIGHT_ART[1] = 8'b00000000;
        TILE_EIGHT_ART[2] = 8'b00111100;
        TILE_EIGHT_ART[3] = 8'b00100100;
        TILE_EIGHT_ART[4] = 8'b00111100;
        TILE_EIGHT_ART[5] = 8'b00100100;
        TILE_EIGHT_ART[6] = 8'b00111100;
        TILE_EIGHT_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_NINE_ART [8-1:0];
    initial begin
        TILE_NINE_ART[0] = 8'b00000000;
        TILE_NINE_ART[1] = 8'b00000000;
        TILE_NINE_ART[2] = 8'b00111100;
        TILE_NINE_ART[3] = 8'b00100100;
        TILE_NINE_ART[4] = 8'b00111100;
        TILE_NINE_ART[5] = 8'b00100000;
        TILE_NINE_ART[6] = 8'b00111100;
        TILE_NINE_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_SHARP_ART [8-1:0];
    initial begin
        TILE_SHARP_ART[0] = 8'b00000000;
        TILE_SHARP_ART[1] = 8'b00100100;
        TILE_SHARP_ART[2] = 8'b01111110;
        TILE_SHARP_ART[3] = 8'b00100100;
        TILE_SHARP_ART[4] = 8'b00100100;
        TILE_SHARP_ART[5] = 8'b01111110;
        TILE_SHARP_ART[6] = 8'b00100100;
        TILE_SHARP_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_STAR_ART [8-1:0];
    initial begin
        TILE_STAR_ART[0] = 8'b00000000;
        TILE_STAR_ART[1] = 8'b00010000;
        TILE_STAR_ART[2] = 8'b01010100;
        TILE_STAR_ART[3] = 8'b00111000;
        TILE_STAR_ART[4] = 8'b00111000;
        TILE_STAR_ART[5] = 8'b01010100;
        TILE_STAR_ART[6] = 8'b00010000;
        TILE_STAR_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_NW_ARROW_ART [8-1:0];
    initial begin
        TILE_NW_ARROW_ART[0] = 8'b00000000;
        TILE_NW_ARROW_ART[1] = 8'b00100000;
        TILE_NW_ARROW_ART[2] = 8'b01111110;
        TILE_NW_ARROW_ART[3] = 8'b00100010;
        TILE_NW_ARROW_ART[4] = 8'b00000010;
        TILE_NW_ARROW_ART[5] = 8'b00000010;
        TILE_NW_ARROW_ART[6] = 8'b00000000;
        TILE_NW_ARROW_ART[7] = 8'b00000000;
    end
    
    reg [8-1:0] TILE_NE_ARROW_ART [8-1:0];
    initial begin
        TILE_NE_ARROW_ART[0] = 8'b00000000;
        TILE_NE_ARROW_ART[1] = 8'b00111100;
        TILE_NE_ARROW_ART[2] = 8'b00100000;
        TILE_NE_ARROW_ART[3] = 8'b00100000;
        TILE_NE_ARROW_ART[4] = 8'b00100000;
        TILE_NE_ARROW_ART[5] = 8'b01110000;
        TILE_NE_ARROW_ART[6] = 8'b00100000;
        TILE_NE_ARROW_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_SE_ARROW_ART [8-1:0];
    initial begin
        TILE_SE_ARROW_ART[0] = 8'b00000000;
        TILE_SE_ARROW_ART[1] = 8'b00000000;
        TILE_SE_ARROW_ART[2] = 8'b01000000;
        TILE_SE_ARROW_ART[3] = 8'b01000000;
        TILE_SE_ARROW_ART[4] = 8'b01000100;
        TILE_SE_ARROW_ART[5] = 8'b01111110;
        TILE_SE_ARROW_ART[6] = 8'b00000100;
        TILE_SE_ARROW_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_SW_ARROW_ART [8-1:0];
    initial begin
        TILE_SW_ARROW_ART[0] = 8'b00000000;
        TILE_SW_ARROW_ART[1] = 8'b00000100;
        TILE_SW_ARROW_ART[2] = 8'b00001110;
        TILE_SW_ARROW_ART[3] = 8'b00000100;
        TILE_SW_ARROW_ART[4] = 8'b00000100;
        TILE_SW_ARROW_ART[5] = 8'b00000100;
        TILE_SW_ARROW_ART[6] = 8'b00111100;
        TILE_SW_ARROW_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_P1_ART [8-1:0];
    initial begin
        TILE_P1_ART[0] = 8'b00000000;
        TILE_P1_ART[1] = 8'b00011000;
        TILE_P1_ART[2] = 8'b00100100;
        TILE_P1_ART[3] = 8'b01000010;
        TILE_P1_ART[4] = 8'b01000010;
        TILE_P1_ART[5] = 8'b00100100;
        TILE_P1_ART[6] = 8'b00011000;
        TILE_P1_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_P2_ART [8-1:0];
    initial begin
        TILE_P2_ART[0] = 8'b00000000;
        TILE_P2_ART[1] = 8'b00000000;
        TILE_P2_ART[2] = 8'b00111100;
        TILE_P2_ART[3] = 8'b00100100;
        TILE_P2_ART[4] = 8'b00100100;
        TILE_P2_ART[5] = 8'b00111100;
        TILE_P2_ART[6] = 8'b00000000;
        TILE_P2_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_P3_ART [8-1:0];
    initial begin
        TILE_P3_ART[0] = 8'b00000000;
        TILE_P3_ART[1] = 8'b00000000;
        TILE_P3_ART[2] = 8'b01111110;
        TILE_P3_ART[3] = 8'b01000100;
        TILE_P3_ART[4] = 8'b00101000;
        TILE_P3_ART[5] = 8'b00010000;
        TILE_P3_ART[6] = 8'b00000000;
        TILE_P3_ART[7] = 8'b00000000;
    end

    reg [8-1:0] TILE_P4_ART [8-1:0];
    initial begin
        TILE_P4_ART[0] = 8'b00000000;
        TILE_P4_ART[1] = 8'b00000000;
        TILE_P4_ART[2] = 8'b00100100;
        TILE_P4_ART[3] = 8'b00111100;
        TILE_P4_ART[4] = 8'b01100110;
        TILE_P4_ART[5] = 8'b00111000;
        TILE_P4_ART[6] = 8'b00010000;
        TILE_P4_ART[7] = 8'b00000000;
    end
    
    reg [3-1:0] counter_row;
    reg [4-1:0] counter_col;
    reg [6:0] square_x;
    reg [6:0] square_y;
    reg [4:0] art_x;
    reg [4:0] art_y;

    wire if_edge;
    
    wire edge_0;
    wire edge_1;
    wire edge_2;
    wire edge_3;
    wire edge_4;
    wire edge_5;
    wire edge_6;
    wire edge_7;
    wire edge_8;
    wire edge_9;
    wire edge_10;
    wire edge_11;
    wire edge_12;
    wire edge_13;
    wire edge_14;
    wire edge_15;
    wire edge_16;
    wire edge_17;
    wire edge_18;
    wire edge_19;
    wire edge_20;
    wire edge_21;
    wire edge_22;
    wire edge_23;

    //외곽타일 매치
    assign edge_0 = (counter_row == 1 && counter_col == 1);
    assign edge_1 = (counter_row == 1 && counter_col == 2);
    assign edge_2 = (counter_row == 1 && counter_col == 3);
    assign edge_3 = (counter_row == 1 && counter_col == 4);
    assign edge_4 = (counter_row == 1 && counter_col == 5);
    assign edge_5 = (counter_row == 1 && counter_col == 6);
    assign edge_6 = (counter_row == 1 && counter_col == 7);
    assign edge_7 = (counter_row == 1 && counter_col == 8);
    assign edge_8 = (counter_row == 2 && counter_col == 8);
    assign edge_9 = (counter_row == 3 && counter_col == 8);
    assign edge_10 = (counter_row == 4 && counter_col == 8);
    assign edge_11 = (counter_row == 5 && counter_col == 8);
    assign edge_12 = (counter_row == 6 && counter_col == 8);
    assign edge_13 = (counter_row == 6 && counter_col == 7);
    assign edge_14 = (counter_row == 6 && counter_col == 6);
    assign edge_15 = (counter_row == 6 && counter_col == 5);
    assign edge_16 = (counter_row == 6 && counter_col == 4);
    assign edge_17 = (counter_row == 6 && counter_col == 3);
    assign edge_18 = (counter_row == 6 && counter_col == 2);
    assign edge_19 = (counter_row == 6 && counter_col == 1);
    assign edge_20 = (counter_row == 5 && counter_col == 1);
    assign edge_21 = (counter_row == 4 && counter_col == 1);
    assign edge_22 = (counter_row == 3 && counter_col == 1);
    assign edge_23 = (counter_row == 2 && counter_col == 1);
    //if edge는 or로 해야 하는 건가?
    assign if_edge = edge_0 && edge_1 && edge_2 && edge_3 && edge_4 && edge_5 && edge_6 && edge_7 && edge_8 && edge_9 && edge_10 && edge_11 && edge_12 && edge_13 && edge_14 && edge_15 && edge_16 && edge_17 && edge_18 && edge_19 && edge_20 && edge_21 && edge_22 && edge_23;

    always @(counter_h) begin
        if (counter_h <= 'd210) begin counter_col <= 0; square_x <= counter_h; end
    	else if (counter_h <= 'd290) begin counter_col <= 1; square_x <= counter_h - 'd210; end
    	else if (counter_h <= 'd370) begin counter_col <= 2; square_x <= counter_h - 'd290; end
    	else if (counter_h <= 'd450) begin counter_col <= 3; square_x <= counter_h - 'd370; end
    	else if (counter_h <= 'd530) begin counter_col <= 4; square_x <= counter_h - 'd450; end
    	else if (counter_h <= 'd610) begin counter_col <= 5; square_x <= counter_h - 'd530; end
    	else if (counter_h <= 'd690) begin counter_col <= 6; square_x <= counter_h - 'd610; end
    	else if (counter_h <= 'd770) begin counter_col <= 7; square_x <= counter_h - 'd690; end
    	else if	(counter_h <= 'd850) begin counter_col <= 8; square_x <= counter_h - 'd770; end
        else if (counter_h <= 'd1010) begin counter_col <= 9; square_x <= counter_h - 'd850; end
        else                          begin counter_col <= 10; square_x <= counter_h - 'd1010; end //아무 의미 없음
    end

    always @(counter_v) begin
        if (counter_v <= 'd22) begin counter_row <= 0; square_y <= counter_v; end
    	else if (counter_v <= 'd102) begin counter_row <= 1; square_y <= counter_v - 'd22; end
    	else if (counter_v <= 'd182) begin counter_row <= 2; square_y <= counter_v - 'd102; end
    	else if (counter_v <= 'd262) begin counter_row <= 3; square_y <= counter_v - 'd182; end
    	else if (counter_v <= 'd342) begin counter_row <= 4; square_y <= counter_v - 'd262; end
    	else if (counter_v <= 'd422) begin counter_row <= 5; square_y <= counter_v - 'd342; end
    	else if (counter_v <= 'd502) begin counter_row <= 6; square_y <= counter_v - 'd422; end
        else                       begin counter_row <= 7; square_y <= counter_v - 'd502; end //아무 의미 없음
    end

    always @(square_x) begin
    	if 	    (square_x >= 2 && square_x <= 11) art_x <= 0;
    	else if (square_x >= 12 && square_x <= 21) art_x <= 1;
    	else if (square_x >= 22 && square_x <= 31) art_x <= 2;
    	else if (square_x >= 32 && square_x <= 41) art_x <= 3;
    	else if (square_x >= 42 && square_x <= 51) art_x <= 4;
    	else if (square_x >= 52 && square_x <= 61) art_x <= 5;
    	else if (square_x >= 62 && square_x <= 71) art_x <= 6;
    	else 				     art_x <= 7;	
    end

    always @(square_y) begin
    	if 	    (square_y >= 2 && square_y <= 11) art_y <= 0;
    	else if (square_y >= 12 && square_y <= 21) art_y <= 1;
    	else if (square_y >= 22 && square_y <= 31) art_y <= 2;
    	else if (square_y >= 32 && square_y <= 41) art_y <= 3;
    	else if (square_y >= 42 && square_y <= 51) art_y <= 4;
    	else if (square_y >= 52 && square_y <= 61) art_y <= 5;
    	else if (square_y >= 62 && square_y <= 71) art_y <= 6;
    	else 				     art_y <= 7;	
    end

    assign in_border = (square_x<=2 || square_x>=78 || square_y <=2 || square_y >=78);
    assign in_board = (square_x >= 2 && square_x <= 78 && square_y >= 2 && square_y <= 78);

    always @ (posedge clk or posedge rst) begin
        if(rst) color <= RGB_TILE_BLACK;
        else begin
            if (in_border) begin
                if (counter_row == 2 && counter_col == 2 || counter_row == 2 && counter_col == 3 || counter_row == 2 && counter_col == 4 || counter_row == 2 && counter_col == 5 || counter_row == 2 && counter_col == 6 || counter_row == 2 && counter_col == 7 ||
                    counter_row == 5 && counter_col == 2 || counter_row == 5 && counter_col == 3 || counter_row == 5 && counter_col == 4 || counter_row == 5 && counter_col == 5 || counter_row == 5 && counter_col == 6 || counter_row == 5 && counter_col == 7 ||
                    counter_col == 9)
                    output_color <= RGB_TILE_BLACK;
                else
                    output_color <= RGB_TILE_WHITE;
            end
            else if (in_board) begin
                // 가운데 타일
                // ROW 3 COL 2 ~ 7
                // ROW 4 COL 2 ~ 7
                //1
                if (counter_row == 3 && counter_col == 2) begin
                    if (TILE_ONE_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //2
                else if (counter_row == 3 && counter_col == 3) begin
                    if (TILE_TWO_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //3
                else if (counter_row == 3 && counter_col == 4) begin
                    if (TILE_THREE_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //4
                else if (counter_row == 3 && counter_col == 5) begin
                    if (TILE_FOUR_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //5
                else if (counter_row == 3 && counter_col == 6) begin
                    if (TILE_FIVE_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //6
                else if (counter_row == 3 && counter_col == 7) begin
                    if (TILE_SIX_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //7
                else if (counter_row == 4 && counter_col == 2) begin
                    if (TILE_SEVEN_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //8
                else if (counter_row == 4 && counter_col == 3) begin
                    if (TILE_EIGHT_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //9
                else if (counter_row == 4 && counter_col == 4) begin
                    if (TILE_NINE_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //0
                else if (counter_row == 4 && counter_col == 5) begin
                    if (TILE_ZERO_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //#
                else if (counter_row == 4 && counter_col == 6) begin
                    if (TILE_SHARP_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //*
                else if (counter_row == 4 && counter_col == 7) begin
                    if (TILE_STAR_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //화살표 타일
                //북서쪽
                else if (counter_row == 2 && counter_col == 2) begin
                    if (TILE_NW_ARROW_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //북동쪽
                else if (counter_row == 2 && counter_col == 7) begin
                    if (TILE_NE_ARROW_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //남동쪽
                else if (counter_row == 5 && counter_col == 7) begin
                    if (TILE_SE_ARROW_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                //남서쪽
                else if (counter_row == 5 && counter_col == 2) begin
                    if (TILE_SW_ARROW_ART[art_y][art_x]) output_color <= RGB_TILE_WHITE;
                    else output_color <= RGB_TILE_BLACK;
                end
                
                //외곽 타일
                else if (if_edge)
                    if (edge_0)
                        if (P1_pos == 0)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_0_color;
                        else if (P2_pos == 0)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_0_color;
                        else if (P3_pos == 0)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_0_color;
                        else if (P4_pos == 0)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_0_color;
                        else color <= edge_0_color;
                    else if (edge_1)
                        if (P1_pos == 1)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_1_color;
                        else if (P2_pos == 1)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_1_color;
                        else if (P3_pos == 1)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_1_color;
                        else if (P4_pos == 1)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_1_color;
                        else color <= edge_1_color;
                    else if (edge_2)
                        if (P1_pos == 2)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_2_color;
                        else if (P2_pos == 2)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_2_color;
                        else if (P3_pos == 2)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_2_color;
                        else if (P4_pos == 2)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_2_color;
                        else color <= edge_2_color;
                    else if (edge_3)
                        if (P1_pos == 3)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_3_color;
                        else if (P2_pos == 3)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_3_color;
                        else if (P3_pos == 3)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_3_color;
                        else if (P4_pos == 3)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_2_color;
                        else color <= edge_3_color;
                    else if (edge_4)
                        if (P1_pos == 4)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_4_color;
                        else if (P2_pos == 4)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_4_color;
                        else if (P3_pos == 4)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_4_color;
                        else if (P4_pos == 4)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_4_color;
                        else color <= edge_4_color;
                    else if (edge_5)
                        if (P1_pos == 5)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_5_color;
                        else if (P2_pos == 5)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_5_color;
                        else if (P3_pos == 5)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_5_color;
                        else if (P4_pos == 5)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_5_color;
                        else color <= edge_5_color;
                    else if (edge_6)
                        if (P1_pos == 6)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_6_color;
                        else if (P2_pos == 6)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_6_color;
                        else if (P3_pos == 6)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_6_color;
                        else if (P4_pos == 6)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_6_color;
                        else color <= edge_6_color;
                    else if (edge_7)
                        if (P1_pos == 7)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_7_color;
                        else if (P2_pos == 7)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_7_color;
                        else if (P3_pos == 7)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_7_color;
                        else if (P4_pos == 7)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_7_color;
                        else color <= edge_7_color;
                    else if (edge_8)
                        if (P1_pos == 8)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_8_color;
                        else if (P2_pos == 8)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_8_color;
                        else if (P3_pos == 8)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_8_color;
                        else if (P4_pos == 8)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_8_color;
                        else color <= edge_8_color;
                    else if (edge_9)
                        if (P1_pos == 9)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_9_color;
                        else if (P2_pos == 9)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_9_color;
                        else if (P3_pos == 9)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_9_color;
                        else if (P4_pos == 9)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_9_color;
                        else color <= edge_9_color;
                    else if (edge_10)
                        if (P1_pos == 10)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_10_color;
                        else if (P2_pos == 10)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_10_color;
                        else if (P3_pos == 10)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_10_color;
                        else if (P4_pos == 10)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_10_color;
                        else color <= edge_10_color;
                    else if (edge_11)
                        if (P1_pos == 11)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_11_color;
                        else if (P2_pos == 11)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_11_color;
                        else if (P3_pos == 11)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_11_color;
                        else if (P4_pos == 11)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_11_color;
                        else color <= edge_11_color;
                    else if (edge_12)
                        if (P1_pos == 12)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_12_color;
                        else if (P2_pos == 12)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_12_color;
                        else if (P3_pos == 12)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_12_color;
                        else if (P4_pos == 12)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_12_color;
                        else color <= edge_12_color;
                    else if (edge_13)
                        if (P1_pos == 13)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_13_color;
                        else if (P2_pos == 13)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_13_color;
                        else if (P3_pos == 13)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_13_color;
                        else if (P4_pos == 13)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_13_color;
                        else color <= edge_13_color;
                    else if (edge_14)
                        if (P1_pos == 14)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_14_color;
                        else if (P2_pos == 14)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_14_color;
                        else if (P3_pos == 14)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_14_color;
                        else if (P4_pos == 14)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_14_color;
                        else color <= edge_14_color;
                    else if (edge_15)
                        if (P1_pos == 15)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_15_color;
                        else if (P2_pos == 15)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_15_color;
                        else if (P3_pos == 15)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_15_color;
                        else if (P4_pos == 15)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_15_color;
                        else color <= edge_15_color;
                    else if (edge_16)
                        if (P1_pos == 16)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_16_color;
                        else if (P2_pos == 16)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_16_color;
                        else if (P3_pos == 16)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_16_color;
                        else if (P4_pos == 16)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_16_color;
                        else color <= edge_16_color;
                    else if (edge_17)
                        if (P1_pos == 17)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_17_color;
                        else if (P2_pos == 17)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_17_color;
                        else if (P3_pos == 17)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_17_color;
                        else if (P4_pos == 17)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_17_color;
                        else color <= edge_17_color;
                    else if (edge_18)
                        if (P1_pos == 18)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_18_color;
                        else if (P2_pos == 18)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_18_color;
                        else if (P3_pos == 18)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_18_color;
                        else if (P4_pos == 18)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_18_color;
                        else color <= edge_18_color;
                    else if (edge_19)
                        if (P1_pos == 19)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_19_color;
                        else if (P2_pos == 19)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_19_color;
                        else if (P3_pos == 19)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_19_color;
                        else if (P4_pos == 19)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_19_color;
                        else color <= edge_19_color;
                    else if (edge_20)
                        if (P1_pos == 20)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_20_color;
                        else if (P2_pos == 20)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_20_color;
                        else if (P3_pos == 20)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_20_color;
                        else if (P4_pos == 20)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_20_color;
                        else color <= edge_20_color;
                    else if (edge_21)
                        if (P1_pos == 21)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_21_color;
                        else if (P2_pos == 21)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_21_color;
                        else if (P3_pos == 21)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_21_color;
                        else if (P4_pos == 21)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_21_color;
                        else color <= edge_21_color;
                    else if (edge_22)
                        if (P1_pos == 22)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_22_color;
                        else if (P2_pos == 22)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_22_color;
                        else if (P3_pos == 22)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_22_color;
                        else if (P4_pos == 22)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_22_color;
                        else color <= edge_22_color;   
                    else if (edge_23)
                        if (P1_pos == 23)
                            if (TILE_P1_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_23_color;
                        else if (P2_pos == 23)    
                            if (TILE_P2_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_23_color;
                        else if (P3_pos == 23)    
                            if (TILE_P3_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_23_color;
                        else if (P4_pos == 23)    
                            if (TILE_P4_ART[art_y][art_x]) color <= RGB_TILE_BROWN;
                            else color <= edge_23_color;
                        else color <= edge_23_color;         
                else  output_color <= RGB_TILE_BLACK;
            end
            else begin
                output_color <= RGB_TILE_BLACK;
            end
        end
    end
endmodule
