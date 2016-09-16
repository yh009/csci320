//Yuxuan Huang
//CS320 Project1

module oneHz(
input clk_4kHz,
output reg clk_1hz
);

reg [12:0]counter;

initial begin
	counter=0;
	clk_1hz=0;
end


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
	
		

