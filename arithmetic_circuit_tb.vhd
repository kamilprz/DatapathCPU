
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_circuit_tb is
end arithmetic_circuit_tb;

architecture Behavioral of arithmetic_circuit_tb is

    COMPONENT arithmetic_circuit Port (
         A, B : in std_logic_vector(15 downto 0);
         Cin : in std_logic;
         S0, S1 : in std_logic;
         G : out std_logic_vector(15 downto 0);
         C : out std_logic;
         V : out std_logic);
    END COMPONENT;

   signal Cin : std_logic := '0';
   signal S0, S1: std_logic := '0';
   signal A, B : std_logic_vector(15 downto 0) := (others => '0');
   signal G : std_logic_vector(15 downto 0);
   signal C, V : std_logic :='0';
   
begin

    uut: arithmetic_circuit PORT MAP(
        Cin => Cin,
        S0 => S0,
        S1 => S1,
        A => A,
        B => B,
        G => G,
        C => C,
        V => V
    );
    
    
    stim_process: process
    begin
    
        --place 0xDEAD into G
		Cin <= '0';
		S0 <= '0';
		S1 <= '0';
		A <= x"DEAD";
		B <= x"0000";
		wait for 100 ns;
		
		--place 0xBABE + 1 into G
		S0 <= '0';
		S1 <= '0';
		Cin <= '1';
		A <= x"BABE";
		B <= x"0000";
  		wait for 100 ns;

        --Should place 0xBEEF + 0x1110 into G
		S0 <= '1';
		S1 <= '0';
		Cin <= '0';
		A <= x"BEEF";
		B <= x"1110";
		wait for 100 ns;
		
		--Should place 0x1110 + 0x1110 + 1 into G
		S0 <= '1';
		S1 <= '0';
		Cin <= '1';
		A <= x"1110";
		B <= x"1110";
		wait for 100 ns;
		
		--Should place 0x000A + ~(0xFFF1) into G
		S0 <= '0';
		S1 <= '1';
		Cin <= '0';
		A <= x"000A";
		B <= x"FFF1";
		wait for 100 ns;
		
		--Should place 0x000A + ~(0xFFF1) + 1 into G
		S0 <= '0';
		S1 <= '1';
		Cin <= '1';
		A <= x"000A";
		B <= x"FFF1";
		wait for 100 ns;
		
		
		--Should place 0x000A - 1 into G
		S0 <= '1';
		S1 <= '1';
		Cin <= '0';
		A <= x"000A";
		B <= x"FFFF";
		wait for 100 ns;
		
		--Should place 0xBEEF into G
		S0 <= '1';
		S1 <= '1';
		Cin <= '1';
		A <= x"BEEF";
		B <= x"FFFF";
		wait for 100 ns;
		
    end process;
end Behavioral;
