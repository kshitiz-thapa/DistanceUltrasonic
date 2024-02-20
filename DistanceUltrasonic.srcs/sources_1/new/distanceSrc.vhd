
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity distanceSrc is
    Port ( clock      : in STD_LOGIC;
           reset_dist : in STD_LOGIC;
           pulse      : in STD_LOGIC;
           value_dist : out STD_LOGIC_VECTOR (8 downto 0));
end distanceSrc;

architecture Behavioral of distanceSrc is
 component counterSrc is
    generic( 
                z: POSITIVE := 10
            ); 
    Port ( clock : in STD_LOGIC;
           enable_ct : in STD_LOGIC;
           reset_ct : in STD_LOGIC;
           output_ct : out STD_LOGIC_VECTOR (z-1 downto 0));
end component;

signal value_pulse : STD_LOGIC_VECTOR(21 downto 0);
signal notReset : STD_LOGIC;

begin
notReset <= not reset_dist;
pulseCounter : counterSrc generic map(z =>22) 
                PORT MAP(
                        clock => clock, 
                        enable_ct => pulse, 
                        reset_ct => notReset,
                        output_ct => value_pulse);

calculateDistance : process( pulse)
                    
                    variable rslt : integer;
                    variable mult : STD_LOGIC_VECTOR(23 downto 0);
                    
                    begin
                        if(pulse = '0') then
                            mult := value_pulse * "11";
                            rslt := to_integer(unsigned(mult(23 downto 13)));
                                if(rslt > 450) then
                                    value_dist <= "111111111";
                                else 
                                    value_dist <= STD_LOGIC_VECTOR(to_unsigned(rslt,9));
                                end if; 
                        end if;   
                    end process calculateDistance;    
end Behavioral;
