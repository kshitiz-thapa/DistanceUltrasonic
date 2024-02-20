----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2020 07:47:00 PM
-- Design Name: 
-- Module Name: counterSrc - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counterSrc is
    generic( 
                z: POSITIVE := 10 
            ); 
    Port ( clock : in STD_LOGIC;
           enable_ct : in STD_LOGIC;
           reset_ct : in STD_LOGIC;
           output_ct : out STD_LOGIC_VECTOR (z-1 downto 0));
end counterSrc;

architecture Behavioral of counterSrc is
SIGNAL count_ct : STD_LOGIC_VECTOR (z-1 downto 0);
begin

process(clock, reset_ct)
    
begin
    if(reset_ct = '0') then
        count_ct <= ( others => '0'); 
    elsif(rising_edge(clock)) then
        if(enable_ct = '1') then
            count_ct <= count_ct +1;
        end if;
    end if;
    end process;
    output_ct <= count_ct;        
end Behavioral;
