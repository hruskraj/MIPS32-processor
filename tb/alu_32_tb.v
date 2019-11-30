module test();
	reg [31:0] SrcA, SrcB;
	wire [31:0] ALUResult;
	wire zero;
	reg [3:0] ALUControl;
	alu32 alu32(SrcA, SrcB, ALUControl, ALUResult, zero);
	
	initial begin
		$dumpfile("test");
    	$dumpvars;
		SrcA = 10;
		SrcB = 2;
		//AND
		ALUControl = 0;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = -5;
		#10 SrcA = -5;
		//OR
		#10 ALUControl = 1;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = -5;
		#10 SrcA = -5;
		//ADD
		#10 ALUControl = 2;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = -5;
		#10 SrcA = -5;
		//XOR
		#10 ALUControl = 3;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = -5;
		#10 SrcA = -5;
		//SUB
		#10 ALUControl = 6;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = -5;
		#10 SrcA = -5;
		//SLT
		#10 ALUControl = 7;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = -5;
		#10 SrcA = -5;
		#10 SrcB = 0;
		#10 SrcA = 1;
		#10 SrcB = -2916;
		#10 SrcA = 2928;
		#10 SrcA = -2928;
		//ADDU.QB
		#10 ALUControl = 8;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = 18661835;
		#10 SrcA = 1534891;
		#10 SrcB = 0;
		#10 SrcA = 1;
		#10 SrcB = 2916;
		#10 SrcA = 2928;
		#10 SrcA = 291528;
		//ADDU_S.QB
		#10 ALUControl = 9;
		#10 SrcB = 10;
		#10 SrcA = 5;
		#10 SrcB = 18661835;
		#10 SrcA = 1534891;
		#10 SrcB = 0;
		#10 SrcA = 1;
		#10 SrcB = 2916;
		#10 SrcA = 2928;
		#10 SrcA = 32'b11111111111111111111111111111000;
		#50 $finish;
	end
endmodule

