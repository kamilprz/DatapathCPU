----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2019 10:24:31
-- Design Name: 
-- Module Name: sign_extend - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
