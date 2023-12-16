module control_unit(
    input clk, rst,
    input [4-1:0] key, 
    input c, go, win,
    output reg A, D, WR,
    output reg [3-1:0] M
    );
    initial begin
        M <= 3'b000;
    end
    always @(posedge clk) begin
        if(rst) M <= 3'b000;
        else begin
            if(M==3'b000 | M==3'b001)
                WR <= 1;
            else
                WR <= 0;
            case(M)
                3'b000:
                    if(c == 0) M <= 3'b000;
                    else M <= 3'b001;
                3'b001:
                    if(key <= 4'h1 | key >= 4'h5) begin
                        M <= 3'b001;
                    end
                    else if (key >= 4'h2 & key <= 4'h4) begin
                        M <= 3'b010;
                    end
                3'b010:
                    if(c == 0) begin
                    M <= 3'b010;
                    end
                    else begin
                    M <= 3'b011;
                    end
                3'b011:
                    if(key == 0) begin
                        A <= 1;
                        M <= 3'b011;
                    end
                    else begin
                        A <= 0;
                        M <= 3'b100;
                    end
                3'b100:
                    if(go == 0) begin
                        M <= 3'b101;
                        A <= 0;
                    end
                    else if(go == 1) begin
                        M <= 3'b110;
                        A <= 0;
                    end
                3'b101:
                    if(c == 0) M <= 3'b101;
                    else M <= 3'b011;
                3'b110:
                    if(win == 0) begin
                        if(c == 0) M <= 3'b110;
                        else if (c == 1) M <= 3'b011;
                    end
                    else if(win == 1) M <= 3'b111;
                3'b111:
                    M <= 3'b111;
                    //logic for state 3'b111
            endcase
        end
    end

    always @ ( M or go ) begin
        if ( M == 100 && go == 1 )
            D <= 1;
        else
            D <= 0;
    end
    
endmodule
