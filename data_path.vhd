library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_path is
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
end data_path;

architecture Behavioral of data_path is

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
         bus_b : OUT  std_logic_vector(15 downto 0);
         reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 
    COMPONENT functional_unit
    PORT(
         FSS : IN  std_logic_vector(4 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         F : OUT  std_logic_vector(15 downto 0);
         V : OUT  std_logic;
         C : OUT  std_logic;
         N : OUT  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    
    COMPONENT zero_fill
        Port ( SB : in  STD_LOGIC_VECTOR (2 downto 0);
	           constant_out : out STD_LOGIC_VECTOR (15 downto 0)
	          );
    END COMPONENT;    
	 
    COMPONENT mux_2to1
    PORT(
         S : IN  std_logic;
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	  	--signals
   signal Cout : std_logic;
   signal Vout : std_logic;
   signal mux_b_out : std_logic_vector(15 downto 0);
   signal mux_d_out : std_logic_vector(15 downto 0);
   signal zero_fill_out : std_logic_vector(15 downto 0);
   signal functional_unit_out : std_logic_vector(15 downto 0);
   signal d_data : std_logic_vector(15 downto 0);
   signal a_reg_file_out : std_logic_vector(15 downto 0);
   signal b_reg_file_out : std_logic_vector(15 downto 0);
   	 
begin
		  
reg_file: register_file PORT MAP (
          dr => DR,
		  TD => TD,
          sa => SA,
		  TA => TA,
          sb => SB,
		  TB => TB,
          rw => RW,
          Clk => Clk,
          d_data => mux_d_out,
          bus_a => a_reg_file_out,
          bus_b => b_reg_file_out,
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
        
z_fill: zero_fill PORT MAP (
			SB => SB,
			constant_out => zero_fill_out
		);
		  

func_unit: functional_unit PORT MAP (
          FSS => FS,
          A => a_reg_file_out,
          B => mux_b_out,
          F => functional_unit_out,
          V => V,
          C => C,
          N => N,
          Z => Z
        );

		   
mux_b: mux_2to1 PORT MAP (
          S => MB,
          A => b_reg_file_out,
          B => zero_fill_out,
          Z => mux_b_out
        );
	
mux_d: mux_2to1 PORT MAP (
          S => MD,
          A => functional_unit_out,
          B => data_in,
          Z => mux_d_out
        );
	  
data_out <= mux_b_out;
end Behavioral;