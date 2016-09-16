//Yuxuan Huang
//CS320 Project1
`timescale 1s/1us

module top;
reg clk;
wire Hz;
reg plus=0;
reg minus=0;
reg alarm=0;
reg off=0;
wire c_plus;
wire c_minus;
wire a_plus;
wire a_minus;
wire alarm_on;
wire alarm_trig;
wire [3:0] c_min1,c_min2,c_hr1,c_hr2,a_min1,a_min2,a_hr1,a_hr2;
wire [6:0] LED1,LED2,LED3,LED4;
wire buzzer;
	
	oneHz my_oneHz(clk,Hz);
	control my_control(plus,minus,alarm,c_plus,c_minus,a_plus,a_minus);
	timer my_timer(c_plus,c_minus,Hz,c_min1,c_min2,c_hr1,c_hr2);
	alarm my_alarm(a_plus,a_minus,alarm,c_min1,c_min2,c_hr1,c_hr2,alarm_on,alarm_trig,a_min1,a_min2,a_hr1,a_hr2);
	alarmControl my_alarmControl(clk,alarm,alarm_on,alarm_trig,off,buzzer);
	display my_display(c_min1,c_min2,c_hr1,c_hr2,a_min1,a_min2,a_hr1,a_hr2,alarm,LED1,LED2,LED3,LED4);


	initial begin
		//$dumpon;
		#1 plus=1;
		#0.2 plus=0;
		#1 plus=1;
		#0.2 plus=0;//plus 2 min on clock
		#1 minus=1;
		#0.2 minus=0;
		#1 minus=1;
		#0.2 minus=0;
		#1 minus=1;
		#0.2 minus=0;//minus 3 min on clock
		#1 plus=1;
		#0.2 plus=0;//plus 1 min on clock
		#5 alarm=1;//alarm pressed
		#1 plus=1;
		#0.2 plus=0;
		#1 plus=1;
		#0.2 plus=0;
		#1 plus=1;
		#0.2 plus=0;
		#1 plus=1;
		#0.2 plus=0;
		#1 plus=1;
		#0.2 plus=0;//plus 5 min on alarm
		#1 minus=1;
		#0.2 minus=0;//minus 1 min on alarm
		#1 alarm=0;//alarm released 
		#10 off=1;//off pressed when buzzer not on(nothing happens)
		#0.2 off=0;
		#220 off=1;//off pressed when buzzer on
		#0.2 off=0;
		//$dumpoff;
	end
	
	initial begin
		clk=0;
	end

	always #0.000125 clk<=~clk;

	initial begin
		$monitor($time," %b %b %b %b %b %b",alarm,buzzer,LED1,LED2,LED3,LED4);
		#5000 $finish;
	end 
  	//initial begin
    		//$dumpfile("test.out");
    		//$dumpvars(0,alarm,buzzer,LED1,LED2,LED3,LED4);
 	//end

endmodule

