
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY mux_2to1_tb IS
END mux_2to1_tb;
 
ARCHITECTURE behavior OF mux_2to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_2to1
    PORT(
         s : IN  std_logic;
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Z : OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic := '0';
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');


 	--Outputs
   signal Z : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2to1 PORT MAP (
          s => s,
          A => A,
          B => B,
          Z => Z
        );

   stim_proc: process
   begin		
        A <= x"DEAD";
		B <= x"BEEF";
      -- Z = DEAD	
        s <= '0';
        wait for 10 ns;

      -- Z = BEEF	
		s <= '1';
		wait for 10 ns;	
   end process;

END;