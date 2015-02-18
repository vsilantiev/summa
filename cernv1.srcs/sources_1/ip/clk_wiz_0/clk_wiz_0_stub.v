// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:08:52 MDT 2014
// Date        : Mon Feb 16 15:18:03 2015
// Host        : ubuntu running 64-bit Ubuntu 12.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/vladimir/TESTDIFFAC/xc7a200tfgg484-1/acprv16bit.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(CLKIN_IN, CLK0_OUT, CLK90_OUT, CLK270_OUT, RST_IN)
/* synthesis syn_black_box black_box_pad_pin="CLKIN_IN,CLK0_OUT,CLK90_OUT,CLK270_OUT,RST_IN" */;
  input CLKIN_IN;
  output CLK0_OUT;
  output CLK90_OUT;
  output CLK270_OUT;
  input RST_IN;
endmodule
