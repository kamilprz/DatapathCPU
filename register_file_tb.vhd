
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         dr : IN  std_logic_vector(2 downto 0);
         sa : IN  std_logic_vector(2 downto 0);
         sb : IN  std_logic_vector(2 downto 0);
		 TD : IN std_logic;
		 TA : IN std_logic;
		 TB : IN std_logic;
         rw : IN  std_logic;
         Clk : IN  std_logic;
         d_data : IN  std_logic_vector(15 downto 0);
         bus_a : OUT  std_logic_vector(15 downto 0);
         bus_b : out std_logic_vector(15 downto 0);
         reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dr : std_logic_vector(2 downto 0) := (others => '0');
   signal sa : std_logic_vector(2 downto 0) := (others => '0');
   signal sb : std_logic_vector(2 downto 0) := (others => '0');
   signal rw : std_logic := '0';
   signal TD : std_logic := '0';
   signal TA : std_logic := '0';
   signal TB : std_logic := '0';
   signal Clk : std_logic := '0';
   signal d_data : std_logic_vector(15 downto 0) := (others => '0');
   

 	--Outputs
   signal bus_a : std_logic_vector(15 downto 0);
   signal bus_b : std_logic_vector(15 downto 0);
   signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : std_logic_vector(15 downto 0) := (others => '0');

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          dr => dr,
          sa => sa,
          sb => sb,
		  TD => TD,
	      TA => TA,
	      TB => TB,
          rw => rw,
          Clk => Clk,
          d_data => d_data,
          bus_a => bus_a,
          bus_b => bus_b,
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
 
   
   -- Stimulus process
   stim_proc: process
   begin		

      wait for 100 ns;	
		rw <= '1';
		
		--Load 0x0 into reg0
		d_data <= x"0000";
		dr <= "000";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x1 into reg1
		d_data <= x"0001";
		dr <= "001";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x2 into reg2
		d_data <= x"0002";
		dr <= "010";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x3 into reg3
		d_data <= x"0003";
		dr <= "011";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x4 into reg4
		d_data <= x"0004";
		dr <= "100";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x5 into reg5
		d_data <= x"0005";
		dr <= "101";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x6 into reg6
		d_data <= x"0006";
		dr <= "110";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x7 into reg7
		d_data <= x"0007";
		dr <= "111";
		TD <= '0';
      wait for Clk_period*10;
		
		--Load 0x8 into reg8
		d_data <= x"0008";
		dr <= "000";
		TD <= '1';
      wait for Clk_period*10;
 
		--Load reg3's value into bus_a
		sa(0) <= '1';
		sa(1) <= '1';
		sa(2) <= '0';
		TA <= '0';
		
		--Load reg5's value into bus_b
		sb(0) <= '1';
		sb(1) <= '0';
		sb(2) <= '1';
		TB <= '0';
		wait for Clk_period*10;
      end process;


END;