module test();
	reg [31:0] a, b;
	wire [31:0] out;
	reg select;
	
	mux_2_1 mx(a, b, select, out);

	initial begin
		$dumpfile("test");
    		$dumpvars;
		a = 7;
		b = 13;
		select = 0;
		#10;
		select = 1;
		#10;
		b = 5;
		#10;
		a = 12;
		#10;
		select = 0;
		#100 $finish;
	end

endmodule
