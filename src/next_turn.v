module next_turn(
    input rst,
    input [3-1:0] N,
    //input [2-1:0] T,
    input statecombo_next_turn,
    output [2-1:0] result
    );
    // Q가 100에서 101으로 바뀌는 때가 posedge인가?
    reg [2-1:0] t;
    
    always @ (posedge statecombo_next_turn or posedge rst) begin
        if (rst) t = 2'b0;
        else begin
            case (N)
                3'b010: if (statecombo_next_turn == 1) begin
                    if (t == 2'b00) t = 2'b01;
                    else if (t == 2'b01) t = 2'b00;
                end
                3'b011: if (statecombo_next_turn == 1) begin
                    if (t == 2'b00) t = 2'b01;
                    else if (t == 2'b01) t = 2'b10;
                    else if (t == 2'b10) t = 2'b00;
                end
                3'b100: if (statecombo_next_turn == 1) begin
                    if (t == 2'b00) t = 2'b01;
                    else if (t == 2'b01) t = 2'b10;
                    else if (t == 2'b10) t = 2'b11;
                    else if (t == 2'b11) t = 2'b00;
                end
            endcase
        end
    end
    assign result = t;
    // Q가 101에서 110으로 바뀌는 때가
endmodule
