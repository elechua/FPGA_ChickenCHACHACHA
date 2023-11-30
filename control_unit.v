module control_unit(
    input CLK, c, key, go, win, //key =  input, c = random generate 완료, go = 비교
    output reg A, B
    );
    reg [3-1:0] M;

    initial begin
    M <= 3'b000;
    end
    
    always @(posedge CLK) begin
        case(M)
            3'b000:
                if(c == 0) begin
                    M <= 3'b000;
                end
                else if(c == 1) begin
                    M <= 3'b001;
                end
            3'b001:
                if(key == 0) begin
                    M <= 3'b001;
                end
                else begin
                    M <= 3'b010;
                end
            3'b010:
                M <= M + 3'b001;
            3'b011:
                A <= 1;
                if(key == 0) begin
                    M <= 3'b011;
                end
                else if(key == 1) begin
                    M <= 3'b100;
                end
            3'b100:
                A <= 0;
                if(go == 0) begin
                    M <= 3'b101;
                end
                else if(go == 1) begin
                    M <= 3'b110;
                end
            3'b101:
                M <= 3'b011;
            3'b110:
                B <= 1;
                if(win == 0) begin
                    M <= 3'b011;
                end
                else if(win == 1) begin
                    M <= 3'b111;
                end
            3'b111:
                // Add necessary logic for state 3'b111
        endcase
    end
endmodule
