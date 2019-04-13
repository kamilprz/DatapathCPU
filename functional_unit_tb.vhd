
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity functional_unit_tb is
end functional_unit_tb;

Architecture Behavioral of functional_unit_tb is
    component functional_unit
    Port ( FSS : in  STD_LOGIC_VECTOR (4 downto 0);
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           F : out  STD_LOGIC_VECTOR (15 downto 0);
           V : out  STD_LOGIC;
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC
        );
    end component;
    
    --input
    signal FSS : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal A : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    --outputs
    signal outPut : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal V : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal N : STD_LOGIC := '0';
    signal Z : STD_LOGIC := '0';
    
    constant wait_time: Time := 50ns; 

    
begin
    --uut
    uut: functional_unit PORT MAP (
        FSS => FSS,
        A => A,
        B => B, 
        F => outPut,
        V => V,
        C => C,
        N => N,
        Z => Z
        );
    
    stim_proc: process
    begin
        --out = A
        A <= x"DEAD";
        B <= x"0005";
        FSS <= "00000";
        wait for wait_time;
        
        --out = A + 1
        A <= x"DEAD";
        B <= x"0005";
        FSS <= "00001";
        wait for wait_time;
       
        --out = A + B 
        A <= x"DEAD";
        B <= x"0051";
        FSS <= "00010";
        wait for wait_time;
        
        --out = A + B + 1
        A <= x"0005";
        B <= x"0005";
        FSS <= "00011";
        wait for wait_time;
        
        --out = A + !B
		A <= x"000A";
		B <= x"FFF1";
        FSS <= "00100";
        wait for wait_time;
        
        --out = A + !B + 1
		A <= x"000A";
		B <= x"FFF1";
        FSS <= "00101";
        wait for wait_time;
        
        --out = A - 1
        A <= x"0002";
        B <= x"0005";
        FSS <= "00110";
        wait for wait_time;
        
        
        --LOGIC
		A <= x"DEAD";
		B <= x"FFFF";
        -- A AND B
        FSS <= "01000";
        wait for wait_time;

        -- A OR B
        A <= x"B0B0";
		B <= x"0002";
        FSS <= "01010";
        wait for wait_time;
        
        -- A XOR B
        A <= x"FEEF";
		B <= x"F00F";
        FSS <= "01100";
        wait for wait_time;
        
        -- NOT A
        A <= x"FFF0";	
        FSS <= "01110";
        wait for wait_time;
        
        --SHIFTING
        B <= x"F0AF";
        
        FSS <= "10000";
        wait for wait_time;
    
        FSS <= "10100";
        wait for wait_time;
    
        FSS <= "11000";
        wait for wait_time;
    end process;
end Behavioral;