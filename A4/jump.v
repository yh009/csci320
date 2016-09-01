//Yuxuan Huang
`timescale 1ns/1ns
`include "mips.h"

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
	$readmemh("jumps.in", mymem);
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




module muxer(input[31:0] in1, input[31:0] in2, input select, output[31:0] out);

   assign #5 out=(select) ? in1: in2;

endmodule // muxer

module control(input[5:0] opcode, output reg jump);

   initial begin
      jump = 1'bx;

   end

   always @(*) begin
	case (opcode)
	  `J:begin
	     #15 jump=1;
	     $display("Jumped");
	  end
	  
	  default: #15 jump=0;

	endcase // case (opcode)
      

/* -----\/----- EXCLUDED -----\/-----
      if(opcode == `J)
	begin
	   jump ==1;

      else
	#15 jump ==0;
	   
	end
 -----/\----- EXCLUDED -----/\----- */
   end
endmodule // control


module test;
reg clk;
wire [31:0] curr_addr;
wire [31:0] pc_plus4;
wire [31:0] next_addr;
wire [31:0] instruction;
wire jump;

   pc thePC(clk, next_addr, curr_addr);
   add4 theADDR(curr_addr, pc_plus4);
   memory theMEM(curr_addr[31:2], instruction);


   control cn(instruction[31:26], jump);

   muxer mx({pc_plus4[31:28], instruction[25:0], 2'b00}, pc_plus4, jump, next_addr);

   initial begin
      clk=0;
   end

   initial begin
     $monitor($time, "addr %m, currPC= %08x, nextPC = %08x, inst = %08x.",
	      curr_addr, next_addr, instruction);
      #10000 $finish;
      
   end
   

   always #250 clk=~clk;
   
endmodule // test
