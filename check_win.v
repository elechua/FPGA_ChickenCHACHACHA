module check_win(
    input clk, rst,
    input [2-1:0] T,
    input [5-1:0] N,
    input B,
    output reg W,
    output [5-1:0] afterposition_data
    );
    
    wire da1, da2, da3, da4;
    wire [5-1:0] p1_cnt, p2_cnt, p3_cnt, p4_cnt;
    wire [5-1:0] out1, out2;
    wire [5-1:0] pos_data;
    wire stop_increase_1, stop_increase_2, stop_increase_3, stop_increase_4;
    
    assign stop_increase_1 = da1 & B;
    assign stop_increase_2 = da2 & B;
    assign stop_increase_3 = da3 & B;
    assign stop_increase_4 = da4 & B;
    
    decoder decoder(.T(T), .da1(da1), .da2(da2), .da3(da3), .da4(da4));
    cnt_player1 cnp1(.rst(rst), .B(B), .N(N) .p_da1(stop_increase_1), .p1_cnt(p1_cnt));
    cnt_player2 cnp2(.rst(rst), .B(B), .N(N) .p_da2(stop_increase_2), .p2_cnt(p2_cnt));
    cnt_player3 cnp3(.rst(rst), .B(B), .N(N) .p_da3(stop_increase_3), .p3_cnt(p3_cnt));
    cnt_player4 cnp4(.rst(rst), .B(B), .N(N) .p_da4(stop_increase_4), .p3_cnt(p4_cnt));
    three_to_one_MUX_upper upmux(.T(T), .p1_cnt(p1_cnt), .p2_cnt(p2_cnt), .p3_cnt(p3_cnt), .p4_cnt(p4_cnt), .out(out1));
    three_to_one_MUX_lower lowmux(.T(T), .N(N), .p1_cnt(p1_cnt), .p2_cnt(p2_cnt), .p3_cnt(p3_cnt), .p4_cnt(p4_cnt), .out(out2));
    which_one wo(.out1(out1), .out2(out2), .pos_data(pos_data));
    
    always @ (*) begin
        if (out1 == out2)
            W = 1;
        else
            W = 0;
    end
    assign afterposition_data = pos_data;
    
endmodule
