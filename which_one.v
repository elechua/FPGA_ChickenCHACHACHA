module which_one(
    input [5-1:0] out1, out2,
    output reg [5-1:0] pos_data
    );
    always @ (*) begin
        if (out2 - out1 == 1 | (out1==5'd23 && out2==5'd0))
            pos_data = pos_data + 2;
        else
            pos_data = pos_data + 1;
    end
endmodule
