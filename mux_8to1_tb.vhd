
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY mux_8to1_tb IS
END mux_8to1_tb;
 
ARCHITECTURE behavior OF mux_8to1_tb IS 
  
    COMPONENT mux_8to1
    PORT(
         S : IN  std_logic_vector(2 downto 0);
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
   signal S : std_logic_vector(2 downto 0) := (others => '0');
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
        A <= X"B00B";
		B <= X"AAAA";
		C <= X"B0B0";
		D <= X"FABE";
		E <= X"DEAD";
		F <= X"CAFE";
		G <= X"BABE";
		H <= X"BEEF";
      
      -- s = A	
        s <= "000";
      wait for 10 ns;

      -- s = B	
		s <= "001";
      wait for 10 ns;        

      -- s = C	
		s <= "010";
      wait for 10 ns;
      
      -- s = D	
		s <= "011";	
	  wait for 10 ns;
	  
	  -- s = E	
		s <= "100";	
	  wait for 10 ns;
	  
	  -- s = F	
		s <= "101";
      wait for 10 ns;
      
      -- s = G	
		s <= "110";	
      wait for 10 ns;
      
      -- s = H	
		s <= "111";     
      wait for 10 ns;
   end process;

END;