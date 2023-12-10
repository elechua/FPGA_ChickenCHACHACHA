module data_path(
    input clk, rst,
    input statecombo_next_turn,
    input [3-1:0] M,
    input [3-1:0] N,
    input [4-1:0] position_data,
    input A, D,
    output W, go, 
    output [5-1:0] tile_info,
    output [5-1:0] p1_cnt, p2_cnt, p3_cnt, p4_cnt
    );
    
    wire [2-1:0] T;
    wire [5-1:0] afterposition_data;
    
    check_same cs(.clk(clk), .position_data(position_data), .A(A), .result(go));
    check_win cw(.clk(clk), .M(M), .T(T), .D(D), .N(N), .W(W), .afterposition_data(afterposition_data), .p1_cnt(p1_cnt),  .p2_cnt(p2_cnt), .p3_cnt(p3_cnt), .p4_cnt(p4_cnt));
    next_turn nw(.rst(rst), .N(N), .statecombo_next_turn(statecombo_next_turn), .result(T));

    assign tile_info = afterposition_data;
    
endmodule
