//Yuxuan Huang
//CS320 Project1
`timescale 1us/1us

module fourkHz(
input clk,
output fourkHz
);
//reg clk;

initial begin
	clk=1'b0;
end

always begin
	#125 clk=~clk;
end

assign fourkHz=clk;

endmodule

	
