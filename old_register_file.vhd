
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file is
 Port ( src_s : in std_logic_vector(2 downto 0);
        des_A0 : in std_logic;
        des_A1 : in std_logic;
        des_A2 : in std_logic;
        clk : in std_logic;
        data_src : in std_logic;
        data : in std_logic_vector(15 downto 0);
        reg0 : out std_logic_vector(15 downto 0);
        reg1 : out std_logic_vector(15 downto 0);
        reg2 : out std_logic_vector(15 downto 0);
        reg3 : out std_logic_vector(15 downto 0);
        reg4 : out std_logic_vector(15 downto 0);
        reg5 : out std_logic_vector(15 downto 0);
        reg6 : out std_logic_vector(15 downto 0);
        reg7 : out std_logic_vector(15 downto 0)
         );
end register_file;

architecture Behavioral of register_file is
       -- 16 bit register
       COMPONENT register_16bit
       Port( D : in std_logic_vector(15 downto 0);
             load : in std_logic;
             clk : in std_logic;
             Q : out std_logic_vector(15 downto 0)
             );
        END COMPONENT;
        
        -- decoder
        COMPONENT decoder_3to8
        Port ( A : in std_logic;
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
        END COMPONENT;
        
        -- mux_2to1
        COMPONENT mux_2to1
        Port ( A, B : in std_logic_vector(15 downto 0);
               S : in std_logic;
               Z : out std_logic_vector(15 downto 0));
        END COMPONENT;
        
        -- mux_8to1
        COMPONENT mux_8to1
        Port ( A, B , C, D, E, F, G, H : in std_logic_vector(15 downto 0);
               S : in std_logic_vector (2 downto 0);
               Z : out std_logic_vector(15 downto 0));
        END COMPONENT;
        
        
        -- signals
        signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;
        signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q : std_logic_vector(15 downto 0);
        signal data_src_mux_out, src_reg : std_logic_vector(15 downto 0);
        
begin
    -- port maps
    -- register 0
    reg00 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg0,
        clk => clk,
        Q => reg0_q
    );
    -- register 1
    reg01 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg1,
        clk => clk,
        Q => reg1_q
    );
    -- register 2
    reg02 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg2,
        clk => clk,
        Q => reg2_q
    );
    -- register 3
    reg03 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg3,
        clk => clk,
        Q => reg3_q
    );
    -- register 4
    reg04 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg4,
        clk => clk,
        Q => reg4_q
    );
    -- register 5
    reg05 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg5,
        clk => clk,
        Q => reg5_q
    );
    -- register 6
    reg06 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg6,
        clk => clk,
        Q => reg6_q
    );
    -- register 7
    reg07 : register_16bit PORT MAP(
        D => data_src_mux_out,
        load => load_reg7,
        clk => clk,
        Q => reg7_q
    );
    
    -- destination register decoder
    des_decoder_3to8 : decoder_3to8 PORT MAP(
        A => des_A0,
        B => des_A1,
        C => des_A2,
        Q0 => load_reg0,
        Q1 => load_reg1,
        Q2 => load_reg2,
        Q3 => load_reg3,
        Q4 => load_reg4,
        Q5 => load_reg5,
        Q6 => load_reg6,
        Q7 => load_reg7
    );
    
    
    -- 2 to 1 multiplexer
    data_src_mux_2to1 : mux_2to1 PORT MAP(
        A => data,
        B => src_reg,
        S => data_src,
        Z => data_src_mux_out
    );
    
    
    -- 8 to 1 multiplexer
    inst_mux_8to1 : mux_8to1 PORT MAP(
        A => reg0_q,
        B => reg1_q,
        C => reg2_q,
        D => reg3_q,
        E => reg4_q,
        F => reg5_q,
        G => reg6_q,
        H => reg7_q,
        s => src_s,
        Z => src_reg
    );
    
    reg0 <= reg0_q;
    reg1 <= reg1_q;
    reg2 <= reg2_q;
    reg3 <= reg3_q;
    reg4 <= reg4_q;
    reg5 <= reg5_q;
    reg6 <= reg6_q;
    reg7 <= reg7_q;
    
end Behavioral;
