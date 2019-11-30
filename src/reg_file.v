module regFile(input [4:0] A1, A2, A3, input CLK, WE3, input [31:0] WD3, output reg [31:0] RD1, RD2);
	reg [31:0] rf[31:0];
	initial begin
		rf[0] = 0;
	end
	always @ (*) begin
		RD1 = rf[A1];
		RD2 = rf[A2];
	end
	
	always @ (posedge CLK) begin
		if(WE3) begin
			if(A3 != 0)
				rf[A3] = WD3;
		end
	end
endmodule