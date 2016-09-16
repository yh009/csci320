//Yuxuan Huang
//CS320 Project1


//This module takes 4kHz clock and turn it into 1Hz clock output.
module oneHz(
input clk_4kHz,
output reg clk_1hz
);

reg [12:0]counter;

//initialize output and register
initial begin
	counter=0;
	clk_1hz=0;
end

//converting 4kHz to 1Hz by counting
always @(posedge clk_4kHz) begin
	if(counter==1999) begin
		clk_1hz<=~clk_1hz;
		counter<=0;
	end
	else begin
		counter<=counter+1;
	end
end


endmodule
	
		

