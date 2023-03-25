----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 05:16:52 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Name - Shavin Anjitha
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

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is

    Component Decoder_2_to_4
        PORT (
            I : in STD_LOGIC_VECTOR(1 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
     End Component;
     
     SIGNAL I : STD_LOGIC_VECTOR(1 downto 0);
     SIGNAL EN : STD_LOGIC;
     SIGNAL Y : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: Decoder_2_to_4 PORT MAP (
        I => I,
        EN => EN,
        Y => Y
    );
    
    process
    begin
        -- set EN to 0
        EN <= '0';
        I <= "00";
        WAIT FOR 100ns;
        
        I <= "01";
        WAIT FOR 100ns;
        
        I <= "10";
        WAIT FOR 100ns;
        
        I <= "11";
        WAIT FOR 100ns;
        
        -- set EN to 1
        EN <= '1';
        I <= "00";
        WAIT FOR 100ns;
                
        I <= "01";
        WAIT FOR 100ns;
                
        I <= "10";
        WAIT FOR 100ns;
                
        I <= "11";
        WAIT FOR 100ns;
        
        WAIT; -- wait forever
    end process;
        
        
        


end Behavioral;
