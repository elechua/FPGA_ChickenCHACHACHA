module display_module(
    input clk, rst,
    input board,
    output den, hsync, vsync, 
    output [8-1:0] R, G, B,
    output dclk, disp_en
);
    wire [11-1:0] counter_h;
    wire [10-1:0] counter_v;
    tft_lcd_controller ctl(.clk(clk), .rst(rst), .counter_h(counter_h), .counter_v(counter_v), .disp_den(den), .disp_hsync(hsync), .disp_vsync(vsync), .disp_clk(dclk), .disp_enb(disp_en));

    reg [24-1:0] output_color;
    wire inDisplayArea;

    assign R = output_color[23:16];
    assign G = output_color[15:8];
    assign B = output_color[7:0];

    localparam TILE_RED = 4'b0000;
    localparam TILE_ORANGE = 4'b0001;
    localparam TILE_YELLOW = 4'b0010;
    localparam TILE_GREEN = 4'b0011;
    localparam TILE_BLUE = 4'b0100;
    localparam TILE_NAVY = 4'b0101;
    localparam TILE_PURPLE = 4'b0110;
    localparam TILE_WHITE = 4'b0111;
    localparam TILE_BLACK = 4'b1000;
    localparam TILE_SKYBLUE = 4'b1001;
    localparam TILE_FORESTGREEN = 4'b1010;
    localparam TILE_GRAY = 4'b1011;
    
    localparam BOARD_BLACK = 1;
    localparam BOARD_BROWN = 0;

    //edgetile 74*74px
    localparam [24-1:0] RGB_TILE_RED_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_ORANGE_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_YELLOW_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_GREEN_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_BLUE_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_NAVY_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_PURPLE_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_WHITE_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_BLACK_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_SKYBLUE_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_FORESTGREEN_ART = {8'd255, 8'd0, 8'd0};
    localparam [24-1:0] RGB_TILE_GRAY_ART = {8'd255, 8'd0, 8'd0};

   /*reg [74-1:0] TILE_ONE_ART [74-1:0];
    initial begin
            TILE_ONE_ART[0] =  74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[1] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[2] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[3] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[4] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[5] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[6] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[7] =  74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[8] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[9] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[10] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[11] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[12] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[13] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[14] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[15] =  74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[16] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[17] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[18] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[19] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[20] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[21] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[22] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[23] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[24] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[25] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[26] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[27] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[28] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[29] =  74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[30] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[31] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[32] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[33] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[34] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
           TILE_ONE_ART[35] =  74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
           TILE_ONE_ART[36] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[37] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
           TILE_ONE_ART[38] =  74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
           TILE_ONE_ART[39] =  74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
           TILE_ONE_ART[40] =  74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[41] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[42] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[43] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[44] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[45] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[46] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[47] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[48] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[49] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[50] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[51] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[52] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[53] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[54] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[55] =  74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[56] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[57] = 74'b0000000000_0000000000_0000000111_1111111111_1111110000_0000000000_0000000000_0000;
            TILE_ONE_ART[58] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[59] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[60] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[61] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[62] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[63] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[64] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[65] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[66] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[67] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[68] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[69] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[70] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[71] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
            TILE_ONE_ART[72] = 74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
           TILE_ONE_ART[73] =  74'b0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000000000_0000;
          end */

    //localparam RGB_BORDERLINE = 8'b;
    //localparam RGB_RIGHTEDGE = 8'b;
    //localparam RGB_GAPSPACE = 8'b;

    reg [8-1:0] TILE_ONE_ART [8-1:0];
    initial begin
        TILE_ONE_ART[0] = 8'b00000000;
        TILE_ONE_ART[1] = 8'b00000000;
        TILE_ONE_ART[2] = 8'b00010000;
        TILE_ONE_ART[3] = 8'b00010000;
        TILE_ONE_ART[4] = 8'b00010000;
        TILE_ONE_ART[5] = 8'b00010000;
        TILE_ONE_ART[6] = 8'b00000000;
        TILE_ONE_ART[7] = 8'b00000000;
    end
    
    reg [3-1:0] counter_row; // the square the pixels are currently on
    reg [4-1:0] counter_col;
    reg [6:0] square_x; // coords of the counter within the board square
    reg [6:0] square_y;
    reg [4:0] art_x; // coords on 8x8 artwork grid within the square
    reg [4:0] art_y;

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
    assign in_board = (square_x >= 3 && square_x <= 77 && square_y >= 3 && square_y <= 77);

    always @ (posedge clk or posedge rst) begin
        if(rst) output_color <= {8'd0, 8'd0, 8'd0};
        else begin
            if (in_border) begin
                if (counter_row == 2 && counter_col == 2 || counter_row == 2 && counter_col == 3 || counter_row == 2 && counter_col == 4 || counter_row == 2 && counter_col == 5 || counter_row == 2 && counter_col == 6 || counter_row == 2 && counter_col == 7 ||
                    counter_row == 5 && counter_col == 2 || counter_row == 5 && counter_col == 3 || counter_row == 5 && counter_col == 4 || counter_row == 5 && counter_col == 5 || counter_row == 5 && counter_col == 6 || counter_row == 5 && counter_col == 7 ||
                    counter_col == 9)
                    output_color <= {8'd0, 8'd0, 8'd0};
                else
                    output_color <= {8'd255, 8'd255, 8'd255};
            end
            else if (in_board) begin
                if (counter_row == 3 && counter_col == 2) begin
                    if (TILE_ONE_ART[art_y][art_x]) output_color <= {8'd255, 8'd255, 8'd255};
                    else output_color <= {8'd0, 8'd0, 8'd0};
                end
                else output_color <= {8'd0, 8'd0, 8'd0};
            end
            else begin
                output_color <= {8'd000, 8'd000, 8'd000};
            end
        end
    end
endmodule
