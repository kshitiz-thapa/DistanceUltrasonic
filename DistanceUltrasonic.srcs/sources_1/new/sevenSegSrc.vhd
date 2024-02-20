library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use UNISIM.VComponents.all;

entity sevenSegSrc is
        port( clock         : in STD_LOGIC;
		      DspReset      : in STD_LOGIC; 
		      input0        : in  STD_LOGIC_VECTOR (3 downto 0);
		      input1        : in  STD_LOGIC_VECTOR (3 downto 0);
		      input2        : in  STD_LOGIC_VECTOR (3 downto 0);
  		      AN            : out  STD_LOGIC_VECTOR (2 downto 0);
              C_AtoG        : out  STD_LOGIC_VECTOR (6 downto 0)
	);
end sevenSegSrc;

architecture Behavioral of sevenSegSrc is

component counterSrc is
	generic( 
                z: POSITIVE := 10
            ); 
    Port ( clock : in STD_LOGIC;
           enable_ct : in STD_LOGIC;
           reset_ct : in STD_LOGIC;
           output_ct : out STD_LOGIC_VECTOR (z-1 downto 0));
end component;
		
		signal segDisp : STD_LOGIC_VECTOR (19 downto 0);
     	signal choice : STD_LOGIC_VECTOR( 1 downto 0);
     	signal outVar : STD_LOGIC_VECTOR (3 downto 0);
     	signal DspReset_notSignal: STD_LOGIC;
begin
    DspReset_notSignal <= not DspReset;
	dispCnter : counterSrc generic map(z => 20)  
	           PORT MAP(
	               clock => clock, 
	               enable_ct => '1', 
	               reset_ct =>  DspReset_notSignal,
	               output_ct => segDisp);
    	choice <= STD_LOGIC_VECTOR(segDisp(19 downto 18));
    	process(choice, input0, input1, input2)
    		begin
      		case choice is
        		when "00" => AN <= "001";
        			outVar <= input0;
        		when "01" => AN <= "010";
        			outVar <= input1;
 	      		when others => AN <= "100";
    			     	outVar <= input2;
      			end case;
    		end process;
		with outVar select
   	   		C_AtoG(6 downto 0) <= 
   	   		           "1111110" when "0000", -- 0 
				       "0110000" when "0001", -- 1
		 		       "1101101" when "0010", -- 2
				       "1111001" when "0011", -- 3
				       "0110011" when "0100", -- 4 
				       "1011011" when "0101", -- 5 
				       "1011111" when "0110", -- 6 
				       "1110000" when "0111", -- 7 
				       "1111111" when "1000", -- 8 
				       "1111011" when "1001", -- 9 
				       "0001110" when others; -- L
				       --C_AtoG(7) <= '1';

end Behavioral;
