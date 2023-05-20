
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sign_extend is
  Port ( DR, SB : in std_logic_vector(2 downto 0);
         extension : out std_logic_vector(15 downto 0)
   );
end sign_extend;

architecture Behavioral of sign_extend is

begin
    extension(15 downto 6) <= "0000000000" when (DR(2)='0') else "1111111111";
	extension(5 downto 3) <= DR;
	extension(2 downto 0) <= SB;
end Behavioral;
