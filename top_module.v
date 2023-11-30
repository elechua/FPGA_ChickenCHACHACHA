module top_module(

    );
    
    control_unit cu(.clk(clk), .rst(rst), .c(C), .key(key), .go(go), .win(W), .M(M), .A(A), .B(B), .N(N), .M(M));
    data_path dp(.clk(clk), .statecombo_next_turn(statecombo_next_turn), .N(N), .position_data(position_data), .A(A), .B(B), .W(W), .go(go), .C(C));
    data_memory dm(); //
    random_generator rg(); // ��
endmodule
