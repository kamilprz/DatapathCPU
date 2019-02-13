----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2019 11:17:52
-- Design Name: 
-- Module Name: mux_8to8 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_8to1 is

Port ( A, B , C, D, E, F, G, H : in std_logic_vector(15 downto 0);
       s : in std_logic_vector (2 downto 0);
       Z : out std_logic_vector(15 downto 0));
end mux_8to1;

architecture Behavioral of mux_8to1 is
begin
Z <= A after 5 ns when s = "000" else
     B after 5 ns when s = "001" else
     C after 5 ns when s = "010" else
     D after 5 ns when s = "011" else
     E after 5 ns when s = "100" else
     F after 5 ns when s = "101" else
     G after 5 ns when s = "110" else
     H after 5 ns when s = "111" else
     x"0000" after 5 ns;
end Behavioral;
