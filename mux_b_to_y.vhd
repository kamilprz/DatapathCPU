
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_b_to_y is
  Port (B: in std_logic_vector(15 downto 0);
        Y: out std_logic_vector(15 downto 0);
        S0: in std_logic;
        S1: in std_logic );
end mux_b_to_y;

architecture Behavioral of mux_b_to_y is

begin
Y <= x"0000" when (S1='0' and S0='0') else
    B when (S1='0' and S0='1') else
    (not B) when (S1='1' and S0='0') else
    x"FFFF" when (S1='1' and S0='1');

end Behavioral;
