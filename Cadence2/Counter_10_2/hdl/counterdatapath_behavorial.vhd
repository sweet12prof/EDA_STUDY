--
-- VHDL Architecture Datapath_Counter_lib.CounterDatapath.behavorial
--
-- Created:
--          by - sweet12prof.sweet12prof (tiuelabb4.ti.lab)
--          at - 20:36:17 10/17/20
--
-- using Mentor Graphics HDL Designer(TM) 2018.1 (Build 12)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY CounterDatapath IS
  port (
          clk       : in std_logic;
          CU_reset     : in std_logic;
          CU_Load_reg  : in std_logic;
          CU_output_reg: in std_logic;
          
          iequals10     : out std_logic;
          Output           : out std_logic_vector(3 downto 0)
        );
END ENTITY CounterDatapath;

--
ARCHITECTURE behavorial OF CounterDatapath IS
    component adder4 IS
      port(
              a   : in std_logic_vector( 3 downto 0);
              b   : in std_logic_vector( 3 downto 0);
              sum : out std_logic_vector(3 downto 0);
              Cout : out std_logic
          );
    END component;
    
    component comparator_10 IS
      port(
              a : in std_logic_vector(3 downto 0 );
              isequala : out std_logic
          );
    END component;
    
    component reg_4bit IS
      port(
              clk       : in std_logic;
              clr_reg   : in std_logic;
              load_reg  : in std_logic;
              D         : in std_logic_vector(3 downto 0 );
              Q         : out std_logic_vector(3 downto 0)
          );
    END component;
    
    signal postAdder, preAdder :  std_logic_vector(3 downto 0);

BEGIN
    reg_map : reg_4bit port map(
              clk      => clk,
              clr_reg  => CU_reset,
              load_reg => CU_Load_reg,
              D        => postAdder,
              Q        => preAdder
          );
    
    adder_map : adder4 port map
          (
              a     => preAdder,
              b     => "0001",
              sum   => postAdder,
              Cout  => open
          );
          
    comparator_map : comparator_10 port map
          (
              a         => preAdder,
              isequala  => iequals10
          );
    
    
    Output <= preAdder when CU_output_reg = '1' else "ZZZZ";
    
    
END ARCHITECTURE behavorial;

