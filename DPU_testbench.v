// Author: Ha How Ung
// Written on: 18 April 2021 (Mon)
// Title: Testbench - Datapath Unit (DPU)

`timescale 10ns/1ns

module DPU_testbench();
  
  reg [15:0] din;
  reg [1:0] dsel;
  wire [7:0] seg, dout;
  
  DPU DUT (.din(din), .dsel(dsel), .seg(seg), .dout(dout));
  
  initial
  begin
    $monitor($time, " din=%d, dsel=%b, seg=%b, dout=%d", din,dsel,seg,dout);
  end
  
  integer stepSize = 100;
  
  initial
  begin
    $dumpfile("DPU.vcd");
    $dumpvars(1, DPU_testbench);
    
    #0 din=0; dsel=0;
    
    repeat (1023 / stepSize)
    begin
      #50 din <= din + stepSize; dsel <= 0;
      repeat (3)
      begin
      	#50 dsel <= dsel + 1;
      end
    end
    
  end
  
endmodule