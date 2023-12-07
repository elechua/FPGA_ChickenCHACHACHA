module data_path(
    input clk, rst,
    input statecombo_next_turn,
    input [2-1:0] N,
    input [4-1:0] position_data,
    input A, B,
    output W, go, C, 
    output reg [5-1:0] tile_info
    );
    
    reg [2-1:0] T;
    
    check_same cs(.clk(clk), .position_data(position_data), .A(A), .result(go));
    check_win cw(.T(T), .B(B), .N(N), .W(W), .afterposition_data(afterposition_data));
    next_turn nw(.rst(rst), .N(N), .statecombo_next_turn(statecombo_next_turn), .result(T));

    assign tile_info = afterposition_data;
    
endmodule
