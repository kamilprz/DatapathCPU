
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_3to8 is
Port ( A : in std_logic;
       B : in std_logic;
       C : in std_logic;
       Q0 : out std_logic;
       Q1 : out std_logic;
       Q2 : out std_logic;
       Q3 : out std_logic;
       Q4 : out std_logic;
       Q5 : out std_logic;
       Q6 : out std_logic;
       Q7 : out std_logic 
      );
end decoder_3to8;

architecture Behavioral of decoder_3to8 is
begin
Q0<= ((not A) and (not B) and (not C)) after 5 ns;
Q1<= ((not A) and (not B) and (C)) after 5 ns;
Q2<= ((not A) and (B) and (not C)) after 5 ns;
Q3<= ((not A) and (B) and (C)) after 5 ns;
Q4<= ((A) and (not B) and (not C)) after 5 ns;
Q5<= ((A) and (not B) and (C)) after 5 ns;
Q6<= ((A) and (B) and (not C)) after 5 ns;
Q7<= ((A) and (B) and (C)) after 5 ns;

end Behavioral;