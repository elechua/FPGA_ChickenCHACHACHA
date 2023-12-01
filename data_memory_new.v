module data_memory_new(
    input clk, WR,
    input [4-1:0] ADDR,
    input [120-1:0] EDGE_DATA_IN,
    input [60-1:0] CENTER_DATA_IN,
    input [4-1:0] DATA_OUT
    );
    reg [5-1:0] SRAM [36-1:0];
    inital begin
        SRAM[0]
    end

    
    always @ (posedge clk) begin
        if (WR) SRAM[ADDR] <= DATA_IN;
    end
    assign DATA_OUT = SRAM[ADDR];
endmodule
