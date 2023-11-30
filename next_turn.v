module next_turn(
    input clk, 
    input [2-1:0] N,
    input [2-1:0] T,
    input statecombo_next_turn,
    output [2-1:0] result
    // Q가 100에서 101으로 바뀌는 때가 posedge인가?

    always @ (posedge clk) begin
        case (N)
            2'b00: if (statecombo_next_turn == 1)
                if (T == 2'b00) T = 2'b01;
                else if (T == 2'b01) T = 2'b00;
            2'b01: if (statecombo_next_turn == 1)
            2'b10: if (statecombo_next_turn == 1)
        endcase
    end
    
    // Q가 101에서 110으로 바뀌는 때가
    );
endmodule
