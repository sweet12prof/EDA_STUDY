--
-- VHDL Architecture Datapath_Counter_lib.reg_4bit.behavorial
--
-- Created:
--          by - sweet12prof.sweet12prof (tiuelabb4.ti.lab)
--          at - 20:37:03 10/17/20
--
-- using Mentor Graphics HDL Designer(TM) 2018.1 (Build 12)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY reg_4bit IS
  port(
          clk       : in std_logic;
          clr_reg   : in std_logic;
          load_reg  : in std_logic;
          D         : in std_logic_vector(3 downto 0 );
          Q         : out std_logic_vector(3 downto 0)
      );
END ENTITY reg_4bit;

--
ARCHITECTURE behavorial OF reg_4bit IS
BEGIN
reg_sync_proc: process(clk, clr_reg)
    begin 
      if(clr_reg = '1') then 
        q <= (others=> '0');
    elsif(rising_edge(clk)) then 
      if(load_reg = '1') then 
        q <= d;
    end if;
    end if;  
    end process;
END ARCHITECTURE behavorial;

