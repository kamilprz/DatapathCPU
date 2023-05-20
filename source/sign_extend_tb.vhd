
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sign_extend_tb is
end sign_extend_tb;

architecture behaviour of sign_extend_tb is 

    COMPONENT sign_extend
    PORT(
         DR : IN  std_logic_vector(2 downto 0);
         SB : IN  std_logic_vector(2 downto 0);
         extension : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DR : std_logic_vector(2 downto 0) := (others => '0');
   signal SB : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal extension : std_logic_vector(15 downto 0);
	
BEGIN

   uut: sign_extend PORT MAP (
          DR => DR,
          SB => SB,
          extension => extension
        );

   stim_proc: process
   begin		
      -- Test with most significant  bit = 1
		DR <= "101";
		SB <= "010";
		-- Extension = 1111111111101010
      wait for 100 ns;	

      -- Test with most significant  bit = 0
		DR <= "011";
		SB <= "011";
		-- Extension = 0000000000011011
      wait for 100 ns;
   end process;

END;