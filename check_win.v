module check_win(
    input clk,
    input [2-1:0] T,
    input B,
    output reg W,
    output [5-1:0] afterposition_data
    );
    
    wire da1, da2, da3, da4;
    wire stop_increase;
    wire [5-1:0] p1_cnt, p2_cnt, p3_cnt;
    wire [5-1:0] out1, out2;
    wire [5-1:0] pos_data;
    
    decoder decoder(.T(T), .da1(da1), .da2(da2), .da3(da3), .da4(da4));
    two_to_one_MUX mux(.B(B), .stop_increase(stop_increase));
    cnt_player1 cnp1(.p_da1(da1&stop_incrase), .p1_cnt(p1_cnt));
    cnt_player2 cnp2(.p_da2(da2&stop_incrase), .p2_cnt(p2_cnt));
    cnt_player3 cnp3(.p_da3(da3&stop_incrase), .p3_cnt(p3_cnt));
    three_to_one_MUX_upper upmux(.T(T), .p1_cnt(p1_cnt), .p2_cnt(p2_cnt), .p3_cnt(p3_cnt), .out(out1));
    three_to_one_MUX_lower lowmux(.T(T), .p1_cnt(p1_cnt), .p2_cnt(p2_cnt), .p3_cnt(p3_cnt), .out(out2));
    which_one wo(.out1(out1), .out2(out2), .pos_data(pos_data));
    
    always @ (*) begin
        if (out1 == out2)
            W = 1;
        else
            W = 0;
    end
    assign afterposition_data = pos_data;
    
endmodule