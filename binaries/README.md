# Binaries
Both the `.sof` and `.pof` files can be uploaded to an Intel MAX10 FPGA (10M50DAF484C7G) or DE10-Lite board using Quartus Programmer. However, an SRAM Object File (SOF) is erased after power off, as it is written into a volatile memory, which is the SRAM. On the other hand, a Programmer Object File (POF) is persistent on the FPGA, as it is written inside a non-volatile memory, which is the flash memory.