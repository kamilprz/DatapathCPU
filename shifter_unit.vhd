
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter_unit is
   Port (
    B: in STD_LOGIC_VECTOR(15 downto 0);
    FS: in STD_LOGIC_VECTOR(4 downto 0);
    IL, IR : in STD_LOGIC;
    H: out STD_LOGIC_VECTOR(15 downto 0)
   );
end shifter_unit;

architecture Behavioral of shifter_unit is
    Component mux_3to1
        Port(
        A, B, C: in STD_LOGIC;
        S : in std_logic_vector(1 downto 0);
        Z: out STD_LOGIC
        );
    End Component;

signal S : std_logic_vector(1 downto 0);

begin

S <= "00" when FS = "10000"else
     "01" when FS = "10100" else
     "10" when FS = "11000" else
     "11" after 1 ns;
       
mux00: mux_3to1 PORT MAP(
    A => B(0),
    B => B(1),
    C => IL,
    S => S,
    Z => H(0)
    );
    
mux01: mux_3to1 PORT MAP(
   A => B(1),
   B => B(2),
   C => B(0),
   S => S,
   Z => H(1)
   );
   
mux02: mux_3to1 PORT MAP(
  A => B(2),
  B => B(3),
  C => B(1),
  S => S,
  Z => H(2)
  );
mux03: mux_3to1 PORT MAP(
   A => B(3),
   B => B(4),
   C => B(2),
   S => S,
   Z => H(3)
   );
   
mux04: mux_3to1 PORT MAP(
    A => B(4),
    B => B(5),
    C => B(3),
    S => S,
    Z => H(4)
    );
    
mux05: mux_3to1 PORT MAP(
    A => B(5),
    B => B(6),
    C => B(4),
    S => S,
    Z => H(5)
    );
    
mux06: mux_3to1 PORT MAP(
    A => B(6),
    B => B(7),
    C => B(5),
    S => S,
    Z => H(6)
    );
    
mux07: mux_3to1 PORT MAP(
    A => B(7),
    B => B(8),
    C => B(6),
    S => S,
    Z => H(7)
    );
    
mux08: mux_3to1 PORT MAP(
    A => B(8),
    B => B(9),
    C => B(7),
    S => S,
    Z => H(8)
    );
    
mux09: mux_3to1 PORT MAP(
    A => B(9),
    B => B(10),
    C => B(8),
    S => S,
    Z => H(9)
    );
        
mux10: mux_3to1 PORT MAP(
    A => B(10),
    B => B(11),
    C => B(9),
    S => S,
    Z => H(10)
    );
        
mux11: mux_3to1 PORT MAP(
    A => B(11),
    B => B(12),
    C => B(10),
    S => S,
    Z => H(11)
    );
        
 mux12: mux_3to1 PORT MAP(
    A => B(12),
    B => B(13),
    C => B(11),
    S => S,
    Z => H(12)
    );
        
 mux13: mux_3to1 PORT MAP(
    A => B(13),
    B => B(14),
    C => B(12),
    S => S,
    Z => H(13)
    );
       
mux14: mux_3to1 PORT MAP(
    A => B(14),
    B => B(15),
    C => B(13),
    S => S,
    Z => H(14)
    );
      
mux15: mux_3to1 PORT MAP(
    A => B(15),
    B => IR,
    C => B(14),
    S => S,
    Z => H(15)
    );
        
end Behavioral;