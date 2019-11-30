module programCounter(input [31:0] PC, beqValue, jalValue, jrValue, input reset, clk, beq, jal, jr, j, output reg [31:0] newPC);
	initial begin
		newPC <= 0;
	end

	always @ (posedge clk) begin
		if(reset)
			newPC <= 0;
		else if(beq)
			newPC <= beqValue;
		else if(jal || j)
			newPC <= jalValue;
		else if(jr)
			newPC <= jrValue;
		else 
			newPC <= PC + 4;
	end
endmodule