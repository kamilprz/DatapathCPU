

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logic_circuit_tb is
end logic_circuit_tb;

architecture Behavioral of logic_circuit_tb is
    
    COMPONENT logic_circuit is
    Port ( S0 : in  std_logic;
           S1 : in  std_logic;
           A : in  std_logic_vector (15 downto 0);
           B : in  std_logic_vector (15 downto 0);
           G : out  std_logic_vector (15 downto 0)
           );
    END COMPONENT;
     
   signal S0, S1: std_logic := '0';
   signal A, B : std_logic_vector(15 downto 0) := (others => '0');
   signal G : std_logic_vector(15 downto 0);
    
begin

        uut: logic_circuit PORT MAP(
        S0 => S0,
        S1 => S1,
        A => A,
        B => B,
        G => G
    );
    
    stim_process: process
    begin
    
		S0 <= '0';
		S1 <= '0';
		A <= x"DEAD";
		B <= x"FFFF";
        -- G should be A and B - DEAD
		wait for 100 ns;
		
		S0 <= '1';
		S1 <= '0';
		A <= x"B0B0";
		B <= x"0002";
        -- G should be A or B - B0B2
		wait for 100 ns;
		
		S0 <= '0';
		S1 <= '1';
		A <= x"FEEF";
		B <= x"F00F";
		-- G should be A xor B - 0EE0
		wait for 100 ns;
		
		S0 <= '1';
		S1 <= '1';
		A <= x"FFF0";	
		-- G should be not A - 000F
		wait for 100 ns;
		
    end process;
    
end Behavioral;
