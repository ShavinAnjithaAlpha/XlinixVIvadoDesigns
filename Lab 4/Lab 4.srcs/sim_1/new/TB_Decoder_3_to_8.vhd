----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name: Shavin Anjitha
-- Create Date: 03/21/2023 05:59:24 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is

    Component Decoder_3_to_8 PORT (
        I : in STD_LOGIC_VECTOR;
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR
    );
    End Component;
    
    SIGNAL I : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL EN : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR(7 downto 0);

begin
    
    
    UUT: Decoder_3_to_8 PORT MAP (
        I => I,
        EN => EN,
        Y => Y
    );
    
    process
    begin
    
        -- My Index Number is 210077D
        -- 210077 = 0011 0011 0100 1001 1101 in binary
        -- 110 011 010 010 011 101
        
        EN <= '1';
        I <= "101";
        WAIT FOR 100ns;
        
        I <= "011";
        WAIT FOR 100ns;
        
        I <= "010";
        WAIT FOR 100ns;
        
        I <= "110";
        WAIT FOR 100ns;
        
        WAIT; -- wait forever
    end process;

end Behavioral;
