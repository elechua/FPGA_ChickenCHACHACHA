module random_generator(
    output reg [0:
    );
    initial begin
    a = $urandom_rang(0, 10)

        case (a)

        endcase
    end
endmodule


                
module random_generator(
    output reg [23:0] orders [0:9]  // 일단은 10개만
);

    reg [31:0] seed;
    reg [4:0] random_number;  // 5-bit output for 20 possible orders
    
    initial begin
        orders[0] = 23'b00000_0000000_00000_0000000;
        orders[1] = 23'b00000_0000000_00000_0000000;
        orders[2] = 23'b00000_0000000_00000_0000000;
        orders[3] = 23'b00000_0000000_00000_0000000;
        orders[4] = 23'b00000_0000000_00000_0000000;
        orders[5] = 23'b00000_0000000_00000_0000000;
        orders[6] = 23'b00000_0000000_00000_0000000;
        orders[7] = 23'b00000_0000000_00000_0000000;
        orders[8] = 23'b00000_0000000_00000_0000000;
        orders[9] = 23'b00000_0000000_00000_0000000;
    end

    always @(posedge seed) begin
        $urandom(seed);  // Update the seed with a random value
        random_number <= seed % 10;  // order가 10개 있어서 %10
    end

endmodule

