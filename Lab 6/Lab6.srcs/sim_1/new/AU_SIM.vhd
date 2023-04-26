----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 02:55:35 PM
-- Design Name: 
-- Module Name: AU_SIM - Behavioral
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

entity AU_SIM is
--  Port ( );
end AU_SIM;

architecture Behavioral of AU_SIM is

    COMPONENT AU 
        PORT (
            RegSel, Clk : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(3 downto 0);
            Carry, Zero : OUT STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;
    
    SIGNAL RegSel, Clk, Carry, Zero : STD_LOGIC;
    SIGNAL A, S : STD_LOGIC_VECTOR(3 downto 0);
    
begin

    UUT : AU PORT MAP (
        RegSel => RegSel,
        Clk => Clk,
        A => A,
        Carry => Carry,
        Zero => Zero,
        S => S
    );
    
    clock_process : process -- background clock process
    begin
        
        Clk <= '0';
        WAIT FOR 5ns;
        Clk <= '1';
        WAIT FOR 5ns;
        
    end process; 
    
    AU_process : process -- AU process
    begin
        -- Index is 210077D = 0011 0011 0100 1001 1101
        -- first addition is 1101 + 1001 = 0110, Carry = 1
        -- set the register 0 value
        A <= "1101";
        RegSel <= '0';
        WAIT FOR 50ns;
        -- set the regsiter 1 value
        A <= "1001";
        RegSel <= '1';
        WAIT FOR 50ns;
                
        -- second operation is 0100 + 0011 = 0111, Carry  = 0
        RegSel <= '0';
        A <= "0100";
        WAIT FOR 50ns;
        
        RegSel <= '1';
        A <= "0011";
        WAIT FOR 50ns;
        
        WAIT; -- wait forever
        
    end process;
    
end Behavioral;
