module branchEnable(input zero, branch, output PCSrcBeq);
	assign PCSrcBeq = (zero && branch) ? 1 : 0;
endmodule