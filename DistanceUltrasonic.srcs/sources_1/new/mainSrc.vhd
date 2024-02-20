library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use UNISIM.VComponents.all;
use IEEE.STD_LOGIC_ARITH.ALL;


entity mainSrc is
     PORT (  pulseInput   : in STD_LOGIC;
    		 triggerInput : out STD_LOGIC;
       		 mainclock    : in STD_LOGIC;
		     mainCA       : out  STD_LOGIC;
		     mainCB       : out  STD_LOGIC;
		     mainCC       : out  STD_LOGIC;
		     mainCD       : out  STD_LOGIC;
		     mainCE       : out  STD_LOGIC;
		     mainCF       : out  STD_LOGIC;
		     mainCG       : out  STD_LOGIC;
		     mainSelOne   : out  STD_LOGIC;
		     mainSelTwo   : out  STD_LOGIC;
		     mainSelThree : out  STD_LOGIC;
		     mainSelFour  : out  STD_LOGIC		     
 	      );
end mainSrc;

architecture Behavioral of mainSrc is
component rangeSensor is
    Port ( clockVal : in STD_LOGIC;
           pulse : in STD_LOGIC;
           triggerVal : out STD_LOGIC;
           meter : out STD_LOGIC_VECTOR (3 downto 0);
           dMeter : out STD_LOGIC_VECTOR (3 downto 0);
           cMeter : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component segmentDriver is
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
end component;

signal sigA: STD_LOGIC_VECTOR(3 downto 0);
signal sigB: STD_LOGIC_VECTOR(3 downto 0);
signal sigC: STD_LOGIC_VECTOR(3 downto 0);
signal sigD: STD_LOGIC_VECTOR(3 downto 0);
signal sigMet: STD_LOGIC_VECTOR(3 downto 0);
signal sigDeci: STD_LOGIC_VECTOR(3 downto 0);
signal sigCenti : STD_LOGIC_VECTOR(3 downto 0);

begin
	UUTRange : rangeSensor 
	           PORT MAP (
	                clockVal => mainclock, 
	                pulse => pulseInput, 
	                triggerVal => triggerInput,
	                meter => sigMet,
	                dMeter => sigDeci, 
	                cMeter => sigCenti
	                );
	                
	UUTdisp   : segmentDriver
	           PORT MAP(
	               clock => mainclock,
	               dispOne => sigA,
	               dispTwo => sigB,
	               dispThree => sigC,
	               dispFour => sigD,
	               segCA => mainCA,
	               segCB => mainCB,
	               segCC => mainCC,
	               segCD => mainCD,
	               segCE => mainCE,
	               segCF => mainCF,
	               segCG => mainCG,
	               selectOne => mainSelOne,
	               selectTwo => mainSelTwo,
	               selectThree => mainSelThree,
	               selectFour => mainSelFour
	               );

    sigA <= sigCenti;
    sigB <= sigDeci;
    sigC <= sigMet;
    sigD <= "0000";
    
end Behavioral;
