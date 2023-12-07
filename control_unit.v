module control_unit(
    input clk, c, 
    input [4-1:0] key, go, win,
    input [3:0] M,
    input rst,
    output reg A, B,
    output reg [3:0] N,
    output reg [2:0] M;
    );

    always @(posedge clk) begin
        if(rst) M <= 3'b000;
        else begin
            if(M=3'b110)
                B=1;
            else
                B=0;
            case(M)
                3'b000:
                    if(c == 0) M <= 3'b000;
                    else if(c == 1) M <= 3'b001;
                3'b001:
                    if(key == 4'hf) M <= 3'b001;
                    else begin
                        N=key;
                        M <= 3'b010;
                    end
                3'b010:
                    M <= M + 3'b001;
                3'b011:
                    if(key == 0) begin
                        A <= 1;
                        M <= 3'b011;
                    end
                    else begin
                        A <= 1;
                        M <= 3'b100;
                    end
                3'b100:
                    A <= 0;
                    if(go == 0) M <= 3'b101;
                    else if(go == 1) M <= 3'b110;
                3'b101:
                    M <= 3'b011;
                3'b110:
                    if(win == 0) M <= 3'b011;
                    else if(win == 1) M <= 3'b111;
                3'b111:
                    //logic for state 3'b111
            endcase
        end
    end
endmodule
