module mux_2_1_5 (input [4:0] d0, d1, input select, output reg [4:0] y);
	always@ (*) begin
		if(select) y = d1;
		else y = d0;
	end
endmodule

//-------------------------------------------------------------------------------------------------------------------------------------------------------

module mux_2_1 (input [31:0] d0, d1, input select, output reg [31:0] y);
	always@ (*) begin
		if(select) y = d1;
		else y = d0;
	end
endmodule