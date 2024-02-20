library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter_tb is
end entity;

architecture Behavior of counter_tb is

  signal clkSig  : STD_LOGIC;
  signal enableSig : STD_LOGIC;
  signal resetSig: STD_LOGIC;
  signal countSig : STD_LOGIC_VECTOR(32 downto 0);

begin

  uut: entity work.counterSrc port map( clock => clkSig, reset_ct => resetSig, enable_ct => enableSig,
					output_ct => countSig);

  stimulate: process
    begin
      clkSig <= '0';
      wait for 100000 ns;
      clkSig <= '1';
      wait for 100000 ns;
  end process;

  reset: process
    begin
      resetSig <= '1';
      wait for 20 ns;
      resetSig <= '0';
      wait;
  end process;

  enable: process
    begin
      enableSig <= '1';
      wait for 50 ns;
  end process;  

end behavior;