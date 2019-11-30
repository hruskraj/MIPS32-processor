module controlUnit(input [5:0] Opcode, funct, input [4:0] shamt, 
				   output RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ, output [3:0] ALUControl);
	wire [1:0] tmp;
	mainDecoder mainDec(Opcode, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ, tmp); 
	ALUOpDecoder aluDec(tmp, funct, shamt, ALUControl);
endmodule

//-------------------------------------------------------------------------------------------------------------------------------------------------------

module mainDecoder(input [5:0] Opcode, output reg RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ, output reg [1:0] ALUOp);
	always @ (*) begin
		case (Opcode)
			6'b000000: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b11010000000;
			6'b100011: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b10100001000;
			6'b101011: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b0x10001x000;
			6'b000100: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b0x00110x000;
			6'b001000: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b10100000000;
			6'b000011: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b1xxxxx0x100;
			6'b000010: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b0xxxxx0x001;
			6'b000111: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b0xxxxx0x010;
			6'b011111: {RegWrite, RegDst, ALUSrc, ALUOp, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ} = 11'b11011000000;
		endcase
	end
endmodule

//-------------------------------------------------------------------------------------------------------------------------------------------------------

module ALUOpDecoder(input [1:0] ALUOp, input [5:0] funct, input [4:0] shamt, output reg [3:0] ALUControl);
	always @ (*) begin
		case (ALUOp)
			0: ALUControl = 4'b0010;
			1: ALUControl = 4'b0110;
			2: begin
				case (funct)
					6'b100000: ALUControl = 4'b0010;
					6'b100010: ALUControl = 4'b0110;
					6'b100100: ALUControl = 4'b0000;
					6'b100101: ALUControl = 4'b0001;
					6'b101010: ALUControl = 4'b0111;
					6'b000100: ALUControl = 4'b1010;
					6'b000110: if(shamt == 0) ALUControl = 4'b1011;
					6'b000111: if(shamt == 0) ALUControl = 4'b1100;
				endcase
			   end
			3: begin
				if(shamt == 5'b00000 && funct == 6'b010000)
					ALUControl = 4'b1000;
				if(shamt == 5'b00100 && funct == 6'b010000)
					ALUControl = 4'b1001;
			   end
		endcase
	end
endmodule