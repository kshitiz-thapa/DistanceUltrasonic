library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trigger_tb is
--  Port ( );
end trigger_tb;

architecture Behavioral of trigger_tb is
signal clock_tb2, trig_tb2 : STD_LOGIC;

begin

  UUT: entity work.trigGenSrc PORT MAP( 
                        clock => clock_tb2,
						value_trigger => trig_tb2);

  process
    begin
      clock_tb2 <= '0';
      wait for 15 ns;
      clock_tb2 <= '1';
      wait for 15 ns;
  
  end process; 

end Behavioral;
