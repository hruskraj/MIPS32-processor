module alu32(input [31:0] SrcA, SrcB, input [3:0] ALUControl, output reg [31:0] ALUResult, output zero);
	reg c = 0;
	always @ (*)
		case (ALUControl)
			4'b0010: ALUResult = SrcA + SrcB;
			4'b0110: ALUResult = SrcA - SrcB;
			4'b0000: ALUResult = SrcA & SrcB;
			4'b0001: ALUResult = SrcA | SrcB;
			4'b0011: ALUResult = SrcA ^ SrcB;
			4'b0111: ALUResult = (SrcA[31] != SrcB[31]) ? SrcA[31] : (SrcA < SrcB);
			4'b1010: ALUResult = SrcB << SrcA;
			4'b1011: ALUResult = SrcB >> SrcA;
			4'b1100: ALUResult = ($signed(SrcB) >>> (SrcA));
			4'b1000: begin
				ALUResult[7:0] = SrcA[7:0] + SrcB[7:0];
				ALUResult[15:8] = SrcA[15:8] + SrcB[15:8];
				ALUResult[23:16] = SrcA[23:16] + SrcB[23:16];
				ALUResult[31:24] = SrcA[31:24] + SrcB[31:24];
			end
			4'b1001: begin		
				c = 0;
				{c, ALUResult[7:0]} = SrcA[7:0] + SrcB[7:0];
				if(c == 1) ALUResult[7:0] = 8'b11111111;
				c = 0;
				{c, ALUResult[15:8]} = SrcA[15:8] + SrcB[15:8];
				if(c == 1) ALUResult[15:8] = 8'b11111111;
				c = 0;
				{c, ALUResult[23:16]} = SrcA[23:16] + SrcB[23:16];
				if(c == 1) ALUResult[23:16] = 8'b11111111;
				c = 0;
				{c, ALUResult[31:24]} = SrcA[31:24] + SrcB[31:24];
				if(c == 1) ALUResult[31:24] = 8'b11111111;
			end
		endcase
		assign zero = ALUResult ? 0 : 1;
endmodule