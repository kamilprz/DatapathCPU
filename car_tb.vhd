
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car_tb is
--  Port ( );
end car_tb;

architecture Behavioral of car_tb is
    component car
        Port (opcode : in std_logic_vector(7 downto 0);
            reset : in std_logic;
            con : in std_logic;
            Clk : in std_logic;
            car_out : out std_logic_vector(7 downto 0)
    );
    end component;
    
    -- inputs
    signal opcode : std_logic_vector(7 downto 0);
    signal reset, con : std_logic;
    
    constant Clk_time : Time := 30ns;
    signal Clk : std_logic := '0';
    
    -- outputs
    signal car_out : std_logic_vector(7 downto 0);
    
begin
    Clk <= not Clk after Clk_time / 2;
    
    car0 : car port map (
        opcode => opcode,
        reset => reset,
        con => con,
        Clk => Clk,
        car_out => car_out
    );
    
    stim_proc : process
    begin
        opcode <= "00000001";
        reset <= '0';
        con <= '1';
        
        wait for 30 ns;
        
        con <= '0';
        
        wait;
    end process;

end Behavioral;