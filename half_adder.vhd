-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity half_adder is
Port ( A, B : in std_logic;
       Z : out std_logic;
       C : out std_logic );
end half_adder;

architecture Behavioral of half_adder is
begin
    Z <= (A xor B) after 1 ns;
    C <= (A and B) after 1 ns;
end Behavioral;