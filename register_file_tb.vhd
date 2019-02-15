
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file_tb is
--  Port ( );
end register_file_tb;

architecture Behavioral of register_file_tb is
    COMPONENT register_file
     Port (src_s : in std_logic_vector(2 downto 0);
           des_A0 : in std_logic;
           des_A1 : in std_logic;
           des_A2 : in std_logic;
           clk : in std_logic;
           data_src : in std_logic;
           data : in std_logic_vector(15 downto 0);
           reg0 : out std_logic_vector(15 downto 0);
           reg1 : out std_logic_vector(15 downto 0);
           reg2 : out std_logic_vector(15 downto 0);
           reg3 : out std_logic_vector(15 downto 0);
           reg4 : out std_logic_vector(15 downto 0);
           reg5 : out std_logic_vector(15 downto 0);
           reg6 : out std_logic_vector(15 downto 0);
           reg7 : out std_logic_vector(15 downto 0)
            );
        END COMPONENT;
        
begin


end Behavioral;
