
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
        
        --signals
        signal src_s : std_logic_vector(2 downto 0) := (others => '0');
        signal des_A0, des_A1, des_A2 : std_logic := '0';
        signal clk : std_logic := '0';
        signal data_src : std_logic := '0';
        signal data : std_logic_vector(15 downto 0) := (others => '0');
        signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : std_logic_vector(15 downto 0) := (others => '0');
        
        constant clk_period : time := 5 ns;
        
begin
    uut : register_file PORT MAP (
        src_s => src_s,
        des_A0 => des_A0,
        des_A1 => des_A1,
        des_A2 => des_A2,
        clk => clk,
        data_src => data_src,
        data => data,
        reg0 => reg0,
        reg1 => reg1,
        reg2 => reg2,
        reg3 => reg3,
        reg4 => reg4,
        reg5 => reg5,
        reg6 => reg6,
        reg7 => reg7
    );
   
   
   clock : process
   begin
      clk <= not clk;
      wait for clk_period;
   end process;
   
   stim_proc: process
   begin
    data_src <= '0';	
    data <= x"AAAA";
    des_A0 <= '0';
    des_A1 <= '0';
    des_A2 <= '0';
    wait for clk_period*2;
   	
    data <= x"BBBB";
    des_A0 <= '0';
    des_A1 <= '0';
    des_A2 <= '1';
    wait for clk_period*2;
    
    data <= x"ABBA";
    des_A0 <= '0';
    des_A1 <= '1';
    des_A2 <= '0';
    wait for clk_period*2;
    
    data <= x"BABA";
    des_A0 <= '0';
    des_A1 <= '1';
    des_A2 <= '1';
    wait for clk_period*2;
    
    data <= x"CAFE";
    des_A0 <= '1';
    des_A1 <= '0';
    des_A2 <= '0';
    wait for clk_period*2;
    
    data <= x"BABE";
    des_A0 <= '1';
    des_A1 <= '0';
    des_A2 <= '1';
    wait for clk_period*2;
    
    data <= x"DEAD";
    des_A0 <= '1';
    des_A1 <= '1';
    des_A2 <= '0';
    wait for clk_period*2;
    
    data <= x"BEEF";
    des_A0 <= '1';
    des_A1 <= '1';
    des_A2 <= '1';
    wait for clk_period*2;

    ------------ reg transfer -------------
    data_src <= '1';
    src_s <= "110";
    des_A0 <= '1';
    des_A1 <= '1';
    des_A2 <= '1';
    wait for clk_period*2;
   end process;
    
end Behavioral;
