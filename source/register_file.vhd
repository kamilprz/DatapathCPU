
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is
  Port (sa, sb, dr : in std_logic_vector(2 downto 0);
        td, tb, ta : in std_logic;
        Clk : in std_logic;
        rw : in std_logic;
        d_data : in std_logic_vector(15 downto 0);
        bus_a, bus_b : out std_logic_vector(15 downto 0);
        reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out std_logic_vector(15 downto 0)
        );
end register_file;

architecture Behavioral of register_file is
-- components
    -- 16-bit register
    COMPONENT register_16bit
       Port(D : IN std_logic_vector(15 downto 0);
            load : IN std_logic;
            Clk : IN std_logic;
            Q : OUT std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- 3 to 8 decoder
    COMPONENT decoder_3to8
       Port (A : in std_logic;
             B : in std_logic;
             C : in std_logic;
             Q0 : out std_logic;
             Q1 : out std_logic;
             Q2 : out std_logic;
             Q3 : out std_logic;
             Q4 : out std_logic;
             Q5 : out std_logic;
             Q6 : out std_logic;
             Q7 : out std_logic);
    END COMPONENT;
    
    -- 8 multiplexer 16-bit
    COMPONENT mux_8to1 is
      Port (A, B, C, D, E, F, G, H : in std_logic_vector(15 downto 0);
            s : in std_logic_vector(2 downto 0);
            Z : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
    -- 2 multiplexer 16-bit
    COMPONENT mux_2to1 is
      Port (A : in std_logic_vector(15 downto 0);
            B : in std_logic_vector(15 downto 0);
            s : in std_logic;
            Z : out std_logic_vector(15 downto 0));
    END COMPONENT;
    
-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : std_logic := '0';
signal dec_out_0, dec_out_1, dec_out_2, dec_out_3, dec_out_4, dec_out_5, dec_out_6, dec_out_7, dec_out_8 : std_logic := '0';
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q,reg8_q, data_src_mux_out, src_reg, a_select_z, b_select_z, b_reg_final : std_logic_vector(15 downto 0);
    
begin
-- port maps
    -- reg 0
    reg00: register_16bit PORT MAP (
        D => d_data,
        load => load_reg0,
        Clk => Clk,
        Q => reg0_q);
    
    -- reg 1
    reg01: register_16bit PORT MAP (
        D => d_data,
        load => load_reg1,
        Clk => Clk,
        Q => reg1_q);

    -- reg 2
    reg02: register_16bit PORT MAP (
        D => d_data,
        load => load_reg2,
        Clk => Clk,
        Q => reg2_q);

    -- reg 3
    reg03: register_16bit PORT MAP (
        D => d_data,
        load => load_reg3,
        Clk => Clk,
        Q => reg3_q);

    -- reg 4
    reg04: register_16bit PORT MAP (
        D => d_data,
        load => load_reg4,
        Clk => Clk,
        Q => reg4_q);

    -- reg 5
    reg05: register_16bit PORT MAP (
        D => d_data,
        load => load_reg5,
        Clk => Clk,
        Q => reg5_q);

    -- reg 6
    reg06: register_16bit PORT MAP (
        D => d_data,
        load => load_reg6,
        Clk => Clk,
        Q => reg6_q);
    
    -- reg 7
    reg07: register_16bit PORT MAP (
        D => d_data,
        load => load_reg7,
        Clk => Clk,
        Q => reg7_q);
        
    -- reg 8
    reg08: register_16bit PORT MAP (
        D => d_data,
        load => load_reg8,
        Clk => Clk,
        Q => reg8_q);

    -- destination register decoder
    des_decoder_3to8: decoder_3to8 PORT MAP (
        A => dr(2),
        B => dr(1), 
        C => dr(0),
        Q0 => dec_out_0, 
        Q1 => dec_out_1, 
        Q2 => dec_out_2, 
        Q3 => dec_out_3, 
        Q4 => dec_out_4, 
        Q5 => dec_out_5, 
        Q6 => dec_out_6, 
        Q7 => dec_out_7 
     );
     

    -- 8 to 1 source register multiplexer
    b_select_mux : mux_8to1 PORT MAP (
        A => reg0_q,
        B => reg1_q,
        C => reg2_q,
        D => reg3_q,
        E => reg4_q,
        F => reg5_q,
        G => reg6_q,
        H => reg7_q,
        s => sb,
        Z => b_select_z
    );
    
    a_select_mux : mux_8to1 PORT MAP (
        A => reg0_q,
        B => reg1_q,
        C => reg2_q,
        D => reg3_q,
        E => reg4_q,
        F => reg5_q,
        G => reg6_q,
        H => reg7_q,
        s => sa,
        Z => a_select_z
    );
    
    a_sel_mux_2 : mux_2to1 PORT MAP (
        A => a_select_z,
        B => reg8_q,
        s => ta,
        Z => bus_a
    );
    
    
    b_sel_mux_2 : mux_2to1 PORT MAP (
        A => b_select_z,
        B => reg8_q,
        s => tb,
        Z => bus_b
    );
    
     load_reg0 <= dec_out_0 and rw and not td;
     load_reg1 <= dec_out_1 and rw and not td;
     load_reg2 <= dec_out_2 and rw and not td;
     load_reg3 <= dec_out_3 and rw and not td;
     load_reg4 <= dec_out_4 and rw and not td;
     load_reg5 <= dec_out_5 and rw and not td;
     load_reg6 <= dec_out_6 and rw and not td;
     load_reg7 <= dec_out_7 and rw and not td;
     load_reg8 <= td and rw;
    
    reg0 <= reg0_q;
    reg1 <= reg1_q;
    reg2 <= reg2_q;
    reg3 <= reg3_q;
    reg4 <= reg4_q;
    reg5 <= reg5_q;
    reg6 <= reg6_q;
    reg7 <= reg7_q;
    reg8 <= reg8_q;
    
end Behavioral;