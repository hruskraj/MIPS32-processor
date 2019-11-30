module test();
	reg [31:0] a;
	wire [31:0] out; 
	reg clk;
	reg32 comp(a, clk, out);

	initial begin
		$dumpfile("test");
    		$dumpvars;
		a = 15;
		#7
		a = 10;
		#6
		a = 15861;
		#13
		a = -15861;
		#11 a = 0;
		#12 a = 21534164;
		#5 $finish;
	end
	
	always	begin
		clk<=1; # 1; clk<=0; # 1;
	end
endmodule
