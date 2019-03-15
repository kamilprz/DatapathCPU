
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_circuit is
    Port ( S0 : in  std_logic;
           S1 : in  std_logic;
           A : in  std_logic_vector (15 downto 0);
           B : in  std_logic_vector (15 downto 0);
           G : out  std_logic_vector (15 downto 0)
           );
end logic_circuit;

architecture Behavioral of logic_circuit is

begin
G <= (A and B) after 1 ns when S1='0' and S0='0' else
     (A or B) after 1 ns when S1='0' and S0='1' else
     (A xor B) after 1 ns when S1='1' and S0='0' else
     (not A) after 1 ns when S1='1' and S0='1' else
     x"0000" after 1 ns;
end Behavioral;
