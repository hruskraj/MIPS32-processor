module test();
	reg [4:0] a1, a2, a3;
	reg clk, WE3;
	reg [31:0] WD3;
	wire[31:0] RD1, RD2;
	regFile regFile(a1, a2, a3, clk, WE3, WD3, RD1, RD2);

	initial begin
		$dumpfile("test");
    	$dumpvars;
		a1 = 15;
		a2 = 7;
		WE3 = 0;
		#10 a3 = 5;
		WD3 = 18;
		WE3 = 1;
		#10 WE3 = 0;
		#10 a1 = 5;
		#10 WD3 = 9;
		#10 a3 = 7;
		#10 WE3 = 1;
		#10 WE3 = 0;
		#10 a1 = 0;
		#5 a3 = 0;
		WD3 = 18;
		#3 WE3 = 1;
		#6 WE3 = 0;
		#10 $finish;
	end
	
	always	begin
		clk<=1; # 1; clk<=0; # 1;
	end
	
endmodule
