

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory_tb is
end memory_tb;

architecture Behavioral of memory_tb is
    component memory
        Port (address : in unsigned(15 downto 0);
            write_data : in std_logic_vector(15 downto 0);
            MemWrite : in std_logic;
            Clk : in std_logic;
            read_data : out std_logic_vector(15 downto 0));
    end component;
    
    -- Inputs
    signal address : unsigned(15 downto 0);
    signal write_data : std_logic_vector(15 downto 0);
    constant Clk_time : Time := 10ns;
    signal Clk : std_logic := '0';
    
    -- Outputs
    signal MemWrite : std_logic;
    signal read_data : std_logic_vector(15 downto 0);
    
begin
    Clk <= not Clk after Clk_time / 2;

    mem : memory port map (
        address => address,
        write_data => write_data,
        MemWrite => MemWrite,
        Clk => Clk,
        read_data => read_data
    );
    
    stim_proc : process 
    begin
        address <= X"0001";
        write_data <= X"BABE";
        MemWrite <= '0';
        
        wait for 20 ns;
        address <= X"0001";
        write_data <= X"CAFE";
        MemWrite <= '1';
        
        wait for 20 ns;
        address <= X"0001";
        write_data <= X"DEAD";
        MemWrite <= '0';
        
        wait;
    end process;

end Behavioral;