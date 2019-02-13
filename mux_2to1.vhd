----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2019 11:33:09
-- Design Name: 
-- Module Name: mux_3to1 - Behavioral
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

entity mux_2to1 is

Port ( A, B : in std_logic_vector(15 downto 0);
       S : in std_logic;
       Z : out std_logic_vector(15 downto 0));
end mux_2to1;

architecture Behavioral of mux_2to1 is
begin
Z <= A after 5 ns when S='0' else
     B after 5 ns when S='1' else
     "00" after 5 ns;
end Behavioral;

