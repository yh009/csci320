//Yuxuan Huang
//CS320 Project1

module alarmControl(
input clk,
input alarm,
input alarm_on,
input alarm_trig,
input off,
output buzzer
);

reg buz_on=0;
reg buzzer_low_freq=0;
reg [21:0]counter=0;
parameter S0=2'b01,S1=2'b10,S2=2'b11;

reg [1:0] state=2'b01;
reg [1:0] next_state;

always @(*)begin
	next_state=2'b01;
	case(state)
		S0:begin
			//buz_on=0;
			//$display("in S0");
		   	if (alarm_trig==1 && off==0 && alarm_on==1 && alarm==0) begin
				next_state=S1;
		   	end
			else begin
				buz_on=0;
				next_state=S0;
			end
		   end
		S1:begin
			//buz_on=1;
			//$display("in S1");
			if (off==1 && alarm_trig==1) begin
				next_state=S2;
			end
			else if (alarm_trig==0) begin
				next_state=S0;
			end
			else begin
				buz_on=1;
				next_state=S1;
			end
		   end
		S2:begin
			//buz_on=0;
			//$display("in S2");
			if (alarm_trig==0)begin
				next_state=S0;
			end
			else begin
				buz_on=0;
				next_state=S2;
			end
		   end
		default: next_state=S0;
	endcase
end

always @(posedge clk) begin
	state <= next_state;
end

always @(negedge clk) begin
	if(counter==1999) begin
		buzzer_low_freq<=~buzzer_low_freq;
		counter<=0;
	end
	else begin
		counter<=counter+1;
	end
end


assign buzzer = buz_on && buzzer_low_freq && alarm_on;






endmodule

