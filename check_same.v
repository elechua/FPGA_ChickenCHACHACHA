module check_same(
    input clk,
    input [4-1:0] position_data,
    input A,
    output reg result
    );
    reg [4-1:0] edge_tile, center_tile;
    
    always @ (posedge clk) begin
        if (A==1) begin
            edge_tile = position_data;
        end
        else if (A==0) begin
            center_tile = position_data;
        end
    end
    
    always @ (edge_tile, center_tile) begin
        if (edge_tile == center_tile) begin
            result = 1;
        end
        else begin
            result = 0;
        end
    end
endmodule
