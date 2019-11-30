module adder_32bit (input [31:0] a, b, input c0, output [31:0] sum, output c32);
	assign { c32 , sum} = a + b + c0;
endmodule