
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detect_16bit_tb is
end zero_detect_16bit_tb;

architecture Behavioral of zero_detect_16bit_tb is

    component zero_detect
    port(
        inPut : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC 
        );
    end component;
    
    --input
    signal inPut : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    --output
    signal outPut : STD_LOGIC := '0';
    

begin
    uut: zero_detect port map(
        inPut => inPut,
        outPut => outPut
    );
    
    stim_proc: process
    begin
        -- outPut = 1 
        inPut <= x"0000";
        wait for 50 ns;
        
        -- outPut = 0 
        inPut <= x"0100";
        wait for 50 ns;
        
        -- outPut = 0 
        inPut <=  x"0001";
        wait for 50 ns;
    end process;


end Behavioral;