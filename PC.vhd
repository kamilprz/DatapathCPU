
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is
    Port ( Extend : in  STD_LOGIC_VECTOR (15 downto 0);
		   reset : in STD_LOGIC;
		   Clk : in STD_LOGIC;
           PL : in  STD_LOGIC;
           PI : in  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0));
end PC;

architecture Behavioral of PC is

	COMPONENT ripple_adder_16
	PORT(
		A : IN std_logic_vector(15 downto 0);
		B : IN std_logic_vector(15 downto 0);
		Cin : IN std_logic;
		Z : OUT std_logic_vector(15 downto 0);
		C : OUT std_logic;
		V : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT register_16bit
	PORT(
		D : IN std_logic_vector(15 downto 0);
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	
signal pi_or_pl_or_reset : std_logic;
signal load_result : std_logic_vector(15 downto 0);
signal increment_result : std_logic_vector(15 downto 0);
signal next_PC : std_logic_vector (15 downto 0);
signal last_PC : std_logic_vector (15 downto 0);

begin

-- ripple_adder_16bit
adderLoad: ripple_adder_16 PORT MAP(
	A => last_pc,
	B => Extend,
	Cin => '0', 
	Z => load_result
);

-- ripple_adder_16bit
adderIncrement: ripple_adder_16 PORT MAP(
	A => last_PC,
	B => x"0001",
	Cin => '0', 
	Z => increment_result
);

-- register
reg: register_16bit PORT MAP(
	D => next_PC,
	load => pi_or_pl_or_reset,
	Clk => Clk,
	Q => last_PC
);

	next_PC <= x"0000" when reset='1' else 
	                        increment_result when PI='1' else
					        load_result when PL='1'   
					        else x"0000";
	PC_out <= last_PC;
	pi_or_pl_or_reset <= (PI or PL or reset);
	
end Behavioral;