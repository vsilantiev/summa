-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:08:52 MDT 2014
-- Date        : Mon Feb 16 15:18:03 2015
-- Host        : ubuntu running 64-bit Ubuntu 12.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/vladimir/TESTDIFFAC/xc7a200tfgg484-1/acprv16bit.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    CLKIN_IN : in STD_LOGIC;
    CLK0_OUT : out STD_LOGIC;
    CLK90_OUT : out STD_LOGIC;
    CLK270_OUT : out STD_LOGIC;
    RST_IN : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLKIN_IN,CLK0_OUT,CLK90_OUT,CLK270_OUT,RST_IN";
begin
end;
