----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 07:36:51 PM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1 - Behavioral
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

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is

    Component Mux_8_to_1 PORT (
        S : in STD_LOGIC_VECTOR(2 downto 0);
        EN : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(7 downto 0);
        Y : out STD_LOGIC
    );
    End Component;
    
    SIGNAL S : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL D : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL EN, Y : STD_LOGIC;
    
begin

    UUT: Mux_8_to_1 PORT MAP (
        S => S,
        EN => EN,
        D => D,
        Y => Y
    );
    
    process
    begin
    
        EN <= '1';
        D <= "11001100";
        
        -- My Index Number is 210077D
        -- 210077 = 0011 0011 0100 1001 1101 in binary
        -- 110 011 010 010 011 101
        
        S <= "101";
        WAIT FOR 100ns;
        
        S <= "011";
        WAIT FOR 100ns;
        
        S <= "010";
        WAIT FOR 100ns;
        
        S <= "110";
        WAIT FOR 100ns;
        
        WAIT; -- wait forever
    end process;

end Behavioral;
