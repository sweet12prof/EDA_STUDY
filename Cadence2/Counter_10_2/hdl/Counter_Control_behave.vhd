--
-- VHDL Architecture Datapath_Counter_lib.Counter_Control.behave
--
-- Created:
--          by - sweet12prof.sweet12prof (tiuelabb4.ti.lab)
--          at - 22:06:52 10/17/20
--
-- using Mentor Graphics HDL Designer(TM) 2018.1 (Build 12)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--USE ieee.std_logic_arith.all;

ENTITY Counter_Control IS
  port(
        clk       :  in std_logic;
        reset     : in std_logic;
        
        iequals10 : in std_logic;
        
        load_reg  : out std_logic;
        clr_reg   : out std_logic;
        output_reg: out std_logic
      );
END ENTITY Counter_Control;

--
ARCHITECTURE behave OF Counter_Control IS
    type state_type is (st0, st1, st2, st3);
    signal ps, ns : state_type;
BEGIN
    sync_proc: process(all) 
                begin 
                  if(reset = '1') then 
                      PS <= ST0;
                  ELSIF(rising_edge(clk)) then 
                      PS <= NS;
                end if;
              end process;
              
    async_proc : process(all)
                    begin 
                      load_reg   <= '0';
                      clr_reg    <= '0';
                      output_reg <= '0';

                      case PS is 
                        when st0 => 
                          clr_reg    <= '1';
                          NS <= st1;
                        
                        when st1 =>
                          clr_reg    <= '0';
                          load_reg <= '1';
                          NS <= st2;
                          
                        when st2 => 
                          load_reg <= '0';
                          output_reg <= '1';
                          if( iequals10 = '1')then
                               NS <= st3;
                          else 
                              NS <= st1;
                          end if;
                          
                        when st3 => 
                              NS <= st3;
                        
                      end case;
                    end process;
END ARCHITECTURE behave;

