
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( A : in  std_logic_vector(15 downto 0);
           B : in  std_logic_vector(15 downto 0);
           Cin : in  std_logic;
           S0 : in  std_logic;
           S1 : in  std_logic;
           S2 : in  std_logic;
           C : out  std_logic;
           V : out  std_logic;
           G : out  std_logic_vector(15 downto 0));
end ALU;

architecture Behavioral of ALU is

    COMPONENT arithmetic_circuit
    PORT(
         S0 : in  std_logic;
         S1 : in  std_logic;
         A : in  std_logic_vector(15 downto 0);
         B : in  std_logic_vector(15 downto 0);
         Cin : in  std_logic;
         G : out  std_logic_vector(15 downto 0);
         C : out  std_logic;
         V : out  std_logic
        );
    END COMPONENT;
    
    COMPONENT logic_circuit
    PORT(
         S0 : in  std_logic;
         S1 : in  std_logic;
         A : in  std_logic_vector(15 downto 0);
         B : in  std_logic_vector(15 downto 0);
         G : out  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

    COMPONENT mux_2to1
    PORT(
         A : in  std_logic_vector(15 downto 0);
         B : in  std_logic_vector(15 downto 0);
         S : in  std_logic;
         Z : out  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
	 
	-- signals
	signal arithmetic_out : std_logic_vector(15 downto 0);
	signal logic_out : std_logic_vector(15 downto 0);

begin
--portmaps:

arithmetic: arithmetic_circuit PORT MAP (
          S0 => S0,
          S1 => S1,
          A => A,
          B => B,
          Cin => Cin,
          G => arithmetic_out,
          C => C,
          V => V
        );

logic: logic_circuit PORT MAP (
          S0 => S0,
          S1 => S1,
          A => A,
          B => B,
          G => logic_out
        );

mux: mux_2to1 PORT MAP (
          A => arithmetic_out,
          B => logic_out,
          S => S2,
          Z => G
        );
		  
end Behavioral;
