
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_3to1_tb is
end mux_3to1_tb;

architecture Behavioral of mux_3to1_tb is

    COMPONENT mux_3to1
    PORT(
         S : IN  std_logic_vector(1 downto 0);
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         Z : OUT std_logic
        );
    END COMPONENT;

   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';

   signal Z : std_logic := '0';


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
        A <= '0';
		B <= '1';
		C <= '0';	
        S <= "00";
      wait for 50 ns;	
		S <= "01";
      wait for 50 ns;	
		S <= "10";
	  wait for 50 ns;

   end process;    
end Behavioral;