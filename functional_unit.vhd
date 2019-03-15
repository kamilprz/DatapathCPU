
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity functional_unit is
    Port ( FSS : in  STD_LOGIC_VECTOR (4 downto 0);
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0);
           V : out  STD_LOGIC;
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end functional_unit;

architecture Behavioral of functional_unit is
    component ALU
    Port ( A : in  std_logic_vector(15 downto 0);
           B : in  std_logic_vector(15 downto 0);
           Cin : in  std_logic;
           S0 : in  std_logic;
           S1 : in  std_logic;
           S2 : in  std_logic;
           C : out  std_logic;
           V : out  std_logic;
           G : out  std_logic_vector(15 downto 0));
    end component;
    
    
    component shifter_unit
       Port (
        B: in STD_LOGIC_VECTOR(15 downto 0);
        FS: in STD_LOGIC_VECTOR(4 downto 0);
        H: out STD_LOGIC_VECTOR(15 downto 0)
       );
    end component;
    
    
    component mux_2to1
      Port (
       A, B : in std_logic_vector(15 downto 0);
       S : in std_logic;
       Z : out std_logic_vector(15 downto 0));
    end component;
    
    component zero_detect
    port (
        inPut : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC 
    );
    end component;
    
   
   signal alu_out : std_logic_vector(15 downto 0);
   signal shift_out : std_logic_vector(15 downto 0);
   
   constant gate_delay: Time := 1ns; 
    
begin
    alul : ALU port map (
        A => A,
        B => B,
        Cin => FSS(0),
        S0 => FSS(1),
        S1 => FSS(2),
        S2 => FSS(3),
        C => C,
        V => V,
        G => alu_out
    );
    
    shifter : shifter_unit port map (
        B => B,
        FS => FSS,
        H => shift_out
    );
    
    mux : mux_2to1 port map (
        A => alu_out,
        B => shift_out,
        S => FSS(4),
        Z => F
    );
    
    zero : zero_detect port map(
        inPut => alu_out,
        outPut => Z
    );
    
    N <= '1' after gate_delay when alu_out(15)='1' 
    else '0' after gate_delay;
    
end Behavioral;