
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_16bit is
  Port ( D: in std_logic_vector (15 downto 0);
         load, clk : in std_logic;
         Q : out std_logic_vector (15 downto 0));
end register_16bit;

architecture Behavioral of register_16bit is
begin
process(clk)
begin
    if(rising_edge(clk)) then
        if(load='1') then
            Q<=D after 5 ns;
        end if;
    end if;
end process;
end Behavioral;
