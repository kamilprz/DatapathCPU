
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY decoder_3to8_tb IS
END decoder_3to8_tb;
 
ARCHITECTURE behavior OF decoder_3to8_tb IS 
 
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

 
BEGIN
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
   
    --  Q0
    A <= '0';
    B <= '0';
    C <= '0';
    wait for 10 ns;
   		
    --  Q1
    A <= '0';
    B <= '0';
    C <= '1';
    wait for 10 ns;
    
    -- Q2
    B <= '1';
    C <= '0';
    wait for 10 ns;
    
    -- Q3
    C <= '1';
    wait for 10 ns;
    
    --Q4
    A <= '1';
    B <= '0';
    C <= '0';
    wait for 10 ns;
    
    --Q5
    C <= '1';
    wait for 10 ns;
    
    --Q6
    B <= '1';
    C <= '0';
    wait for 10ns;
    
    --Q7
    C <= '1';
    wait for 10ns;
   end process;

END;