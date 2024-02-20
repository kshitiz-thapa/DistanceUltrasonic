----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2020 10:36:09 AM
-- Design Name: 
-- Module Name: segmentDecoder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segmentDecoder is
    Port ( inputValue : in STD_LOGIC_VECTOR (3 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC
           );
end segmentDecoder;

architecture Behavioral of segmentDecoder is

begin
process(inputValue)
    variable dataVal : STD_LOGIC_VECTOR(6 downto 0);
    
    begin 
    case inputValue is
        when "0000" => dataVal := "1111110"; -- 0
        when "0001" => dataVal := "0110000"; -- 1
        when "0010" => dataVal := "1101101"; -- 2
        when "0011" => dataVal := "1111001"; -- 3
        when "0100" => dataVal := "0110011"; -- 4
        when "0101" => dataVal := "1011011"; -- 5
        when "0110" => dataVal := "1011111"; -- 6
        when "0111" => dataVal := "1110000"; -- 7
        when "1000" => dataVal := "1111111"; -- 8
        when "1001" => dataVal := "1111011"; -- 9
        when "1010" => dataVal := "1110111"; -- A
        when "1011" => dataVal := "0011111"; -- B
        when "1100" => dataVal := "1001110"; -- C
        when "1101" => dataVal := "0111101"; -- D
        when "1110" => dataVal := "1001111"; -- E
        when "1111" => dataVal := "1000111"; -- F
        when others => dataVal := "1101111"; -- error i.e. opposite "e" 
        end case;

    CA <= not dataVal(6);
    CB <= not dataVal(5);
    CC <= not dataVal(4);
    CD <= not dataVal(3);
    CE <= not dataVal(2);
    CF <= not dataVal(1);
    CG <= not dataVal(0);
    
    end process;
   
end Behavioral;
