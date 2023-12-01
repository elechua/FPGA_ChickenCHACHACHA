module random_generator(
    input rst,
    output reg [96-1:0] random_edge_order
    output reg [48-1:0] random_center_order
);
    // 각 타일 위치를 몇비트로 설정하지 -> 5 bit => 24*5=120 bit?
    reg [96-1:0] edge_orders [0:9]  // 일단은 10개만 
    reg [48-1:0] center_orders [0:9]
    reg [4:0] random_number;  // random number (0-9)
    
    initial begin
        edge_orders[0] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[1] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[2] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[3] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[4] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[5] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[6] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[7] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[8] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        edge_orders[9] = 96'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        
        center_orders[0] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[1] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[2] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[3] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[4] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[5] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[6] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[7] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[8] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        center_orders[9] = 48'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;

    end // 첫번째 6bit 첫번째 그림 위치. 두번째 6비트 두번째 그림 위치 등으로 하면 될거같은데

    assign random_number <= $urandom % 10;  // random number (0-9)

    assign random_edge_order <= edge_order[random_number];
    assign random_center_order <= center_order[random_number];
endmodule

