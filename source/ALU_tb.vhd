
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is

    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : in  STD_LOGIC;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         C : OUT  std_logic;
         V : OUT  std_logic;
         G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';

   signal C : std_logic;
   signal V : std_logic;
   signal G : std_logic_vector(15 downto 0);

begin
    uut: ALU PORT MAP(
        A => A,
        B => B,
        Cin => Cin,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        C => C,
        V => V,
        G => G
    );

    stim_process: process
    begin
        -- ARITHMETIC CIRCUIT
        S2 <= '0';
        Cin <= '0';
		S0 <= '0';
		S1 <= '0';
		A <= x"DEAD";
		B <= x"0000";
		wait for 100 ns;
		--place 0xDEAD into G
		
		S0 <= '1';
		S1 <= '0';
		Cin <= '1';
		A <= x"1110";
		B <= x"1110";
		wait for 100 ns;
		--Should place 0x1110 + 0x1110 + 1 into G
		
		S0 <= '0';
		S1 <= '1';
		Cin <= '0';
		A <= x"000A";
		B <= x"FFF1";
		wait for 100 ns;
		--Should place 0x000A + ~(0xFFF1) into G
		

		-- LOGIC CIRCUIT
		S2 <= '1';
		S0 <= '0';
		S1 <= '0';
		A <= x"BABE";
		B <= x"FFFF";
        -- G should be A and B - BABE
		wait for 100 ns;
    
        S0 <= '1';
		S1 <= '1';
		A <= x"FFF0";	
		-- G should be not A - 000F
		wait for 100 ns;
		
		S0 <= '0';
		S1 <= '1';
		A <= x"FEEF";
		B <= x"F00F";
		-- G should be A xor B - 0EE0
		wait for 100 ns;
    end process;
end Behavioral;
