----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2019 10:28:44
-- Design Name: 
-- Module Name: sign_extend_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sign_extend PORT MAP (
          DR => DR,
          SB => SB,
          extension => extension
        );

   -- Stimulus process
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
      wait;
   end process;

END;