module test();
	reg [31:0] a, b;
	wire out; 
	comparator32 comp(a, b, out);

	initial begin
		$dumpfile("test");
    		$dumpvars;
		a = 15;
		b = 16;
		#10
		b = 15;
		#10
		a = 15861;
		#10
		b = 15861;
		#10
		a = -15861;
		#10
		b = -15861;
		#10
		b = 0;
		#10
		a = 0;
		#10 $finish;
	end
endmodule
