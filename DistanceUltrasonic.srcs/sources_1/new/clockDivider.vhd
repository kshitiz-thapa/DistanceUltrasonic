----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2020 11:05:42 AM
-- Design Name: 
-- Module Name: clockDivider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use UNISIM.VComponents.all;
use IEEE.STD_LOGIC_ARITH.ALL;


entity clockDivider is
    Port ( clock : in STD_LOGIC;
           enableC : in STD_LOGIC;
           resetC : in STD_LOGIC;
           dataCk : out STD_LOGIC_VECTOR(15 downto 0));
end clockDivider;

architecture Behavioral of clockDivider is

begin

    process(clock,resetC)
    variable countVal: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    
    begin
    
    if resetC = '1' then
        countVal := (others => '0');
     elsif enableC = '1' and rising_edge(clock) then
        countVal := countVal + 1;
     end if;
     
     dataCk <= countVal;
     
     end process;

end Behavioral;
