module next_turn(
    input rst,
    input [2-1:0] N,
    input [2-1:0] T,
    input statecombo_next_turn,
    output [2-1:0] result
    }
    // Q가 100에서 101으로 바뀌는 때가 posedge인가?
    always @ (posedge statecombo_next_turn or posedge rst) begin
        if (rst) T = 2'b0;
        else begin
            case (N)
                2'b00: if (statecombo_next_turn == 1) begin
                    if (T == 2'b00) T = 2'b01;
                    else if (T == 2'b01) T = 2'b00;
                end
                2'b01: if (statecombo_next_turn == 1) begin
                    if (T == 2'b00) T = 2'b01;
                    else if (T == 2'b01) T = 2'b10;
                    else if (T == 2'b10) T = 2'b00;
                end
                2'b10: if (statecombo_next_turn == 1) begin
                    if (T == 2'b00) T = 2'b01;
                    else if (T == 2'b01) T = 2'b10;
                    else if (T == 2'b10) T = 2'b11;
                    else if (T == 2'b11) T = 2'b00;
                end
            endcase
        end
    end
    assign result = T;
    // Q가 101에서 110으로 바뀌는 때가
endmodule
