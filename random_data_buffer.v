module random_data_buffer (
  input rst
  input random_data [120-1:0];
  output
);
  always @ (posedge rst or random_data) begin
      red_position_data_first = random_data[119-115:0];
      red_position_data_second = random_data[114-110:0];
      orange_position_data_first = random_data[109-105:0];
      orange_position_data_second = random_data[104-100:0]; 



   end

  

endmodule
