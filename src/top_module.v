module top_module(
        input clk, rst,
        input [3-1:0] key_col,
        output [4-1:0] key_row,
        output den, hsync, vsync, 
        output [8-1:0] R, G, B,
        output dclk, disp_en
    );

        wire [4-1:0] key;
        wire clk_keypad;
        wire A, D, W, C, WR;
        wire [3-1:0] M;
        wire [3-1:0] N;
        wire go, win;
        wire [96-1:0] random_edge_order;
        wire [48-1:0] random_center_order;
        wire [5-1:0] tile_info;
        wire [6-1:0] ADDR_IN;
        wire [4-1:0] position_data;
        wire statecombo_next_turn;
        wire [5-1:0] p1_cnt, p2_cnt, p3_cnt, p4_cnt;
        assign statecombo_next_turn = M[2] & (~M[1]) & M[0];
        
        clk_oscillator co(.clk(clk), .rst(rst), .clk_keypad(clk_keypad));
        C_controller cc(.clk(clk), .rst(rst), .M(M), .C(C));
        control_unit cu(.clk(clk), .rst(rst), .c(C), .key(key), .go(go), .win(W), .A(A), .D(D), .WR(WR), .M(M)); //text lcd 출력
        N_DFF ff(.clk(clk), .key(key), .M(M), .N(N));
        data_path dp(.clk(clk), .rst(rst), .statecombo_next_turn(statecombo_next_turn), .N(N), .position_data(position_data), .A(A), .D(D), .W(W), .go(go), .tile_info(tile_info),
                     .p1_cnt(p1_cnt),  .p2_cnt(p2_cnt), .p3_cnt(p3_cnt), .p4_cnt(p4_cnt), .M(M)); //tb 검증 완료 ;
        two_to_one_MUX ttom(.key(key), .tile_info(tile_info), .A(A), .ADDR_IN(ADDR_IN)); //tb 검증 완료
        data_memory dmem(.clk(clk), .WR(WR), .ADDR(ADDR_IN), .EDGE_DATA_IN(random_edge_order), .CENTER_DATA_IN(random_center_order), .DATA_OUT(position_data)); //tb 검증 완료 ;
        random_generator rg(.rst(rst), .random_edge_order(random_edge_order), .random_center_order(random_center_order)); // 일단 첫번째 경우 출력하는 걸로 해놓음 ; 추후에 pseudo rng 설계해야 함
        display_module dmod(.clk(clk), .rst(rst), .M(M), .T(T), .edge_order(random_edge_order), .center_order(random_center_order), .P1_pos(p1_cnt), .P2_pos(p2_cnt), .P3_pos(p3_cnt), .P4_pos(p4_cnt),
                            .den(den), .hsync(hsync), .vsync(vsync), .R(R), .G(G), .B(B), .dclk(dclk), .disp_en(disp_en)); // 완성 ; 뒤집은 타일 몇 초 동안 보여주는 카운터 기능 추가해야 함
        keypad keypad(.clk(clk_keypad), .rst(rst), .key_col(key_col), .key_row(key_row), .key_value(key)); // tb 검증 완료
    
endmodule
