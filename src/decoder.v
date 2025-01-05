module decoder(
    input [2-1:0] T,
    output reg da1, da2, da3, da4
    );
    
    always @ (*) begin
        if (T == 2'b00) begin
            da1 = 1;
            da2 = 0;
            da3 = 0;
            da4 = 0;
        end    
        if (T == 2'b01) begin
            da1 = 0;
            da2 = 1;
            da3 = 0;
            da4 = 0;
        end    
        if (T == 2'b10) begin
            da1 = 0;
            da2 = 0;
            da3 = 1;
            da4 = 0;
        end    
        if (T == 2'b11) begin
            da1 = 0;
            da2 = 0;
            da3 = 0;
            da4 = 1;
        end      
    end
endmodule
