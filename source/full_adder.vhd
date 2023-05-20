
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is
    port (
        A, B, C_in: in STD_LOGIC; 
        Z,  C_out : out STD_LOGIC 
    );
end full_adder;

architecture Behavioral of full_adder is
    COMPONENT half_adder
    Port ( A, B : in std_logic;
       Z : out std_logic;
       C : out std_logic );
    END COMPONENT;
    
    signal sum , c_out1, c_out2 : std_logic;
    
begin
    half_adder1 : half_adder PORT MAP(
        A => A,
        B => B,
        C => c_out1,
        Z => sum
    );
    
    half_adder2 : half_adder PORT MAP(
        A => C_in,
        B => sum,
        C => c_out2,
        Z => Z
    );
    
    C_out <= c_out1 or c_out2;
    
    
end Behavioral;
