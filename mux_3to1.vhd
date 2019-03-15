
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux_3to1 is
Port ( A, B, C : in std_logic;
       S : in std_logic_vector(1 downto 0);
       Z : out std_logic);
end mux_3to1;

architecture Behavioral of mux_3to1 is

begin
Z <= A after 5 ns when S="00" else
     B after 5 ns when S="01" else
     C after 5 ns when S="10" else
     '0' after 5 ns;

end Behavioral;
