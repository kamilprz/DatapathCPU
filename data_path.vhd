
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_path is
    Port ( 
        clk : in STD_LOGIC;
        write_enable : in STD_LOGIC;
        MB_select : in STD_LOGIC;
        MD_select : in STD_LOGIC;
        des_reg : in STD_LOGIC_VECTOR (2 downto 0);
        src_a : in STD_LOGIC_VECTOR (2 downto 0);
        src_b : in STD_LOGIC_VECTOR (2 downto 0);
        const_in : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (4 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        a_out : out STD_LOGIC_VECTOR (15 downto 0);
        data_out : out STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC
    );
end data_path;

architecture Behavioral of data_path is
    component functional_unit 
    port(
        FSS : in STD_LOGIC_VECTOR (4 downto 0);
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        F : out STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC
    );
    end component;
    
    component register_file
    port(
        src_a : in STD_LOGIC_VECTOR (2 downto 0);
        src_b : in STD_LOGIC_VECTOR (2 downto 0);
        bus_a : out STD_LOGIC_VECTOR (15 downto 0);
        bus_b : out STD_LOGIC_VECTOR (15 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        des_reg : in STD_LOGIC_VECTOR (2 downto 0);
        write_enable : in STD_LOGIC;
        clk : in STD_LOGIC
    );
    end component;
    
    component mux_2to1
    port(
        S : in  STD_LOGIC;
        A : in  STD_LOGIC_VECTOR (15 downto 0);
        B : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;
    
    --from regfile to mux and FU
    signal busA, busB_rSide, busB_FU_Side : STD_LOGIC_VECTOR (15 downto 0);
    --from FU to mux and regfile
    signal busOut_muxSide, busOut_regSide :STD_LOGIC_VECTOR (15 downto 0);
    
begin
    FU : functional_unit port map(
        FSS => mode_select,
        A => busA,
        B => busB_FU_Side,
        F => busOut_muxSide,
        V => V,
        C => C,
        N => N,
        Z => Z
    );
    
    regfile : register_file port map(
        src_a => src_a,
        src_b => src_b,
        bus_a => busA,
        bus_b => busB_rSide,
        data_in => busOut_regSide,
        des_reg => des_reg,
        write_enable => write_enable,
        clk => clk    
    );
    
    muxB : mux_2to1 port map(
        B => const_in,
        A => busB_rSide,
        S => MB_select,
        z => busB_FU_Side
    );
    
    muxD : mux_2to1 port map(
        B => data_in,
        A => busOut_muxSide,
        S => MD_select,
        z => busOut_regSide
    );
    
    a_out <= busA;
    data_out <= busB_FU_Side;

end Behavioral;