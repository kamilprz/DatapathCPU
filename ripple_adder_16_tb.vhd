

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ripple_adder_16_tb is
end ripple_adder_16_tb;

architecture Behavioral of ripple_adder_16_tb is
    
component ripple_adder_16
        port( A : in std_logic_vector(15 downto 0);
              B    : in std_logic_vector (15 downto 0);
              Cin  : in std_logic;
              C : out std_logic;
              V : out std_logic;
              Z    : out std_logic_vector (15 downto 0));
end component;
    
    -- signals
    signal A, B, Z : std_logic_vector(15 downto 0) := (others => '0');
--signal carries : std_logic_vector(16 downto 0) := (others => '0');
    signal Cin, V, C : std_logic := '0';
    
begin
    uut : ripple_adder_16 PORT MAP(
        A => A,
        B => B,
        Cin => Cin,
        C => C,
        V => V,
        Z => Z
    );
    
    
    stim_process: process
        begin
       wait for 100 ns;	
      
          -- 0 + 0 = 0
          A <= x"0000";
          B <= x"0000";
          Cin <= '0';
        wait for 100 ns;
              
          -- 2 + 2 = 4
          A <= x"0000";
          B <= x"0000";
          Cin <= '1';
        wait for 100 ns;
              
          -- 0 + 0 + 1 = 1
          A <= x"0001";
          B <= x"0001";
          Cin <= '0';
        wait for 100 ns;
          
          -- 65535 + 65535 = 0 (+ carry)
          A <= x"FFFF";
          B <= x"FFFF";
          Cin <= '0';
        wait for 100 ns;
        
        
        ------------------------------------------------------------------ OVERFLOW ???????????????????????? ---------------------------------------------------------

        
        end process;

end;
