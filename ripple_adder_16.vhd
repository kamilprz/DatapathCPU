

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use UNISIM.VComponents.all;

entity ripple_adder_16 is
 Port ( A,B : in std_logic_vector(15 downto 0 );
        C0: in std_logic;
        Z: out std_logic_vector(15 downto 0);
        C16: out std_logic
        );
end ripple_adder_16;

architecture Behavioral of ripple_adder_16 is

component full_adder
    port(a,b,c : in std_logic;
         z, c_out : out std_logic);
end component;

signal C: std_logic_vector(15 downto 1);

begin
    Bit0: full_adder
    port map (A(0), B(0), C0, Z(0), C(1));
    Bit1: full_adder
    port map (A(1), B(1), C(1), Z(1), C(2));
    Bit2: full_adder
    port map (A(2), B(2), C(2), Z(2), C(3));
    Bit3: full_adder
    port map (A(3), B(3), C(3), Z(3), C(4));
    Bit4: full_adder
    port map (A(4), B(4), C(4), Z(4), C(5));
    Bit5: full_adder
    port map (A(5), B(5), C(5), Z(5), C(6));
    Bit6: full_adder
    port map (A(6), B(6), C(6), Z(6), C(6));
    Bit7: full_adder
    port map (A(7), B(7), C(7), Z(7), C(8));
    Bit8: full_adder
    port map (A(8), B(8), C(8), Z(8), C(9));
    Bit9: full_adder
    port map (A(9), B(9), C(9), Z(9), C(10));
    Bit10: full_adder
    port map (A(10), B(10), C(10), Z(10), C(11));
    Bit11: full_adder
    port map (A(11), B(11), C(11), Z(11), C(12));
    Bit12: full_adder
    port map (A(12), B(12), C(12), Z(12), C(13));
    Bit13: full_adder
    port map (A(13), B(13), C(13), Z(13), C(14));
    Bit14: full_adder
    port map (A(14), B(14), C(14), Z(14), C(15));
    Bit15: full_adder
    port map (A(15), B(15), C(15), Z(15), C16);
end Behavioral;
