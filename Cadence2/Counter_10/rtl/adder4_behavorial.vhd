--
-- VHDL Architecture Datapath_Counter_lib.adder4.behavorial
--
-- Created:
--          by - sweet12prof.sweet12prof (tiuelabb4.ti.lab)
--          at - 20:57:16 10/17/20
--
-- using Mentor Graphics HDL Designer(TM) 2018.1 (Build 12)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_arith.all;
use ieee.numeric_std.all;

ENTITY adder4 IS
    port(
            a   : in std_logic_vector( 3 downto 0);
            b   : in std_logic_vector( 3 downto 0);
            sum : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );
END ENTITY adder4;

--
ARCHITECTURE behavorial OF adder4 IS
  signal postA, postB, preSum : unsigned(4 downto 0);
BEGIN
    postA <= '0' & unsigned(a(3 downto 0));
    postB <= '0' & unsigned(b(3 downto 0));
    
    preSum <= postA + postB;
    
    Cout <= preSum(4);
    SUM <= STD_LOGIC_VECTOr(presum(3 downto 0));
END ARCHITECTURE behavorial;

