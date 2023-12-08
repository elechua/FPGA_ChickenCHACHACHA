module control_unit(
    input clk, rst,
    input [4-1:0] key, 
    input c, go, win,
    output reg A, B, WR,
    output reg [2:0] M
    );

    always @(posedge clk) begin
        if(rst) M <= 3'b000;
        else begin
            if(M==3'b110)
                B=1;
            else
                B=0;
            case(M)
                3'b000:
                    WR <= 1;
                    begin
                        if(c == 0) M <= 3'b000;
                        else M <= 3'b001;
                    end
                3'b001:
                    if(key <= 4'h1 | key >= 4'h5) M <= 3'b001;
                    else begin
                        M <= 3'b010;
                    end
                3'b010:
                    WR <= 0;
                    begin
                        if(c == 0) M <= 3'b010;
                        else M <= 3'b011;
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
                    if(c == 0) M <= 3'b011;
                    else M <= 3'b110;
                3'b110:
                    if(win == 0) M <= 3'b011;
                    else if(win == 1) M <= 3'b111;
                3'b111:
                    M <= 3'b111;
                    //logic for state 3'b111
            endcase
        end
    end
endmodule
