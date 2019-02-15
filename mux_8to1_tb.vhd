--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_8to1_tb IS
END mux_8to1_tb;
 
ARCHITECTURE behavior OF mux_8to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_8to1
    PORT(
         s : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         C : IN  std_logic_vector(15 downto 0);
         D : IN  std_logic_vector(15 downto 0);
         E : IN  std_logic_vector(15 downto 0);
         F : IN  std_logic_vector(15 downto 0);
         G : IN  std_logic_vector(15 downto 0);
         H : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal C : std_logic_vector(15 downto 0) := (others => '0');
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal E : std_logic_vector(15 downto 0) := (others => '0');
   signal F : std_logic_vector(15 downto 0) := (others => '0');
   signal G : std_logic_vector(15 downto 0) := (others => '0');
   signal H : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_8to1 PORT MAP (
          s => s,
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          G => G,
          H => H,
          Z => Z
        );

   stim_proc: process
   begin		
        A <= "1010101010101010";
		B <= "1100110011001100";
		C <= "1111000011110000";
		D <= "1111111100000000";
		E <= x"DEAD";
		F <= x"CAFE";
		G <= x"BABE";
		H <= x"BEEF";
      wait for 10 ns;	
        s <= "000";

      wait for 10 ns;	
		s <= "001";

      wait for 10 ns;	
		s <= "010";

      wait for 10 ns;	
		s <= "011";
		
	  wait for 10 ns;	
		s <= "100";
		
	  wait for 10 ns;	
		s <= "101";

      wait for 10 ns;	
		s <= "110";
		
      wait for 10 ns;	
		s <= "111";     
      wait FOR 10 ns;
   end process;

END;