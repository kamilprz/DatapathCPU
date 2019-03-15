
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is
    Port (
        src_a : in STD_LOGIC_VECTOR (2 downto 0);
        src_b : in STD_LOGIC_VECTOR (2 downto 0);
        bus_a : out STD_LOGIC_VECTOR (15 downto 0);
        bus_b : out STD_LOGIC_VECTOR (15 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        des_reg : in STD_LOGIC_VECTOR (2 downto 0);
        write_enable : in STD_LOGIC;
        clk : in STD_LOGIC
        );
end register_file;

architecture Behavioral of register_file is
constant gate_delay: Time := 5ns; 

    --list components
    
    --register 16-bit
    component register_16bit
    port (
        load : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        D : in  STD_LOGIC_VECTOR (15 downto 0);
        Q : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    --mux 8 16-bit
    component mux_8to1
    port (
        s : in  STD_LOGIC_VECTOR (2 downto 0);
        A : in  STD_LOGIC_VECTOR (15 downto 0);
        B : in  STD_LOGIC_VECTOR (15 downto 0);
        C : in  STD_LOGIC_VECTOR (15 downto 0);
        D : in  STD_LOGIC_VECTOR (15 downto 0);
        E : in  STD_LOGIC_VECTOR (15 downto 0);
        F : in  STD_LOGIC_VECTOR (15 downto 0);
        G : in  STD_LOGIC_VECTOR (15 downto 0);
        H : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    --decoder 3 to 8
    component decoder_3to8
    port ( 
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        Q0 : out std_logic;
        Q1 : out std_logic;
        Q2 : out std_logic;
        Q3 : out std_logic;
        Q4 : out std_logic;
        Q5 : out std_logic;
        Q6 : out std_logic;
        Q7 : out std_logic 
        );
    end component;
    
    --signals
    --LoaD Register Enable (from decoder to AND)
    signal ldrE_reg0, ldrE_reg1, ldrE_reg2, ldrE_reg3, ldrE_reg4, ldrE_reg5, ldrE_reg6, ldrE_reg7 : STD_LOGIC;
    --ReaD Register (from register to mux)
    signal rdr_reg0, rdr_reg1, rdr_reg2, rdr_reg3, rdr_reg4, rdr_reg5, rdr_reg6, rdr_reg7 : STD_LOGIC_VECTOR(15 downto 0);
    --Write RegisteR (from AND to register)
    signal wrr_reg0, wrr_reg1, wrr_reg2, wrr_reg3, wrr_reg4, wrr_reg5, wrr_reg6, wrr_reg7 : STD_LOGIC;
   
begin

    --Port Mapping
    
    --Registers:
    --R0
    reg0: register_16bit port map(
        D => data_in,
        Q => rdr_reg0,
        load => wrr_reg0,
        clk => clk
        );
    --R1
    reg1: register_16bit port map(
        D => data_in,
        Q => rdr_reg1,
        load => wrr_reg1,
        clk => clk
        );
    --R2
    reg2: register_16bit port map(
        D => data_in,
        Q => rdr_reg2,
        load => wrr_reg2,
        clk => clk
        );
    --R3
    reg3: register_16bit port map(
        D => data_in,
        Q => rdr_reg3,
        load => wrr_reg3,
        clk => clk
        );
    --R4
    reg4: register_16bit port map(
        D => data_in,
        Q => rdr_reg4,
        load => wrr_reg4,
        clk => clk
        );
    --R5
    reg5: register_16bit port map(
        D => data_in,
        Q => rdr_reg5,
        load => wrr_reg5,
        clk => clk
        );
    --R6
    reg6: register_16bit port map(
        D => data_in,
        Q => rdr_reg6,
        load => wrr_reg6,
        clk => clk
        );
    --R7
    reg7: register_16bit port map(
        D => data_in,
        Q => rdr_reg7,
        load => wrr_reg7,
        clk => clk
        );
     
    --Mux 8 16-bit (choose which register to read)
    mux_data8_16bit_a : mux_8to1 port map(
        s => src_a,
        A => rdr_reg0,
        B => rdr_reg1,
        C => rdr_reg2,
        D => rdr_reg3,
        E => rdr_reg4,
        F => rdr_reg5,
        G => rdr_reg6,
        H => rdr_reg7,
        z => bus_a
        );
        
     --Mux 8 16-bit (choose which register to read)
     mux_data8_16bit_b : mux_8to1 port map(
        s => src_b,
        A => rdr_reg0,
        B => rdr_reg1,
        C => rdr_reg2,
        D => rdr_reg3,
        E => rdr_reg4,
        F => rdr_reg5,
        G => rdr_reg6,
        H => rdr_reg7,
        z => bus_b
        );
        
    --Decoder 3 to 8 (choose which register to write to)
    decoder_regSelect3_8 : decoder_3to8 port map(
        A => des_reg(0),
        B => des_reg(1),
        C => des_reg(2),
        Q0 => ldrE_reg0,
        Q1 => ldrE_reg1,
        Q2 => ldrE_reg2,
        Q3 => ldrE_reg3,
        Q4 => ldrE_reg4,
        Q5 => ldrE_reg5,
        Q6 => ldrE_reg6,
        Q7 => ldrE_reg7
        );
     
    wrr_reg0 <= (ldrE_reg0 and write_enable) after gate_delay;
    wrr_reg1 <= (ldrE_reg1 and write_enable) after gate_delay;
    wrr_reg2 <= (ldrE_reg2 and write_enable) after gate_delay;
    wrr_reg3 <= (ldrE_reg3 and write_enable) after gate_delay;
    wrr_reg4 <= (ldrE_reg4 and write_enable) after gate_delay;
    wrr_reg5 <= (ldrE_reg5 and write_enable) after gate_delay;
    wrr_reg6 <= (ldrE_reg6 and write_enable) after gate_delay;
    wrr_reg7 <= (ldrE_reg7 and write_enable) after gate_delay;
end Behavioral;