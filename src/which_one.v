module which_one(
    input [5-1:0] out1, out2,
    output reg [5-1:0] pos_data
    );
    always @ (*) begin
        if (out2 - out1 == 1)
            pos_data = out1 + 2;
        else if (out1==5'd23) begin 
            if (out2 == 5'd0)
                pos_data = 5'd1;
            else
                pos_data = 5'd0;  
        end
        else
            pos_data = out1 + 5'd1;
    end
endmodule
