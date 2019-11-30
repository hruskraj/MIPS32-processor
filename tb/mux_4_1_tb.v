module test();
	reg [31:0] a, b, c, d;
	wire [31:0] out;
	reg [1:0] select;
	
	mux_4_1 mx(a, b, c, d, select, out);

	initial begin
		$dumpfile("test");
    		$dumpvars;
		a = 7;
		b = 13;
		c = 41;
		d = 6;
		select = 0;
		#10;
		select = 1;
		#10;
		select = 2;
		#10;
		select = 3;
		#10;
		d = 15;
		#10;
		a = 12;
		#10;
		select = 0;
		#100 $finish;
	end

endmodule
