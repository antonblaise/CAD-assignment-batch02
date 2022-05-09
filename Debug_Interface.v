// Author: Ha How Ung
// Written on: 18 April 2022 (Mon)
// Title: Debug Interface

module Debug_Interface (
	input [3:0] Ain, Bin, ALUout,
	input [2:0] ALUop,
	input [1:0] dsel,
	output reg [7:0] dout
);

	always@(dsel, Ain, Bin, ALUout, ALUop)
		case(dsel)
			2'b00: dout = {4'b0000, Ain};
			2'b01: dout = {4'b0000, Bin};
			2'b10: dout = {4'b0000, ALUout};
			default: dout = {5'b00000, ALUop};
		endcase

endmodule