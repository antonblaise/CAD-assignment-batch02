// Author: Ha How Ung
// Written on: 18 April 2021 (Mon)
// Title: Testbench - BCD to 7seg decoder

`timescale 10ns/1ns

module bcd7segDEC_testbench(); // no input, no output
  
  reg [3:0] SW; // represent 4-bit binary number (BCD) as input

  wire [7:0] HEX5;
  wire [9:0] LEDR;
  
  bcd7segDEC DUT ( .SW(SW), .HEX5(HEX5), .LEDR(LEDR));
  
  initial
  begin
    $monitor($time, " SW=%b, HEX5=%b, LEDR=%b ",SW,HEX5,LEDR);
  end
  
  initial
  begin
    $dumpfile("bcd7segDEC.vcd");
    $dumpvars(1, bcd7segDEC_testbench);
    
    #0  SW=0; // at time = 0ns
    repeat (15)
    begin
      #50 SW <= SW + 1;
    end
    
  end
  
endmodule