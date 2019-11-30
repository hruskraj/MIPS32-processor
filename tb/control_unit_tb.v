module test();
	reg [5:0] Opcode, funct;
	reg [4:0] shamt; 
	wire RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr;
	wire [3:0] ALUControl;
	
	controlUnit controlUnit(Opcode, funct, shamt, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, ALUControl);
	
	initial begin
		$dumpfile("test");
    	$dumpvars;
		Opcode = 0;
		funct = 6'b101010;
		shamt = 0;
		#10 Opcode = 6'b100011;
		#10 Opcode = 6'b101011;
		#10 Opcode = 6'b000100;
		#10 Opcode = 6'b001000;
		#10 Opcode = 6'b000011;
		#10 Opcode = 6'b000111;
		#10 Opcode = 6'b011111;
		funct = 16;
		#10 shamt = 4;
		#50 $finish;
	end
endmodule

