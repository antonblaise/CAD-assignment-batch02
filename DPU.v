// Author: Ha How Ung
// Written on: 18 April 2021 (Mon)
// Title: Datapath Unit (DPU)

module DPU (
	input [15:0] din,
	input [1:0] dsel,
	output [7:0] seg, dout
);

	wire [3:0] Ain = din[3:0];
	wire [3:0] Bin = din[7:4];
	wire [2:0] ALUop = din[10:8];
	wire [3:0] ALUout;

	
	ALU u0 (.Ain(Ain), .Bin(Bin), .ALUop(ALUop), .ALUout(ALUout));
	bcd7segDEC u1 (.SW(ALUout), .HEX5(seg), .LEDR());
	Debug_Interface u2 (.ALUout(ALUout), .Ain(Ain), .Bin(Bin), .ALUop(ALUop), .dsel(dsel), .dout(dout));

endmodule