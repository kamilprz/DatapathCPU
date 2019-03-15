
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_3to1_tb is
end mux_3to1_tb;

architecture Behavioral of mux_3to1_tb is
   
    COMPONENT mux_3to1
    PORT(
         S : IN  std_logic_vector(1 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         C : IN  std_logic_vector(15 downto 0);
         Z : OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal C : std_logic_vector(15 downto 0) := (others => '0');

   signal Z : std_logic_vector(15 downto 0);
    
    
begin

       uut: mux_3to1 PORT MAP (
          S => S,
          A => A,
          B => B,
          C => C,
          Z => Z
        );
    
   stim_proc: process
   begin	
   	
        A <= x"DEAD";
		B <= x"BEEF";
		C <= x"BABE";	
        S <= "00";
      wait for 50 ns;	
		S <= "01";
      wait for 50 ns;	
		S <= "10";
	  wait for 50 ns;
   
   end process;    
end Behavioral;
