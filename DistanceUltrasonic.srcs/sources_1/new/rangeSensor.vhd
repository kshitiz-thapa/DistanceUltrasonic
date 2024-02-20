----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2020 06:07:53 PM
-- Design Name: 
-- Module Name: rangeSensor - Behavioral
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

entity rangeSensor is
    Port ( clockVal : in STD_LOGIC;
           pulse : in STD_LOGIC;
           triggerVal : out STD_LOGIC;
           meter : out STD_LOGIC_VECTOR (3 downto 0);
           dMeter : out STD_LOGIC_VECTOR (3 downto 0);
           cMeter : out STD_LOGIC_VECTOR (3 downto 0));
end rangeSensor;

architecture Behavioral of rangeSensor is

component bintoBCD is
    Port ( distVal : in STD_LOGIC_VECTOR (8 downto 0);
           hundVar : out STD_LOGIC_VECTOR (3 downto 0);
           tensVar : out STD_LOGIC_VECTOR (3 downto 0);
           unitVar : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component  distanceSrc is
    Port ( clock      : in STD_LOGIC;
           reset_dist : in STD_LOGIC;
           pulse      : in STD_LOGIC;
           value_dist : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component trigGenSrc is
    Port ( clock : in STD_LOGIC;
           value_trigger : out STD_LOGIC);
end component;

signal triggerOutput : STD_LOGIC;
signal distanceOutput : STD_LOGIC_VECTOR (8 downto 0);

begin
    triggerVal <= triggerOutput;

        generateTrigger   : trigGenSrc PORT MAP(
                                        clock => clockVal, 
                                        value_trigger => triggerOutput
                                        );
        distanceCalculate : distanceSrc PORT MAP(
                                        clock => clockVal,
                                        reset_dist => triggerOutput, 
                                         pulse => pulse,
                                         value_dist => distanceOutput 
                                         );
                                         
        convertBin2BCD    : bintoBCD PORT MAP(
                                        distVal => distanceOutput, 
                                        hundVar => meter, 
                                        tensVar => cMeter, 
                                        unitVar => dMeter
                                        );
        
end Behavioral;
