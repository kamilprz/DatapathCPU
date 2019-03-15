
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_circuit is
    Port ( S0 : in  std_logic;
           S1 : in  std_logic;
           A : in  std_logic_vector (15 downto 0);
           B : in  std_logic_vector (15 downto 0);
           Cin : in std_logic;
           G : out  std_logic_vector (15 downto 0);
           C : out  std_logic;
           V : out  std_logic);
end arithmetic_circuit;


architecture Behavioral of arithmetic_circuit is
	COMPONENT ripple_adder_16
	PORT(
		A : in std_logic_vector(15 downto 0);
		B : in std_logic_vector(15 downto 0);
		Cin : in std_logic;
		Z : out std_logic_vector(15 downto 0);
		C : out std_logic;
		V : out std_logic
		);
	END COMPONENT;


	COMPONENT mux_b_to_y
	PORT(
		B : in std_logic_vector(15 downto 0);
		S0 : in std_logic;
		S1 : in std_logic;
		Y : out std_logic_vector(15 downto 0)
		);
	END COMPONENT;

--signals
signal y_signal : std_logic_vector(15 downto 0);

begin

ripple_adder: ripple_adder_16 PORT MAP(
	A => A,
	B => y_signal,
	Cin => Cin, 
	Z => G,
	C => C,
	V => V
);

mux_logic: mux_b_to_y PORT MAP(
	B => B,
	S0 => S0,
	S1 => S1,
	Y => y_signal
);

end Behavioral;
