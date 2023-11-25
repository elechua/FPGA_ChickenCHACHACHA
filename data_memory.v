module data_memory(
    input clk, WR,
    input [4-1:0] ADDR,
    input [4-1:0] DATA_IN,
    input [4-1:0] DATA_OUT
    );
    reg [4-1:0] SRAM [16-1:0];
    
    always @ (posedge clk) begin
        if (WR) SRAM[ADDR] <= DATA_IN;
    end
    assign DATA_OUT = SRAM[ADDR];
endmodule
