module test();
	reg [31:0] in;
	wire [31:0] out;
	multiply4 mult(in, out);

	initial begin
		$dumpfile("test");
    		$dumpvars;
		in = 7;
		#10
		in = 1;
		#10
		in = 32;
		#10
		in = -1;
		#10
		in = 0;
		#10
		in = 2000000000;
		#10
		in = -15346119;
		#50 $finish;
	end
endmodule
