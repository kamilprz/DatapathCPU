
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY data_path_tb IS
END data_path_tb;
 
ARCHITECTURE behavioral OF data_path_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT data_path
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           DR : IN  std_logic_vector(2 downto 0);
           SA : IN  std_logic_vector(2 downto 0);
           SB : IN  std_logic_vector(2 downto 0);
           TD : IN  std_logic;
           TA : IN  std_logic;
           TB : IN  std_logic;
           Clk : in  STD_LOGIC;
           FS : IN  std_logic_vector(4 downto 0);
           RW : IN  std_logic;
           MB : IN  std_logic;
           MM : IN  std_logic;
           MD : IN  std_logic;
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);
           address_out : out  STD_LOGIC_VECTOR (15 downto 0);
           V : out  STD_LOGIC;
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0)
           );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal DR : std_logic_vector(2 downto 0) := (others => '0');
   signal SA : std_logic_vector(2 downto 0) := (others => '0');
   signal SB : std_logic_vector(2 downto 0) := (others => '0');
   signal TD : std_logic := '0';
   signal TA : std_logic := '0';
   signal TB : std_logic := '0';
   signal Clk : std_logic := '0';
   signal FS : std_logic_vector(4 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal MB : std_logic := '0';
   signal MM : std_logic := '0';
   signal MD : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);
   signal address_out : std_logic_vector(15 downto 0);
   signal V : std_logic;
   signal C : std_logic;
   signal N : std_logic;
   signal Z : std_logic;
   
   signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : std_logic_vector(15 downto 0) := (others => '0');

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: data_path PORT MAP (
          data_in => data_in,
          DR => DR,
          SA => SA,
          SB => SB,
          TD => TD,
          TA => TA,
          TB => TB,
          Clk => Clk,
          FS => FS,
          RW => RW,
          MB => MB,
          MM => MM,
          MD => MD,
          data_out => data_out,
          address_out => address_out,
          V => V,
          C => C,
          N => N,
          Z => Z,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7,
          reg8 => reg8
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

 stim_proc : process
    begin 
        --test registers
        --load 0 to reg0
        dr <= "000";
        rw <= '1';
        data_in <= x"0000";
        md <= '1';
        wait for clk_period;
        
        --load 1 to reg1
        dr <= "001";
        data_in <= x"0001";
        rw <= '1';
        md <= '1';
        wait for clk_period;
        
        --load 2 to reg2
        dr <= "010";
        rw <= '1';
        data_in <= x"0002";
        md <= '1';
        wait for clk_period;
        
        --load 3 to reg3
        dr <= "011";
        rw <= '1';
        data_in <= x"0003";
        md <= '1';
        wait for clk_period;
        
        --load 4 to reg4
        dr <= "100";
        rw <= '1';
        data_in <= x"0004";
        md <= '1';
        wait for clk_period;
        
        --load 5 to reg5
        dr <= "101";
        rw <= '1';
        data_in <= x"0005";
        md <= '1';
        wait for clk_period;
        
        --load 6 to reg6
        dr <= "110";
        rw <= '1';
        data_in <= x"0006";
        md <= '1';
        wait for clk_period;
       
        --reg7 = reg5
        sa <= "101";
        fs <= "00000";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        --reg7 = reg6 + 1
        sa <= "110";
        fs <= "00001";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        --reg7 = reg4 + reg5 
        sa <= "100";
        sb <= "101";
        mb <= '0';
        fs <= "00010";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
       
        --reg7 = reg1 + reg5 + 1
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00011";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        --reg7 = reg1 + !reg5
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00100";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        --reg7 = reg1 + !reg5 + 1
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00101";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        --reg7 = reg1 - 1
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00110";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
       
        --reg7 = reg1 
        sa <= "001";
        sb <= "101";
        mb <= '0';
        fs <= "00111";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
            
        --LOGIC
        --load hex DEAD to reg3
        dr <= "011";
        rw <= '1';
        data_in <= x"DEAD";
        md <= '1';
        wait for clk_period;
        
        --load hex F0F0 to reg4
        dr <= "100";
        rw <= '1';
        data_in <= x"F0F0";
        md <= '1';
        wait for clk_period;
        
        --reg7 = DEAD AND F0F0 
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01000";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;

        --reg7 = DEAD OR F0F0 
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01010";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
            
        --reg7 = DEAD XOR F0F0 
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01100";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        
        --reg7 = NOT(DEAD)
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "01110";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        --SHIFTING
        --load hex 00F0 to reg4
        dr <= "100";
        rw <= '1';
        data_in <= x"00F0";
        md <= '1';
        wait for clk_period * 10;
        
        --reg7 = 00F0
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "10000";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
               
        --reg7 = sr(00F0)
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "10100";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
        --reg7 = sl(00F0)
        sa <= "011";
        sb <= "100";
        mb <= '0';
        fs <= "11000";
        dr <= "111";
        rw <= '1';
        md <= '0';
        wait for clk_period * 10;
        
    end process;
end Behavioral;