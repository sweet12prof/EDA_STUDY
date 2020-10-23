--
-- VHDL Architecture Datapath_Counter_lib.topLevel.behavior
--
-- Created:
--          by - sweet12prof.sweet12prof (tiuelabb4.ti.lab)
--          at - 22:35:34 10/17/20
--
-- using Mentor Graphics HDL Designer(TM) 2018.1 (Build 12)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY topLevel IS
    port(
          clk     : in std_logic;
          reset   : in std_logic;
          
          Output  : out std_logic_vector( 3 downto 0)
        );
END ENTITY topLevel;

--
ARCHITECTURE behavior OF topLevel IS
  component CounterDatapath IS
    port (
            clk       : in std_logic;
            CU_reset     : in std_logic;
            CU_Load_reg  : in std_logic;
            CU_output_reg: in std_logic;
            
            iequals10     : out std_logic;
            Output           : out std_logic_vector(3 downto 0)
          );
  END component;
  
  component Counter_Control IS
    port(
          clk       :  in std_logic;
          reset     : in std_logic;
          
          iequals10 : in std_logic;
          
          load_reg  : out std_logic;
          clr_reg   : out std_logic;
          output_reg: out std_logic
        );
  END component;
  
  
  signal load_reg  :  std_logic;
  signal clr_reg   :  std_logic;
  signal output_reg:  std_logic;
  signal iequals10 :  std_logic;
  signal outputSig : std_logic_vector(3 downto 0);
  
BEGIN
    dp_map : CounterDatapath
              port map (
                      clk           => clk,
                      CU_reset      => clr_reg, 
                      CU_Load_reg   => load_reg,
                      CU_output_reg => output_reg,    
                      iequals10     => iequals10,
                      Output        =>outputSig
                    );
                    
    C_Control : Counter_Control port map(
              clk       => clk,
              reset     => reset, 
              iequals10 => iequals10, 
              load_reg  => load_reg, 
              clr_reg   => clr_reg,
              output_reg => output_reg
            );
 
  Output <= outputSig;
          
END ARCHITECTURE behavior;

