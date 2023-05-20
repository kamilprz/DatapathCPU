
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
              Cin : in std_logic;
              Z : out std_logic_vector(15 downto 0);
              C : out std_logic);
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
        Cin => '0',
        Z => inc
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
