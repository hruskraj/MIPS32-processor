module mux_4_1(input [31:0] d0, d1, d2, d3, input[1:0] select, output reg [31:0] y);
	always@ (*) begin
		case(select)
			0: y = d0;
			1: y = d1;
			2: y = d2;
			default: y = d3;
		endcase
	end
endmodule