----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 03:28:12 PM
-- Design Name: 
-- Module Name: AU_7_seg_Sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU_7_seg_Sim is
--  Port ( );
end AU_7_seg_Sim;

architecture Behavioral of AU_7_seg_Sim is

    COMPONENT AU_7_seg 
       PORT (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            RegSel : in STD_LOGIC;
            Clk : in STD_LOGIC;
            S_LED : out STD_LOGIC_VECTOR(3 downto 0);
            S_7Seg : out STD_LOGIC_VECTOR(6 downto 0);
            Carry : out STD_LOGIC;
            Zero : out STD_LOGIC
       );
    END COMPONENT;
    
    SIGNAL A, S_LED : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL RegSel, Clk, Carry, Zero : STD_LOGIC;
    SIGNAL S_7Seg : STD_LOGIC_VECTOR(6 downto 0);
    
begin

    UUT : AU_7_Seg PORT MAP(
        A => A,
        RegSel => RegSel,
        Clk => Clk,
        S_LED => S_LED,
        S_7Seg => S_7Seg,
        Carry => Carry,
        Zero => Zero
    );
    
    clock_process : process -- background clock process
        begin
    
        Clk <= '0';
        WAIT FOR 5ns;
        Clk <= '1';
        WAIT FOR 5ns;
    
     end process; 
        
     AU_LUT_process : process -- AU_LUT process
          begin
          -- Index is 210077D = 0011 0011 0100 1001 1101
          -- first addition is 1101 + 1001 = 0110, Carry = 1
          -- set the register 0 value
          A <= "1101";
          RegSel <= '0';
          WAIT FOR 50ns;
          -- set the register 1 value
          A <= "1001";
          RegSel <= '1';
          WAIT FOR 50ns;
          RegSel <= '1';
          WAIT FOR 50ns;
         
          -- second operation is 0100 + 0011 = 0111, Carry = 0
          RegSel <= '0';
          A <= "0100";
          WAIT FOR 50ns;
         
          RegSel <= '1';
          A <= "0011";
          WAIT FOR 50ns;
         
          WAIT; -- wait forever
     
     end process;
  
      
end Behavioral;
