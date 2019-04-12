
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity data_path is
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
        Port (
          sa, sb, dr : in std_logic_vector(2 downto 0);
          td, tb, ta : in std_logic;
          Clk : in std_logic;
          rw : in std_logic;
          d_data : in std_logic_vector(15 downto 0);
          bus_a, bus_b : out std_logic_vector(15 downto 0);
          reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0));
    end component;
    
    component mux_2to1
    port(
        S : in  STD_LOGIC;
        A : in  STD_LOGIC_VECTOR (15 downto 0);
        B : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;
    
    --Signals
    signal d_data, data : std_logic_vector(15 downto 0);
    signal bus_a_z, bus_b_z, bus_b_mux : std_logic_vector(15 downto 0); 
    signal fss : std_logic_vector(4 downto 0); 
    signal z_out : std_logic_vector(15 downto 0);
    
begin
    FU : functional_unit port map(
        FSS => fss,
        A => bus_a_z,
        B => bus_b_mux,
        F => z_out,
        V => V,
        C => C,
        N => N,
        Z => Z
    );
    
       reg_file: register_file PORT MAP (
            sa => sa,
            sb => sb,
            dr => dr,
            td => td,
            tb => tb,
            ta => ta,
            Clk => Clk,
            rw => rw,
            d_data => d_data,
            bus_a => bus_a_z,
            bus_b => bus_b_z,
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
    
    muxB : mux_2to1 port map(
        B => const_in,
        A => bus_b_z,
        S => mb,
        z => bus_b_mux
    );
    
    muxD : mux_2to1 port map(
        B => data_in,
        A => z_out,
        S => md,
        z => d_data
    );
    
    bus_a <= bus_a_z;
    bus_b <= bus_b_mux;

end Behavioral;