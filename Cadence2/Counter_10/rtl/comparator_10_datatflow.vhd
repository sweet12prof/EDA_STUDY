--
-- VHDL Architecture Datapath_Counter_lib.comparator_10.datatflow
--
-- Created:
--          by - sweet12prof.sweet12prof (tiuelabb4.ti.lab)
--          at - 21:37:22 10/17/20
--
-- using Mentor Graphics HDL Designer(TM) 2018.1 (Build 12)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY comparator_10 IS
  port(
        a : in std_logic_vector(3 downto 0 );
        isequala : out std_logic
      );
END ENTITY comparator_10;

--
ARCHITECTURE datatflow OF comparator_10 IS
BEGIN
    isequala <= '1' when  (a = "1010") else '0';
END ARCHITECTURE datatflow;

