//Yuxuan Huang
//CS320 Project1
`timescale  1us/1us

module control(
input plus,
input minus,
input alarm,
output reg c_plus,
output reg c_minus,
output reg a_plus,
output reg a_minus
);

initial begin
	c_plus=0;
	c_minus=0;
	a_plus=0;
	a_minus=0;
end

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
