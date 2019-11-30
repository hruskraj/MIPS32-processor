module comparator32(input [31:0] a, b, output reg o);
	always@ (*) o = a == b ? 1 : 0;
endmodule