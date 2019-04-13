
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PC_tb IS
END PC_tb;
 
ARCHITECTURE behavior OF PC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         Extend : IN  std_logic_vector(15 downto 0);
		 reset : IN std_logic;
		 Clk : IN std_logic;
         PL : IN  std_logic;
         PI : IN  std_logic;
         PC_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Extend : std_logic_vector(15 downto 0) := (others => '0');
   signal PL : std_logic := '0';
   signal PI : std_logic := '0';
   signal reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal PC_out : std_logic_vector(15 downto 0);
 
 
   -- Clock period definitions
   constant Clk_period : time := 10 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          Extend => Extend,
		  reset => reset,
		  Clk => Clk,
          PL => PL,
          PI => PI,
          PC_out => PC_out
        );
		  

-- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 
      -- Stimulus process
   stim_proc0: process
   begin		
		--Test reset
		reset<='1';
		Extend <= x"0005";
		PI <= '0';
		PL <= '0';
		-- PC_out = 0x0000
		wait for Clk_period;
		
		
		--Test with PI = '0' and PL ='0'
		reset<='0';
		Extend <= x"0005";
		PI <= '0';
		PL <= '0';
		-- PC_out = 0x0000
		wait for Clk_period;
		
		--Test with PI = '1' and PL = '0'
		Extend <= x"0005";
		PI <= '1';
		PL <= '0';
		-- PC_out = 0x01
		wait for Clk_period;
		
		--Test with PI = '0', PL = '1' and offset as 0x101
		Extend <= x"0005";
		PI <= '0';
		PL <= '1';
		-- PC_out = 0x06
		wait for Clk_period;
		
		--Test with PI = '1' and PL = '0' and offset as 0x101
		Extend <= x"0005";
		PI <= '1';
		PL <= '0';
		-- PC_out = 0x07
		wait for Clk_period;
		
   end process;

END;