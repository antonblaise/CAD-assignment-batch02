`timescale 10ns/1ns

module ALU_testbench(); // no input, no output
  
  reg [3:0] Ain, Bin;
  reg [2:0] ALUop;
  wire [3:0] ALUout;
  
  ALU DUT ( .Ain(Ain), .Bin(Bin), .ALUop(ALUop), .ALUout(ALUout));
  
  initial
  begin
    $monitor($time, " Ain=%d, Bin=%d, ALUop=%b,  ALUout=%d ",Ain, Bin, ALUop,  ALUout);
  end
  
  initial
  begin
    $dumpfile("ALU.vcd");
    $dumpvars(1, ALU_testbench);
    
    #0  Ain = 15; Bin = 0; ALUop = 0; // at time = 0ns
    repeat (6)
    begin
      repeat (15)
      begin
        #50 Ain <= Ain -1; Bin <= Bin + 1;
      end
      ALUop <= ALUop + 1;
    end
    
  end
  
endmodule