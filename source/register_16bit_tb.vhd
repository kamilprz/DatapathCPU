
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY register_16bit_tb IS
END register_16bit_tb;
 
ARCHITECTURE behavior OF register_16bit_tb IS 
 
    COMPONENT register_16bit
    PORT(
        D : in  std_logic_vector(15 downto 0);
        load , clk : in std_logic;
        Q : out std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector (15 downto 0);
   signal load : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);
 
    constant clk_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_16bit PORT MAP (
        D => D,
        load => load,
        clk => clk,
        Q => Q
        );
    
   clock : process
   begin
      clk <= not clk;
      wait for clk_period;
   end process;
   
   stim_proc : process
   begin
        -- load x"DEAD" into register		
        D <= x"DEAD";
        load <= '1';
        wait for clk_period*2;

        -- load x"BEEF" into register	
        D <= x"BEEF";
        wait for clk_period*2;
   end process;

END;