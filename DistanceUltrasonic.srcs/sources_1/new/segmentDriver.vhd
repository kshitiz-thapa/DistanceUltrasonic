
library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use UNISIM.VComponents.all;
use IEEE.STD_LOGIC_ARITH.ALL;


entity segmentDriver is
    Port ( clock : in STD_LOGIC;
           dispOne : in STD_LOGIC_VECTOR (3 downto 0);
           dispTwo : in STD_LOGIC_VECTOR (3 downto 0);
           dispThree : in STD_LOGIC_VECTOR (3 downto 0);
           dispFour : in STD_LOGIC_VECTOR (3 downto 0);
           segCA : out STD_LOGIC;
           segCB : out STD_LOGIC;
           segCC : out STD_LOGIC;
           segCD : out STD_LOGIC;
           segCE : out STD_LOGIC;
           segCF : out STD_LOGIC;
           segCG : out STD_LOGIC;
           selectOne : out STD_LOGIC;
           selectTwo : out STD_LOGIC;
           selectThree : out STD_LOGIC;
           selectFour : out STD_LOGIC
           );
end segmentDriver;

architecture Behavioral of segmentDriver is
    
    COMPONENT segmentDecoder is
    Port ( inputValue : in STD_LOGIC_VECTOR (3 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC
           );
    end COMPONENT;
    
    COMPONENT clockDivider is
    Port ( clock : in STD_LOGIC;
           enableC : in STD_LOGIC;
           resetC : in STD_LOGIC;
           dataCk : out STD_LOGIC_VECTOR(15 downto 0));
    end COMPONENT;
    
    signal tempVal  : STD_LOGIC_VECTOR(3 downto 0);
    signal clkWrd : STD_LOGIC_VECTOR(15 downto 0);
    signal  slClk : STD_LOGIC;
    
begin
    
     UUT: segmentDecoder PORT MAP
                    (
                        inputValue => tempVal,
                        CA         => segCA,
                        CB         => segCB,
                        CC         => segCC,
                        CD         => segCD,
                        CE         => segCE,
                        CF         => segCF,
                        CG         => segCG
                     );
     UUT2: clockDivider PORT MAP
                    (
                        clock => clock,
                        enableC => '1',
                        resetC => '0',
                        dataCk => clkWrd
                     );
     slClk <= clkWrd(15);
     
     process(slClk)
        variable dispChoice : STD_LOGIC_VECTOR( 1 downto 0);
        begin
        
        if rising_edge(slClk) then
            case dispChoice is
            
                when "00" => tempVal <= dispOne;
                    selectOne <= '0';
                    selectTwo <= '1';
                    selectThree <= '1';
                    selectFour <= '1';
                    dispChoice := dispChoice +'1';
                
                when "01" => tempVal <= dispTwo;
                    selectOne <= '1';
                    selectTwo <= '0';
                    selectThree <= '1';
                    selectFour <= '1';
                    dispChoice := dispChoice +'1';
                    
                when "10" => tempVal <= dispThree;
                    selectOne <= '1';
                    selectTwo <= '1';
                    selectThree <= '0';
                    selectFour <= '1';
                    dispChoice := dispChoice +'1';  
                 
                 when others => tempVal <= dispFour;
                    selectOne <= '1';
                    selectTwo <= '1';
                    selectThree <= '1';
                    selectFour <= '0';
                    dispChoice := dispChoice +'1';  
            end case;
       end if;
   end process;
end Behavioral;
