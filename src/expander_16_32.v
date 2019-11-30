module expander16_32(input [15:0] a, output [31:0] b);
	assign b = { {16{a[15]}}, a };
endmodule