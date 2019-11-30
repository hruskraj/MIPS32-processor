module reg32(input [31:0] datain, input CLK, output reg[31:0] dataout);
	always @ (posedge CLK) begin
		dataout = datain;
	end
endmodule