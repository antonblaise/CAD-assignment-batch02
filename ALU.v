// Author: Ha How Ung
// Written on: 18 April 2021 (Mon)
// Title: Arithmetic Logic Unit

module ALU (
	input [3:0] Ain, Bin,
	input [2:0] ALUop,
	output reg [3:0] ALUout
);

	always@(ALUop, Ain, Bin)
		case(ALUop)
			3'b000: ALUout = Ain;
			3'b001: ALUout = Ain | Bin;
			3'b010: ALUout = Ain ^ Bin;
			3'b011: ALUout = Ain & Bin;
			3'b100: ALUout = Ain - Bin;
			3'b101: ALUout = Ain + Bin;
			default: ALUout = Bin;
		endcase

endmodule

