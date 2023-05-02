----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 02:55:33 PM
-- Design Name: 
-- Module Name: LUT_Sim - Behavioral
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

entity LUT_Sim is
--  Port ( );
end LUT_Sim;

architecture Behavioral of LUT_Sim is

    COMPONENT LUT_16_7 
        PORT (
            address : IN STD_LOGIC_VECTOR(3 downto 0);
            data : OUT STD_LOGIC_VECTOR(6 downto 0)
        );
    END COMPONENT; 
    
    SIGNAL address : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL data : STD_LOGIC_VECTOR(6 downto 0);
    
begin

    UUT : LUT_16_7 PORT MAP (
        address => address,
        data => data
    );
    
    process
    begin
        
        -- Index Number is 210077D = 0011 0011 0100 1001 1101
        -- first = 1101
        address <= "1101";
        WAIT FOR 10ns;
        
        -- second  = 1001
        address <= "1001";
        WAIT FOR 10ns;
        
        -- third = 0100
        address <= "0100";
        WAIT FOR 10ns;
        
        -- fourth = 0011
        address <= "0011";
        WAIT FOR 10ns;
        
       WAIT;
    end process;
        
end Behavioral;
