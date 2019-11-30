module test();
	reg [15:0] a;
	wire [31:0] b;
	expander16_32 expander(a, b);
	
	initial begin
		$dumpfile("test");
    	$dumpvars;
		a = 1614;
		#10 a = 196;
		#10 a = 116;
		#10 a = 12;
		#10 a = -1;
		#10 a = -112;
		#10 a = 14598;
		#10 a = -15849;
		#10 a = 0;
		#50 $finish;
	end
endmodule

