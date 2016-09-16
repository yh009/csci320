//Yuxuan Huang
//CS320 Project1

//The timer module handles incrementing/decrementing of clock time. It takes three 1 bit input(c_plus,c_minus,one_Hz), 
//and output four 4 bit representation of the four clock digits(decimal value in binary form).
module timer(
input plus,
input minus,
input clk_1hz,
output reg [3:0]min1,min2,hr1,hr2
);

reg [5:0] counter=0;

//initialize outputs
initial begin
	min1=0;
	min2=0;
	hr1=0;
	hr2=0;
end


//handle natural time incrementing on clock
always @(posedge clk_1hz) begin
	if(counter==59) begin
		if(min1==9) begin
			if(min2==5) begin
				if(hr1==3) begin
					if(hr2==2) begin
						min1<=0;
						min2<=0;
						hr1<=0;
						hr2<=0;
						counter<=0;
					end
					else begin
						min1<=0;
						min2<=0;
						hr1<=hr1+1;
						counter<=0;
					end
				end
				else if(hr1==9) begin
					//if(hr2==1) begin
					min1<=0;
					min2<=0;
					hr1<=0;
					hr2<=hr2+1;
					counter<=0;
				end
				else begin
					min1<=0;
					min2<=0;
					hr1<=hr1+1;
					counter<=0;
				end
			end
			else begin
				min1<=0;
				min2<=min2+1;
				counter<=0;
			end
		end
		else begin
			min1<=min1+1;
			counter<=0;
		end
	end
	else begin
		counter<=counter+1;
	end
end

//handle time incrementing by plus button pressing on clock
always @(negedge plus) begin
	if(min1==9) begin
		if(min2==5) begin
			if(hr1==3) begin
				if(hr2==2) begin
					min1<=0;
					min2<=0;
					hr1<=0;
					hr2<=0;
				end
				else begin
					min1<=0;
					min2<=0;
					hr1<=hr1+1;
				end
			end
			else if(hr1==9) begin
				//if(hr2==1) begin
				min1<=0;
				min2<=0;
				hr1<=0;
				hr2<=hr2+1;
			end
			else begin
				min1<=0;
				min2<=0;
				hr1<=hr1+1;
			end
		end
		else begin
			min1<=0;
			min2<=min2+1;
		end
	end
	else min1<=min1+1;
end

//handle time decrementing by minus button pressing on clock
always @(negedge minus) begin
	if(min1==0) begin
		if(min2==0) begin
			if(hr1==0) begin
				if(hr2==0) begin
					min1<=9;
					min2<=5;
					hr1<=3;
					hr2<=2;
				end
				else begin
					min1<=9;
					min2<=5;
					hr1<=9;
					hr2<=hr2-1;
				end
			end
			else begin
				min1<=9;
				min2<=5;
				hr1<=hr1-1;
			end
		end
		else begin
			min1<=9;
			min2<=min2-1;
		end
	end
	else begin
		min1<=min1-1;
	end
end

endmodule



