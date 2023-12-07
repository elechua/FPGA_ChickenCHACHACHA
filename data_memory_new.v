module data_memory_new(
    input clk, WR,
    input [6-1:0] ADDR,
    input [96-1:0] EDGE_DATA_IN,
    input [48-1:0] CENTER_DATA_IN,
    input [4-1:0] DATA_OUT
    );
    reg [4-1:0] SRAM [36-1:0];
   
    always @ (posedge clk) begin
        if (WR)
            SRAM[0] = EDGE_DATA_IN[95:92];
            SRAM[1] = EDGE_DATA_IN[92:88];
            SRAM[2] = EDGE_DATA_IN[87:84];
            SRAM[3] = EDGE_DATA_IN[83:80];
            SRAM[4] = EDGE_DATA_IN[79:76];
            SRAM[5] = EDGE_DATA_IN[75:72];
            SRAM[6] = EDGE_DATA_IN[71:68];
            SRAM[7] = EDGE_DATA_IN[67:64];
            SRAM[8] = EDGE_DATA_IN[63:60];
            SRAM[9] = EDGE_DATA_IN[59:56];
            SRAM[10] = EDGE_DATA_IN[55:52];
            SRAM[11] = EDGE_DATA_IN[51:48];
            SRAM[12] = EDGE_DATA_IN[47:44];
            SRAM[13] = EDGE_DATA_IN[43:40];
            SRAM[14] = EDGE_DATA_IN[39:36];
            SRAM[15] = EDGE_DATA_IN[35:32];
            SRAM[16] = EDGE_DATA_IN[31:28];
            SRAM[17] = EDGE_DATA_IN[27:24];
            SRAM[18] = EDGE_DATA_IN[23:20];
            SRAM[19] = EDGE_DATA_IN[19:16];
            SRAM[20] = EDGE_DATA_IN[15:12];
            SRAM[21] = EDGE_DATA_IN[11:8];
            SRAM[22] = EDGE_DATA_IN[7:4];
            SRAM[23] = EDGE_DATA_IN[3:0];
            SRAM[24] = CENTER_DATA_IN[47:44];
            SRAM[25] = CENTER_DATA_IN[43:40];
            SRAM[26] = CENTER_DATA_IN[39:36];
            SRAM[27] = CENTER_DATA_IN[35:32];
            SRAM[28] = CENTER_DATA_IN[31:28];
            SRAM[29] = CENTER_DATA_IN[27:24];
            SRAM[30] = CENTER_DATA_IN[23:20];
            SRAM[31] = CENTER_DATA_IN[19:16];
            SRAM[32] = CENTER_DATA_IN[15:12];
            SRAM[33] = CENTER_DATA_IN[11:8];
            SRAM[34] = CENTER_DATA_IN[7:4];
            SRAM[35] = CENTER_DATA_IN[3:0];
    end
    assign DATA_OUT = SRAM[ADDR];
endmodule
