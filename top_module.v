module top_module(

    );
    
    control_unit cu(.clk(clk), .rst(rst), .c(C), .key(key), .go(go), .win(W), .M(M), .A(A), .B(B), .N(N), .M(M));
    data_path dp(.clk(clk), .statecombo_next_turn(statecombo_next_turn), .N(N), .position_data(position_data), .A(A), .B(B), .W(W), .go(go), .C(C), .tile_infor(tile_info));
    two_to_one_MUX ttom(.key(key), .tile_info(tile_info), .A(A), .ADDR_IN(ADDR_IN)); //이거 수정 필요함..
    data_memory dm(.clk(clk), .WR(WR), .ADDR(ADDR_IN), .DATA_IN(DATA_IN), .DATA_OUT(DATA_OUT)); //얘도 아직..
    random_generator rg(.random_edge_order(random_edge_order), .random_center_order(random_center_order)); //얘도..
    display_module dm(.clk(clk), .rst(rst), .edge_order(random_edge_order), .center_order(random_center_order), .P1_pos(), .P2_pos(), .P3_pos(), P4_pos(), .den(den), .hsync(hsync), .vsync(vsync), .R(R), .G(G), .B(B), .dclk(dclk), .disp_en(disp_en));
    
    
endmodule
