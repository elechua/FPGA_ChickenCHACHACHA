module two_to_one_MUX(
    input B,
    output reg stop_increase
);
    always @ (*) begin
        case(B)
            1'b0: stop_increase = 0;
            1'b1: stop_increase = 1;
        endcase
    end
endmodule