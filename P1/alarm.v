//Yuxuan Huang
//CS320 Project1
//`timescale  1us/1us

module alarm(
input plus,
input minus,
input alarm,
//input off,
input [3:0]c_min1,c_min2,c_hr1,c_hr2,
//input clk,
//output buzzer,
output reg alarm_on,
output reg alarm_trig,
output reg [3:0]min1,min2,hr1,hr2
);


//reg alarm_set;

initial begin
	min1=0;
	min2=0;
	hr1=0;
	hr2=0;
	alarm_on=0;
	alarm_trig=0;
end

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

always @(posedge alarm) begin
	alarm_on<=1;
end

always @(*) begin
	if (c_min1==min1 && c_min2==min2 && c_hr1==hr1 && c_hr2==hr2) begin
		alarm_trig<=1;
	end
	else begin
		alarm_trig<=0;
	end
end



	
	
endmodule 	     
