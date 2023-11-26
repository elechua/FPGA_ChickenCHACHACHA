module data_path(
    input clk,
    input statecombo_next_turn,
    input [2-1:0] N,
    input [4-1:0] position_data,
    input A, B
    output W, go, C
    );
    
    wire same_result;
    reg [2-1:0] T;
    
    check_same cs(.clk(clk), .position_data(position_data), .A(A), .result(same_result));
    check_win cw(.clk(clk), .T(T), .B(B), .W(W), .afterposition_data(afterposition_data));
    next_turn nw(.clk(clk), .T(T), .N(N), .statecombo_next_turn(statecombo_next_turn), .result(next_turn_result));
    
    
endmodule
