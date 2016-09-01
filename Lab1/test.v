module test;
   reg [31:0] a=0;
   reg [31:0] b=0;
   
   initial begin
      # 5 a=2,b=4;
      # 10 a=4,b=2;
      # 15 a=8,b=10;
      # 20 $finish;

   end

   wire [31:0] c;
   min min1 (a, b, c);

   initial
		$monitor("At time %t, c = %h (%0d)", $time, c, c);
endmodule
   
      
      
