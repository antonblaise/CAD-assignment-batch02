// Author: Ha How Ung
// Written on: 18 April 2022 (Mon)
// Title: Testbench - Debug Interface

`timescale 10ns/1ns

module Debug_interface_testbench();
  
  reg [3:0] Ain, Bin, ALUout;
  reg [2:0] ALUop;
  reg [1:0] dsel;
  wire [7:0] dout;
  
  Debug_Interface DUT( .Ain(Ain), .Bin(Bin), .ALUout(ALUout), 
                      .ALUop(ALUop), .dsel(dsel), .dout(dout));
  
  initial
  begin
    $monitor($time, " ALUout=%d, Ain=%d, Bin=%d, ALUop=%b, dsel=%b, dout=%d ", 			
             ALUout,Ain,Bin,ALUop,dsel,dout);
  end
  
  integer stepSize = 4;
  
  initial
  begin
    $dumpfile("Debug_Interface.vcd");
    $dumpvars(1, Debug_interface_testbench);
    
    #0 ALUout=0; Ain=15; Bin=0; ALUop=0; dsel=0;
    
    repeat (15 / stepSize)
    begin
      #50 ALUout <= ALUout + stepSize;
      repeat (15 / stepSize)
      begin
      	#50 Ain <= Ain - stepSize;
        #50 Bin <= Bin + stepSize;
        repeat (7 / stepSize)
        begin
          #50 ALUop <= ALUop + stepSize;
          repeat (3)
          begin
            #50 dsel <= dsel + 1;
          end
        end
      end
    end
    
  end

endmodule