
----------------------------------------------------------------------------------


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

begin
    Z <= ((A xor B) xor C_in); 
    C_out <= (A and B) or ((A xor B) and C_in) ;
end Behavioral;
