----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2019 11:19:55
-- Design Name: 
-- Module Name: register_16bit - Behavioral
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
