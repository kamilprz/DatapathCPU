


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--use UNISIM.VComponents.all;

entity ripple_adder_16 is
 Port ( A,B : in std_logic_vector(15 downto 0 );
        Cin: in std_logic;
        Z: out std_logic_vector(15 downto 0);
        C: out std_logic;
        V: out std_logic
        );
end ripple_adder_16;

architecture Behavioral of ripple_adder_16 is

component full_adder
    port(A,B,C_in : in std_logic;
         Z, C_out : out std_logic);
end component;

signal carries: std_logic_vector(15 downto 0);

begin
    Bit0: full_adder port map (
    A => A(0),
    B => B(0),
    C_in => Cin,
    Z => Z(0), 
    C_out => carries(1)
    );
    Bit1: full_adder port map (
    A => A(1),
    B => B(1),
    C_in => carries(1),
    Z => Z(1), 
    C_out => carries(2)
    );
    Bit2: full_adder port map (
    A => A(2),
    B => B(2),
    C_in => carries(2),
    Z => Z(2), 
    C_out => carries(3)
    );
    Bit3: full_adder port map (
    A => A(3),
    B => B(3),
    C_in => carries(3),
    Z => Z(3), 
    C_out => carries(4)
    );
    Bit4: full_adder port map (
    A => A(4),
    B => B(4),
    C_in => carries(4),
    Z => Z(4), 
    C_out => carries(5)
    );
    Bit5: full_adder port map (
    A => A(5),
    B => B(5),
    C_in => carries(5),
    Z => Z(5), 
    C_out => carries(6)
    );
    Bit6: full_adder port map (
    A => A(6),
    B => B(6),
    C_in => carries(6),
    Z => Z(6), 
    C_out => carries(7)
    );
    Bit7: full_adder port map (
    A => A(7),
    B => B(7),
    C_in => carries(7),
    Z => Z(7), 
    C_out => carries(8)
    );
    Bit8: full_adder port map (
    A => A(8),
    B => B(8),
    C_in => carries(8),
    Z => Z(8), 
    C_out => carries(9)
    );
    Bit9: full_adder port map (
    A => A(9),
    B => B(9),
    C_in => carries(9),
    Z => Z(9), 
    C_out => carries(10)
    );
    Bit10: full_adder port map (
    A => A(10),
    B => B(10),
    C_in => carries(10),
    Z => Z(10), 
    C_out => carries(11)
    );
    Bit11: full_adder port map (
    A => A(11),
    B => B(11),
    C_in => carries(11),
    Z => Z(11), 
    C_out => carries(12)
    );
    Bit12: full_adder port map (
    A => A(12),
    B => B(12),
    C_in => carries(12),
    Z => Z(12), 
    C_out => carries(13)
    );
    Bit13: full_adder port map (
    A => A(13),
    B => B(13),
    C_in => carries(13),
    Z => Z(13), 
    C_out => carries(14)
    );
    Bit14: full_adder port map (
    A => A(14),
    B => B(14),
    C_in => carries(14),
    Z => Z(14), 
    C_out => carries(15)
    );
    Bit15: full_adder port map (
    A => A(15),
    B => B(15),
    C_in => carries(15),
    Z => Z(15), 
    C_out => carries(0)
    );
    
    ------------------------------------------------------------------ OVERFLOW ???????????????????????? ---------------------------------------------------------
    C <= carries(0);
    V <= (carries(15) xor carries(0));
    
end Behavioral;
