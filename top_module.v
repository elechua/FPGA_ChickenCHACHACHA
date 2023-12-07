module top_module(
        input clk, rst
        input [3-1:0] key_col
    );

        wire [4-1:0] key;
        wire A,
        wire [2-1:0] N;
        wire c, go, win;
        wire [96-1:0] random_edge_order;
        wire [48-1:0] random_center_order;
        wire [5-1:0] tile_info;
        wire [6-1:0] ADDR_IN;
        wire [4-1:0] position_data;
        reg statecombo_next_turn = ;
        
        control_unit cu(.clk(clk), .rst(rst), .c(C), .key(key), .go(go), .win(W), .M(M), .A(A), .B(B), .N(N), .M(M));
        data_path dp(.clk(clk), .rst(rst), .statecombo_next_turn(statecombo_next_turn), .N(N), .position_data(position_data), .A(A), .B(B), .W(W), .go(go), .C(C), .tile_infor(tile_info)); //tb 검증 완료
        two_to_one_MUX ttom(.key(key), .tile_info(tile_info), .A(A), .ADDR_IN(ADDR_IN)); //tb 검증 완료
        data_memory dm(.clk(clk), .WR(WR), .ADDR(ADDR_IN), .EDGE_DATA_IN(random_edge_order), .CENTER_DATA_IN(random_center_order), .DATA_OUT(position_data)); //tb 검증 완료 ; WR 어디서 입력 받을 건지 정해야 함
        random_generator rg(.rst(rst), .random_edge_order(random_edge_order), .random_center_order(random_center_order)); // 일단 첫번째 경우 출력하는 걸로 해놓음 ; 추후에 pseudo rng 설계해야 함
        display_module dm(.clk(clk), .rst(rst), .edge_order(random_edge_order), .center_order(random_center_order), .P1_pos(), .P2_pos(), .P3_pos(), P4_pos(),
                        .den(den), .hsync(hsync), .vsync(vsync), .R(R), .G(G), .B(B), .dclk(dclk), .disp_en(disp_en));
        keypad key(.clk(clk), .rst(rst), .key_col(key_col), .key_row(key_row), .key_value(key)); // 코드 맞음
    
endmodule
