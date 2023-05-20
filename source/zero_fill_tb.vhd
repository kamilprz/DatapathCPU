LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY zero_fill_tb IS
END zero_fill_tb;
 
ARCHITECTURE behavior OF zero_fill_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zero_fill
    PORT(
         SB : IN  std_logic_vector(2 downto 0);
         constant_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal constant_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zero_fill PORT MAP (
          SB => SB,
          constant_out => constant_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		--Test with the constant as 5
		SB <= "101";
        wait for 100 ns;
		
		--Test with the constant as 0
		SB <= "000";
        wait for 100 ns;
		
		--Test with the constant as 7
		SB <= "111";
		wait for 100 ns;
      end process;

END;