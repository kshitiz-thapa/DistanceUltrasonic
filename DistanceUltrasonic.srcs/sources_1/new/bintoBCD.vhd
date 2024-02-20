----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2020 11:09:22 AM
-- Design Name: 
-- Module Name: bintoBCD - Behavioral
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

entity bintoBCD is
    Port ( distVal : in STD_LOGIC_VECTOR (8 downto 0);
           hundVar : out STD_LOGIC_VECTOR (3 downto 0);
           tensVar : out STD_LOGIC_VECTOR (3 downto 0);
           unitVar : out STD_LOGIC_VECTOR (3 downto 0));
end bintoBCD;

architecture Behavioral of bintoBCD is

begin

process(distVal)
    variable x   : integer :=0;
    variable bcd : STD_LOGIC_VECTOR(20 downto 0);
    
    begin 
        bcd := (others => '0');
        bcd(8 downto 0) := distVal;
        
            for  x in 0 to 8 loop
            bcd(19 downto 0) := bcd(18 downto 0) & '0';
            if( x < 8 and bcd(12 downto 9) > "0100") then
                bcd(12 downto 9) := bcd(12 downto 9) + "0011";
            end if;
            
            if( x < 8 and bcd(16 downto 13) > "0100") then
                bcd(16 downto 13) := bcd(16 downto 13) + "0011";
            end if;
            
            if( x < 8 and bcd(20 downto 17) > "0100") then
                bcd(20 downto 17) := bcd(20 downto 17) + "0011";
            end if;
            end loop;
            
       hundVar <= bcd(20 downto 17);
       tensVar <= bcd(16 downto 13);
       unitVar <= bcd(12 downto 9);
end process;
end Behavioral;
