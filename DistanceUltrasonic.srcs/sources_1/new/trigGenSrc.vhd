----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2020 10:13:53 AM
-- Design Name: 
-- Module Name: trigGenSrc - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity trigGenSrc is
    Port ( clock : in STD_LOGIC;
           value_trigger : out STD_LOGIC);
end trigGenSrc;

architecture Behavioral of trigGenSrc is
component counterSrc is
    generic( z: POSITIVE := 10); 
    Port ( clock : in STD_LOGIC;
           enable_ct : in STD_LOGIC;
           reset_ct : in STD_LOGIC;
           output_ct : out STD_LOGIC_VECTOR (z-1 downto 0));
end component;

signal countReset : STD_LOGIC;
signal countValue : STD_LOGIC_VECTOR(23 downto 0);

begin

    trigVar : counterSrc generic map(24) PORT MAP ( clock, '1', countReset, countValue);
    process(clock)
    constant var250 : STD_LOGIC_VECTOR(23 downto 0) := "101111101011110000100000";
    constant varBoth: STD_LOGIC_VECTOR(23 downto 0) := "101111101100111110101000";

    begin
        if(countValue > var250 and countValue < varBoth) then
            value_trigger <= '1';
        else 
            value_trigger <= '0';
        end if;
        
        if( countValue = varBoth or countValue = "XXXXXXXXXXXXXXXXXXXXXXXX") then
            countReset <= '0';
        else 
            countReset <= '1';
        end if;
     end process;

end Behavioral;
