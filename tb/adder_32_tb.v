module test();
	reg [31:0] a, b;
	wire [31:0] sum;
	reg c_in;
	wire c_out;
	adder_32bit adder(a, b, c_in, sum, c_out);
	initial begin
		$dumpfile("test");
    		$dumpvars;
		a = 7;
		b = 13;
		c_in = 0;
		#10
		a = 15;
		b = 1;
		#10
		c_in = 1;
		#10
		b = 15;
		#10
		c_in = 0;
		#10
		a = 1;
		b = -1;
		c_in = 0;
		#10
		c_in = 1;
		#50 $finish;
	end
endmodule
