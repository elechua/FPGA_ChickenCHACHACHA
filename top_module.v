module top_module(
        input clk, rst
        input [3-1:0] key_col
    );

        wire [4-1:0] key;
        wire c, go, win;
        wire [96-1:0] random_edge_order;
        wire [48-1:0] random_center_order;
        
        control_unit cu(.clk(clk), .rst(rst), .c(C), .key(key), .go(go), .win(W), .M(M), .A(A), .B(B), .N(N), .M(M));
        data_path dp(.clk(clk), .rst(rst), .statecombo_next_turn(statecombo_next_turn), .N(N), .position_data(position_data), .A(A), .B(B), .W(W), .go(go), .C(C), .tile_infor(tile_info));
        two_to_one_MUX ttom(.key(key), .tile_info(tile_info), .A(A), .ADDR_IN(ADDR_IN)); //이거 수정 필요함..
        data_memory dm(.clk(clk), .WR(WR), .ADDR(ADDR_IN), .EDGE_DATA_IN(random_edge_order), .CENTER_DATA_IN(random_center_order), .DATA_OUT(DATA_OUT));
        random_generator rg(.rst(rst), .random_edge_order(random_edge_order), .random_center_order(random_center_order)); //얘도..
        display_module dm(.clk(clk), .rst(rst), .edge_order(random_edge_order), .center_order(random_center_order), .P1_pos(), .P2_pos(), .P3_pos(), P4_pos(),
                        .den(den), .hsync(hsync), .vsync(vsync), .R(R), .G(G), .B(B), .dclk(dclk), .disp_en(disp_en));
        keypad key(.clk(clk), .rst(rst), .key_col(key_col), .key_row(key_row), .key_value(key)); // 코드 맞음
    
endmodule
