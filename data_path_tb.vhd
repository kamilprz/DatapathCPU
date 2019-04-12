
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path_tb is
end data_path_tb;

architecture Behavioral of data_path_tb is
    component data_path
    Port ( 
        td, tb, ta : in std_logic;
        clk : in STD_LOGIC;
        rw : in STD_LOGIC;
        mb : in STD_LOGIC;
        md : in STD_LOGIC;
        dr : in STD_LOGIC_VECTOR (2 downto 0);
        sa : in STD_LOGIC_VECTOR (2 downto 0);
        sb : in STD_LOGIC_VECTOR (2 downto 0);
        const_in : in STD_LOGIC_VECTOR (15 downto 0);
        fs : in STD_LOGIC_VECTOR (4 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        bus_a, bus_b : out STD_LOGIC_VECTOR (15 downto 0);
        data_out : out STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC;
        reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0)
    );
    end component;
    
    -- Inputs
    signal const, data_in : std_logic_vector(15 downto 0);
    signal reg0, reg1, reg2, reg3, 
           reg4, reg5, reg6, reg7,
           bus_a, bus_b : std_logic_vector(15 downto 0);
    signal rw, td, tb, ta, mb, md : std_logic;
    signal fs : std_logic_vector(4 downto 0);
    signal dr, sa, sb : std_logic_vector(2 downto 0);
    signal v_flag, c_flag, n_flag, z_flag : std_logic := '0';
    constant Clk_time : Time := 30ns;
    signal Clk : std_logic := '0';
    constant clk_period : time := 100ns;
    constant clk_half : time := clk_period/2;
    
begin
    uut: data_path port map (
        clk => clk,
        const_in => const,
        data_in => data_in,
        fs => fs,
        rw => rw,
        td => td,
        tb => tb,
        ta => ta,
        mb => mb,
        md => md,
        dr => dr,
        sa => sa,
        sb => sb,
        bus_a => bus_a,
        bus_b => bus_b,
        v => v_flag,
        c => c_flag,
        n => n_flag,
        z => z_flag,
        reg0 => reg0,
        reg1 => reg1, 
        reg2 => reg2, 
        reg3 => reg3, 
        reg4 => reg4,
        reg5 => reg5, 
        reg6 => reg6, 
        reg7 => reg7
    );
    
    --clock
    clk_process : process
    begin
        clk <= '0';
        wait for clk_half;
        clk <= '1';
        wait for clk_half;
    end process;

    --tests
    stim_proc : process
    begin 
        --test registers
        --load hex 0 to reg0
        dr <= "000";
        rw <= '1';
        data_in <= x"0000";
        md <= '1';
        wait for clk_period;
        
        --load hex 1 to reg1
        dr <= "001";
        data_in <= x"0001";
        rw <= '1';
        md <= '1';
        wait for clk_period;
        
        --load hex 2 to reg2
        dr <= "010";
        rw <= '1';
        data_in <= x"0002";
        md <= '1';
        wait for clk_period;
        
        --load hex 3 to reg3
        dr <= "011";
        rw <= '1';
        data_in <= x"0003";
        md <= '1';
        wait for clk_period;
        
        --load hex 4 to reg4
        dr <= "100";
        rw <= '1';
        data_in <= x"0004";
        md <= '1';
        wait for clk_period;
        
        --load hex 5 to reg5
        dr <= "101";
        rw <= '1';
        data_in <= x"0005";
        md <= '1';
        wait for clk_period;
        
        --load hex 6 to reg6
        dr <= "110";
        rw <= '1';
        data_in <= x"0006";
        md <= '1';
        wait for clk_period;
       
        --load hex 7 to reg7
        dr <= "111";
        rw <= '1';
        data_in <= x"0007";
        md <= '1';
        wait for clk_period;
        
        --reg2 = reg1
        sa <= "001";
        fs <= "00000";
        dr <= "010";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg2 = reg1 + 1
        sa <= "001";
        fs <= "00001";
        dr <= "010";
        rw <= '1';
        md <= '0';
        wait for clk_period;
       
        --reg2 = reg1 + reg5 
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00010";
        dr <= "010";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg2 = reg1 + reg5 + 1
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00011";
        dr <= "010";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg6 = reg1 + !reg5
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00100";
        dr <= "110";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg6 = reg1 + !reg5 + 1
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00101";
        dr <= "110";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg6 = reg1 - 1
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00110";
        dr <= "110";
        rw <= '1';
        md <= '0';
        wait for clk_period;
       
        --reg6 = reg1 
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00111";
        dr <= "110";
        rw <= '1';
        md <= '0';
        wait for clk_period;
       
        --overflow and negative check
            --load hex 7FFF to reg3
            dr <= "011";
            rw <= '1';
            data_in <= x"7FFF";
            md <= '1';
            wait for clk_period;
            
            --load hex 0001 to reg4
            dr <= "100";
            rw <= '1';
            data_in <= x"0001";
            md <= '1';
            wait for clk_period;
            
            --reg3 + reg4 
            sa <= "011";
            sb <= "100";
            mb <= '0';
            fs <= "00010";
            dr <= "101";
            rw <= '0';
            md <= '0';
            wait for clk_period;
            
        --carry & zero check
            --load hex FFFF to reg3
            dr <= "011";
            rw <= '1';
            data_in <= x"FFFF";
            md <= '1';
            wait for clk_period;
            
            --hex 0001 already in reg4
            
            --reg3 + reg4 
            sa <= "011";
            sb <= "100";
            mb <= '0';
            fs <= "00010";
            dr <= "101";
            rw <= '0';
            md <= '0';
            wait for clk_period;
        
        --LOGIC
        --load hex 3C3C to reg3
        dr <= "011";
        rw <= '1';
        data_in <= x"3C3C";
        md <= '1';
        wait for clk_period;
        
        --load hex F0F0 to reg4
        dr <= "100";
        rw <= '1';
        data_in <= x"F0F0";
        md <= '1';
        wait for clk_period;
        
        --reg1 = reg3 AND reg4 
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01000";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;

        --reg1 = reg3 OR reg4 
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01010";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;
            
        --reg1 = reg3 XOR reg4 
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01100";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg1 = reg3 OR reg4 
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01010";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg1 = NOT(reg3)
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01110";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --SHIFTING
        --load hex 00F0 to reg4
        dr <= "100";
        rw <= '1';
        data_in <= x"00F0";
        md <= '1';
        wait for clk_period;
        
        --reg1 = reg4
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "10000";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;
    
        --reg1 = sr(reg4)
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "10100";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
        --reg1 = sr(reg4)
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "11000";
        dr <= "001";
        rw <= '1';
        md <= '0';
        wait for clk_period;
        
    end process;
end Behavioral;