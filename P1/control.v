//Yuxuan Huang
//CS320 Project1
`timescale  1us/1us

//The control module helps to distinguish plus/minus signals for timer and alarm. It takes three 1 bit input(plus, minus, alarm) 
//and output four 1 bit output(c_plus,c_minus,a_plus,a_minus). 
module control(
input plus,
input minus,
input alarm,
output reg c_plus,
output reg c_minus,
output reg a_plus,
output reg a_minus
);

//initialize outputs
initial begin
	c_plus=0;
	c_minus=0;
	a_plus=0;
	a_minus=0;
end


//decides whether clock or alarm the plus/minus go to 
always @(*) begin
	if (alarm==1)begin
			if (plus==1)begin
				//always @(negedge plus)begin
					a_plus<=1;
					//#10
					//a_plus<=0;
				//end
		        end 
		        else if (minus==1)begin
				//always @(negedge minus)begin
					a_minus<=1;
					//#10
					//a_plus<=0;
				//end
		        end 
		        else begin
				a_plus<=0;
				a_minus<=0;
				c_plus<=0;
				c_minus<=0;
		        end
	end
	else begin
			if (plus==1)begin
				//always @(negedge plus)begin
					c_plus=1;
				//end
		 	end 
			else if (minus==1)begin
				//always @(negedge minus)begin
					c_minus=1;
				//end
			end 
			else begin
				c_plus=0;
				c_minus=0;
				a_plus=0;
				a_minus=0;
			end
	end

end


endmodule
