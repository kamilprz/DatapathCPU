
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter_unit_tb is
end shifter_unit_tb;

architecture tb of shifter_unit_tb is

    component shifter_unit
        port (B  : in std_logic_vector (15 downto 0);
              FS : in std_logic_vector (4 downto 0);
              H  : out std_logic_vector (15 downto 0));
    end component;

    signal B  : std_logic_vector (15 downto 0);
    signal FS : std_logic_vector (4 downto 0);
    signal H  : std_logic_vector (15 downto 0);

begin

    uut : shifter_unit port map (
              B  => B,
              FS => FS,
              H  => H);

    stim_proc : process
    begin
    
        B <= x"A0AF";
        FS <= "10000";
        wait for 50 ns;
        --result should be the same
        
        FS<= "11000";
        wait for 50 ns;
        --result should be shifted right
        
        FS <= "10000";
        wait for 50 ns;
        
        FS<="10100";
        wait for 50 ns;
        --result should shifted left

    end process;

end tb;