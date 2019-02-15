--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decoder_3to8_tb IS
END decoder_3to8_tb;
 
ARCHITECTURE behavior OF decoder_3to8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_3to8
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         Q0 : OUT std_logic;
         Q1 : OUT std_logic;
         Q2 : OUT std_logic;
         Q3 : OUT std_logic;
         Q4 : OUT std_logic;
         Q5 : OUT std_logic;
         Q6 : OUT std_logic;
         Q7 : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';


 	--Outputs
   signal Q0 : std_logic := '0';
   signal Q1 : std_logic := '0';
   signal Q2 : std_logic := '0';
   signal Q3 : std_logic := '0';
   signal Q4 : std_logic := '0';
   signal Q5 : std_logic := '0';
   signal Q6 : std_logic := '0';
   signal Q7 : std_logic := '0';

   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_3to8 PORT MAP (
          A => A,
          B => B,
          C => C,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          Q4 => Q4,
          Q5 => Q5,
          Q6 => Q6,
          Q7 => Q7
        );

   stim_proc: process
   begin		
    wait for 10 ns;
    A <= '0';
    B <= '0';
    C <= '1';
    wait for 10 ns;
    B <= '1';
    C <= '0';
    wait for 10 ns;
    C <= '1';
    wait for 10 ns;
    A <= '1';
    B <= '0';
    C <= '0';
    wait for 10 ns;
    C <= '1';
    wait for 10 ns;
    B <= '1';
    C <= '0';
    wait for 10ns;
    C <= '1';
    
   end process;

END;