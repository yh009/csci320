//Yuxuan Huang
`timescale 1ns/1ns
`include "mips.h"

module control(
input[5:0] opcode,
output reg RegDst, 
output reg Jump,
output reg Branch,
output reg MemRead,
output reg MemToReg,
output reg[3:0] ALUop,
output reg RegWrite,
output reg ALUSrc,
output reg MemWrite
);

   initial begin
      RegDst=1'bx;Jump=1'bx;Branch=1'bx;MemRead=1'bx;MemToReg=1'bx;ALUop=`ALU_undef;RegWrite=1'bx;ALUSrc=1'bx;MemWrite=1'bx;

   end

   always @(*) begin
	case (opcode)
	  `J:begin
	     #15 RegDst=1'bx;Jump=1;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_undef;RegWrite=0;ALUSrc=1'bx;MemWrite=0;
	     $display("J");
	  end
	  `JR:begin
	     #15 RegDst=1'bx;Jump=1;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_undef;RegWrite=0;ALUSrc=1'bx;MemWrite=0;
	     $display("JR");
	  end
	  `JAL:begin
	     #15 RegDst=1'bx;Jump=1;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_undef;RegWrite=0;ALUSrc=1'bx;MemWrite=0;
 	     $display("JAL");
	  end
	  `ADD:begin
	     #15 RegDst=1;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_add;RegWrite=1;ALUSrc=0;MemWrite=0;
	     $display("ADD");
	  end
	  `SUB:begin
	     #15 RegDst=1;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_sub;RegWrite=1;ALUSrc=0;MemWrite=0;
	     $display("SUB");
	  end
	  `AND:begin
	     #15 RegDst=1;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_AND;RegWrite=1;ALUSrc=0;MemWrite=0;
	     $display("AND");
	  end
	  `OR:begin
	     #15 RegDst=1;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_OR;RegWrite=1;ALUSrc=0;MemWrite=0;
	     $display("OR");
	  end
	  `SLT:begin
	     #15 RegDst=1;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_slt;RegWrite=1;ALUSrc=0;MemWrite=0;
	     $display("SLT");
	  end
	  `ADDI:begin
	     #15 RegDst=0;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_add;RegWrite=1;ALUSrc=1;MemWrite=0;
	     $display("ADDI");
	  end
	  `ORI:begin
	     #15 RegDst=0;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_OR;RegWrite=1;ALUSrc=1;MemWrite=0;
	     $display("ORI");
	  end
	  `LW:begin
	     #15 RegDst=0;Jump=0;Branch=0;MemRead=1;MemToReg=1;ALUop=`ALU_add;RegWrite=1;ALUSrc=1;MemWrite=0;
	     $display("LW");
	  end
	  `SW:begin
	     #15 RegDst=0;Jump=0;Branch=0;MemRead=0;MemToReg=0;ALUop=`ALU_add;RegWrite=0;ALUSrc=1;MemWrite=1;
	     $display("SW");
	  end
	  `BEQ:begin
	     #15 RegDst=1'bx;Jump=0;Branch=1;MemRead=0;MemToReg=0;ALUop=`ALU_sub;RegWrite=0;ALUSrc=0;MemWrite=0;
	     $display("BEQ");
	  end
	  `BNE:begin
	     #15 RegDst=1'bx;Jump=0;Branch=1;MemRead=0;MemToReg=0;ALUop=`ALU_sub;RegWrite=0;ALUSrc=0;MemWrite=0;
	     $display("BNE");
	  end

	  
	  //default: #15 RegDst=0;Jump=0;Branch=o;MemRead=0;MemToReg=0;ALUop=`ALU_undef;RegWrite=0;ALUSrc=0;MemWrite=0;

	endcase // case (opcode)
      


   end
endmodule // control


module test;
//reg clk;
reg[5:0] instr;
wire RegDst; 
wire Jump;
wire Branch;
wire MemRead;
wire MemToReg;
wire[3:0] ALUop;
wire RegWrite;
wire ALUSrc;
wire MemWrite;

	control myControl(instr,RegDst,Jump,Branch,MemRead,MemToReg,ALUop,RegWrite,ALUSrc,MemWrite);

	initial begin
		#10 instr=`ADD;
		#20 instr=`BNE;
		#20 instr=`SUB;
		#20 instr=`JR;
		#20 instr=`AND;
		#20 instr=`OR;
		#20 instr=`SLT;
		#20 instr=`JAL;
		#20 instr=`ADDI;
		#20 instr=`ORI;
		#20 instr=`LW;
		#20 instr=`SW;
		#20 instr=`BEQ;
		#20 instr=`J;
		
		
		//#100 $finish;
	end

	initial begin
		$monitor($time, " RegDst=%b,Jump=%b,Branch=%b,MemRead=%b,MemToReg=%b,ALUop=%b,RegWrite=%b,ALUSrc=%b,MemWrite=%b.",
			 RegDst,Jump,Branch,MemRead,MemToReg,ALUop,RegWrite,ALUSrc,MemWrite);
		#10000 $finish;
	end
   //initial begin
      //clk=0;
   //end

   //always #250 clk=~clk;


endmodule

