
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_b_to_y_tb is
end mux_b_to_y_tb;

architecture Behavioral of mux_b_to_y_tb is
    
    COMPONENT mux_b_to_y PORT(
         B : in  std_logic_vector(15 downto 0);
         Y : out  std_logic_vector(15 downto 0);
         S0 : in  std_logic;
         S1 : in  std_logic
    );
    END COMPONENT;
    
   signal B, Y : std_logic_vector(15 downto 0) := (others => '0');
   signal S0, S1 : std_logic := '0';

begin
   uut: mux_b_to_y PORT MAP (
          B => B,
          Y => Y,
          S0 => S0,
          S1 => S1
        );
        
    stim_process: process
    begin
        -- Y = x"0000"
        B <= x"0101";
        S0 <= '0';
        S1 <= '0'; 
        wait for 20ns;
        
         -- Y = B
        B <= x"0101";
        S0 <= '1';
        S1 <= '0';        
        wait for 20ns;
        
        -- Y = not(B)
        B <= x"0101";
        S0 <= '0';
        S1 <= '1';            
        wait for 20ns;
        
        -- Y = x"FFFF"
        B <= x"0101";
        S0 <= '1';
        S1 <= '1';
        wait for 20ns;
        
    end process;

end Behavioral;
