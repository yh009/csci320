//Yuxuan Huang
//CS320 Project1

module display(
input [3:0] c_min1,c_min2,c_hr1,c_hr2,
input [3:0] a_min1,a_min2,a_hr1,a_hr2,
input alarm,
output reg[6:0] LED1,
output reg[6:0] LED2,
output reg[6:0] LED3,
output reg[6:0] LED4
);


parameter zero=7'b0000001;
parameter one=7'b1001111;
parameter two=7'b0010010;
parameter three=7'b0000110;
parameter four=7'b1001100;
parameter five=7'b0100100;
parameter six=7'b0100000;
parameter seven=7'b0001111;
parameter eight=7'b0000000;
parameter nine=7'b0000100;
parameter off=7'b1111111;
reg [6:0]clk1=0;
reg [6:0]clk2=0;
reg [6:0]clk3=0;
reg [6:0]clk4=0;
reg [6:0]a1=0;
reg [6:0]a2=0;
reg [6:0]a3=0;
reg [6:0]a4=0;


always @(*) begin
	case(alarm)
		0:begin
			LED1<=clk4;
		  	LED2<=clk3;
		  	LED3<=clk2;
		  	LED4<=clk1;
		  end
		1:begin
			LED1<=a4;
		  	LED2<=a3;
		  	LED3<=a2;
		  	LED4<=a1;
		  end
		default: begin
			LED1<=clk4;
		  	LED2<=clk3;
		  	LED3<=clk2;
		  	LED4<=clk1;
		  end
	endcase
	
end

always @(*) begin
	case(c_min1)
		0:clk1=zero;
		1:clk1=one;
		2:clk1=two;
		3:clk1=three;
		4:clk1=four;
		5:clk1=five;
		6:clk1=six;
		7:clk1=seven;
		8:clk1=eight;
		9:clk1=nine;
		default:clk1=off;
	endcase
	case(c_min2)
		0:clk2=zero;
		1:clk2=one;
		2:clk2=two;
		3:clk2=three;
		4:clk2=four;
		5:clk2=five;
		6:clk2=six;
		7:clk2=seven;
		8:clk2=eight;
		9:clk2=nine;
		default:clk2=off;
	endcase
	case(c_hr1)
		0:clk3=zero;
		1:clk3=one;
		2:clk3=two;
		3:clk3=three;
		4:clk3=four;
		5:clk3=five;
		6:clk3=six;
		7:clk3=seven;
		8:clk3=eight;
		9:clk3=nine;
		default:clk3=off;
	endcase
	case(c_hr2)
		0:clk4=zero;
		1:clk4=one;
		2:clk4=two;
		3:clk4=three;
		4:clk4=four;
		5:clk4=five;
		6:clk4=six;
		7:clk4=seven;
		8:clk4=eight;
		9:clk4=nine;
		default:clk4=off;
	endcase
	case(a_min1)
		0:a1=zero;
		1:a1=one;
		2:a1=two;
		3:a1=three;
		4:a1=four;
		5:a1=five;
		6:a1=six;
		7:a1=seven;
		8:a1=eight;
		9:a1=nine;
		default:a1=off;
	endcase
	case(a_min2)
		0:a2=zero;
		1:a2=one;
		2:a2=two;
		3:a2=three;
		4:a2=four;
		5:a2=five;
		6:a2=six;
		7:a2=seven;
		8:a2=eight;
		9:a2=nine;
		default:a2=off;
	endcase
	case(a_hr1)
		0:a3=zero;
		1:a3=one;
		2:a3=two;
		3:a3=three;
		4:a3=four;
		5:a3=five;
		6:a3=six;
		7:a3=seven;
		8:a3=eight;
		9:a3=nine;
		default:a3=off;
	endcase
	case(a_hr2)
		0:a4=zero;
		1:a4=one;
		2:a4=two;
		3:a4=three;
		4:a4=four;
		5:a4=five;
		6:a4=six;
		7:a4=seven;
		8:a4=eight;
		9:a4=nine;
		default:a4=off;
	endcase
end


endmodule
