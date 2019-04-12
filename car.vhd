
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity car is
    Port (opcode : in std_logic_vector(7 downto 0);
          reset : in std_logic;
          con : in std_logic;
          Clk : in std_logic;
          car_out : out std_logic_vector(7 downto 0)
    );
end car;

architecture Behavioral of car is
    component ripple_adder_16
        Port (b, a : in std_logic_vector(15 downto 0);
              c0 : in std_logic;
              s : out std_logic_vector(15 downto 0);
              c16 : out std_logic);
    end component;
    
    component register_16bit
        Port (D : in std_logic_vector(15 downto 0);
            load, Clk : in std_logic;
            Q : out std_logic_vector(15 downto 0));
    end component;

    -- signals
    signal car_val : std_logic_vector(15 downto 0);
    signal inc : std_logic_vector(15 downto 0);
    signal final_car : std_logic_vector(15 downto 0);
    
begin
    adder : ripple_adder_16 port map (
        b(7 downto 0) => car_val(7 downto 0),
        b(15 downto 8) => "00000000",
        a => X"0001",
        c0 => '0',
        s => inc
    );
    
    reg0 : register_16bit port map (
        D => final_car,
        load => '1',
        Clk => Clk,
        Q => car_val
    );  
    
    final_car(7 downto 0) <= opcode when con = '1' else
                            inc(7 downto 0);
    final_car(15 downto 8) <= X"00";
    car_out <= car_val(7 downto 0);

end Behavioral;
