module processor( input         clk, reset,
                  output [31:0] PC,
                  input  [31:0] instruction,
                  output        WE,
                  output [31:0] address_to_mem,
                  output [31:0] data_to_mem,
                  input  [31:0] data_from_mem
                );
    wire RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ, zero, BranchEQ;
	wire [3:0] ALUControl;
	wire [4:0] A3, writeReg, wire31;
	wire [31:0] AluOut, expandedInst, expInstMult4, RD1, RD2, PCBranch, PC, SrcB, Result, WD3, nextPC;
	supply0 GND;
	controlUnit controlUnit(instruction[31:26], instruction[5:0], instruction[10:6], RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemToReg, PCSrcJal, PCSrcJr, PCSrcJ, ALUControl);
	programCounter pCounter(PC, PCBranch, {PC[31:28], instruction[25:0], GND, GND},	RD1, reset, clk, BranchEQ, PCSrcJal, PCSrcJr, PCSrcJ, PC);
	regFile regFile(instruction[25:21], instruction[20:16], A3, clk, RegWrite, WD3, RD1, RD2);
	expander16_32 expander16_32(instruction[15:0], expandedInst);
	mux_2_1_5 regDest(instruction[20:16], instruction[15:11], RegDst, writeReg);
	mux_2_1 aluSrc(RD2, expandedInst, ALUSrc, SrcB);
	mux_2_1 memToReg(AluOut, data_from_mem, MemToReg, Result);
	alu32 alu32(RD1, SrcB, ALUControl, AluOut, zero);
	assign data_to_mem = RD2;
	assign address_to_mem = AluOut;
	assign WE = MemWrite;
	assign PCBranch = PC + 4 + expInstMult4;
	assign wire31 = 31;
	assign nextPC = PC + 4;
	branchEnable branchEnable(zero, Branch, BranchEQ);
	multiply4 mult4(expandedInst, expInstMult4);
	
	mux_2_1_5 a3Mux(writeReg, wire31, PCSrcJal, A3);
	mux_2_1 wd3Mux(Result, nextPC, PCSrcJal, WD3);
endmodule