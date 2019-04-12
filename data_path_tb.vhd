LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
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
           Z : out  STD_LOGIC);
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

   -- Clock period definitions
   constant Clk_period : time := 50 ns;
 
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
          Z => Z
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