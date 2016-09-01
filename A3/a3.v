`timescale 1ns/1ns

module pc (input clk, input [31:0] nextPC, output [31:0] currPC);


reg [31:0] temp;
initial
   	temp = 31'h00400000;

//Modeling delay 
assign #10 currPC = temp;


//Modeling logic
always @(posedge clk)
	temp = nextPC;

endmodule


module add4(input [31:0] inval, output [31:0] outval);

assign #25 outval = inval + 4;

endmodule


module memory(input [29:0] read_addr, output [31:0] memout);

reg [31:0] temp;
reg [31:0] mymem [32'h00100000 : 32'h00100004];

//Modeling delay
assign #100 memout = temp;

initial
begin
	$readmemh("mem.in", mymem);
end

always @(*) 
begin
	temp = mymem[read_addr];

	if (memout == 0)
	begin
		$strobe("Found null op at addr %08x.", read_addr);
		$finish();
	end

end
endmodule


module test;

reg clk;
wire [31:0] curr_addr;
wire [31:0] next_addr;
wire [31:0] instruction;

pc thePC(clk, next_addr, curr_addr);
add4 theADDR(curr_addr, next_addr);
memory theMEM(curr_addr[31:2], instruction);

initial begin
	clk = 0;
end 

initial 
	$monitor($time, " in %m, currPC = %08x, nextPC = %08x, inst = %08x.", 
			curr_addr, next_addr, instruction);

always
	#250 clk = ~clk;



endmodule


