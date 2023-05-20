
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY IR_tb IS
END IR_tb;
 
ARCHITECTURE behavior OF IR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IR
    PORT(
         data_in : IN  std_logic_vector(15 downto 0);
         IL : IN  std_logic;
		 Clk : IN std_logic;
         Opcode : OUT  std_logic_vector(6 downto 0);
         DR : OUT  std_logic_vector(2 downto 0);
         SA : OUT  std_logic_vector(2 downto 0);
         SB : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal IL : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Opcode : std_logic_vector(6 downto 0);
   signal DR : std_logic_vector(2 downto 0);
   signal SA : std_logic_vector(2 downto 0);
   signal SB : std_logic_vector(2 downto 0);
	
   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IR PORT MAP (
          data_in => data_in,
          IL => IL,
		  Clk => Clk,
          Opcode => Opcode,
          DR => DR,
          SA => SA,
          SB => SB
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
   stim_proc0: process
   begin		
		--Opcode = 0100000, DR = 111, SA = 101, SB = 011.
		--Data in = 0100000 111 101 011,  IL = 1.
		data_in <= "0100000111101011";
		IL <= '1'; 
		wait for Clk_period*2;
		
		--Opcode = 0011100, DR = 010, SA = 111, SB = 000.
		--Data in = 0011100 010 111 000, IL = 0.
		data_in <= "0011100010111000";
		IL <= '0';
		wait for Clk_period*2;
		
		--Opcode = 1111111, DR = 111, SA = 111, SB = 111.
		--Data in = 1111111 111 111 111,  IL = 1.
		data_in <= "1111111111111111";
		IL <= '1'; 
		wait for Clk_period*2;
		
		--Opcode = 1111111, DR = 111, SA = 111, SB = 111.
		--Data in = 1111111 111 111 111,  IL = 1.
		data_in <= "0000000000000000";
		IL <= '1'; 
		wait for Clk_period*2;
   end process;

END;